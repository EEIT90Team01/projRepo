package controller;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;
import model.OrderDetailPK;
import model.ShopBean;
import model.ShopServices;
import model.dao.MemberDAO;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class ShopController {
	int count = 0;
	int all = 0;
	Map<String, List<ShopBean>> shopBean = new HashMap<String, List<ShopBean>>();
	Map<String, ShopBean> pruduct = new HashMap<String, ShopBean>();
	Map<String, OrderDetailBean> car = new HashMap<String, OrderDetailBean>();
	Map<String, String> login = new HashMap<String, String>();
	@Autowired
	@Resource(name = "shopServices")
	ShopServices shopServices;
	@Resource(name = "memberDao")
	MemberDAO memberDao;
	// @RequestMapping(path = "/DataTable.controller", produces =
	// "application/json; charset=utf-8")
	// public String delectOrder(HttpSession session) {
	// }

	@RequestMapping(path = "/DataTable.controller", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String DataTable(HttpSession session, Integer draw, Integer start, Integer length,
			@RequestParam(name = "search[value]") String search,
			@RequestParam(name = "order[0][column]") String orderCol, @RequestParam(name = "order[0][dir]") String dir,
			HttpServletRequest req) throws JSONException {

		String OrderColNam = req.getParameter(("columns[" + orderCol + "][data]"));
		MemberBean Mbr = (MemberBean) session.getAttribute("loginOK");

		return shopServices.PageList(Mbr.getMbrSN(), length, start, draw, orderCol, dir, search, OrderColNam)
				.toString();

	}

	// WriteOrder.controller
	@RequestMapping(path = "/writeOrder.controller")
	public String WriteOrder(String insert, HttpServletRequest req, HttpSession session, String mbrSN,
			String orderAmount, String name, String tel, String phone, String email, String address)
			throws ParseException, MessagingException, IOException {// 寫入訂單的controller

		if (insert != null) {
			OrderBean orderBean = new OrderBean(Integer.parseInt(orderAmount), email, address, name, tel, phone);
			session.setAttribute("order", orderBean);
			return "orderOver";
		}

		String image = req.getParameter("image").substring(22);
		Thread thread = new Thread(new Runnable() {
			public void run() {
				try {
					System.out.println("寄信中");
					shopServices.sendMain(name, image, email);
				} catch (MessagingException | IOException e) {
					System.out.println("寄信錯誤");
					e.printStackTrace();
				}
			}
		});
		thread.start();
		Thread thread1 = new Thread(new Runnable() {
			OrderBean OrderBean;

			public void run() {
				try {
					OrderBean = shopServices.newOrderAndDetail(new OrderBean(image, email, address, name, tel, phone),
							mbrSN, orderAmount, car);
				} catch (ParseException e) {
					System.out.println("NEW訂單失敗");
					e.printStackTrace();
				}
				session.setAttribute("order", OrderBean);
			}
		});
		thread1.start();

		return "orderOver";
	}

	// shop controller
	@RequestMapping(path = "/Shop.controller")
	public String Shop(Model model, HttpServletResponse response, HttpSession session, String gameClass, String ID,
			String user, String pass, String name, Integer price, String clearCar) throws IOException {
		if (session.isNew() || count == 0 || clearCar != null) {
			// 如果是第一次進入的人 清空購物車
			session.setAttribute("ALL", 0);
			session.setAttribute("count", 0);
			car.clear();
			count = 0;
		}

		if (clearCar != null) {
			return "list";
		}

		if (name != null) {
			// name==我放入購物車的商品的編號

			count++;
			if (car.get(name) == null) {// 先進去購物車找
				OrderDetailPK PK = new OrderDetailPK();
				OrderDetailBean orderDetailBean = new OrderDetailBean();
				PK.setGameSN(shopServices.select(Integer.parseInt(name)));
				orderDetailBean.setPK(PK);
				orderDetailBean.setQuantity(1);
				car.put(name, orderDetailBean);

				System.out.println("第一次加入" + name + "商品 比數=" + orderDetailBean.getQuantity());
			} else {
				OrderDetailBean a = car.get(name);
				a.setQuantity(a.getQuantity().intValue() + 1);
				car.put(name, a);
				System.out.println("更新" + name + "商品" + car.get(name).getQuantity());
			}

			session.setAttribute("cars", car);

			session.setAttribute("count", count);
			try {
				all = (int) session.getAttribute("ALL");
			} catch (Exception e) {
				session.setAttribute("ALL", 0);
				all = 0;
				count = 0;
			}

			session.setAttribute("ALL", all + price);
			// &#x76EE;&#x524D;&#x4EF6;&#x6578 == 目前件數
			// &#x76EE;&#x524D;&#x91D1;&#x984D == 目前金額
			response.getWriter().write("<font color='red'>&#x76EE;&#x524D;&#x91D1;&#x984D;" + (all + price)
					+ "<br>&#x76EE;&#x524D;&#x4EF6;&#x6578;" + count + "</font>");
			return null;
		}

		// ShopBean bean =
		// shopServices.getShopDao().getSession().get(ShopBean.class, 1);

		// if(user==null|"".equals(user.trim())){
		// System.out.println("user==null");
		// login.put("userError ", "請輸入帳號");
		// return "login.jsp";
		// }

		if (ID == null) {// 把要查詢的遊戲類別送去比對
			if ("".equals(gameClass) || gameClass == null) {
				gameClass = "1";
			}
			List<ShopBean> ShopBean = shopServices.selectAll(gameClass);
			// 放入拿到的資料
			shopBean.put("shopBean", ShopBean);
			session.setAttribute("shopBean", shopBean);
			return "list";
		} else {// 第幾筆商品
			pruduct.put("pruduct", shopServices.select(Integer.parseInt(ID)));
			model.addAllAttributes(pruduct);
			return "pruduct";
		}
	}

	// order controller

	@RequestMapping(path = "/order.controller")
	public String Order(String delectCar, String goOrder, HttpSession session, String change, String value,
			String GameSN) throws ParseException {

		if (delectCar != null) {// 按下取消
			car.remove(delectCar);
			all = 0;
			count = 0;

			for (String a : car.keySet()) {
				int b = car.get(a).getQuantity();
				int c = car.get(a).getPK().getGameSN().getPrice();
				all += (b * c);
				count += b;

			}
			session.setAttribute("count", count);
			session.setAttribute("ALL", all);
			return "checkOut";
		}
		if (change != null) {
			all = 0;
			count = 0;
			car = (Map<String, OrderDetailBean>) session.getAttribute("cars");
			OrderDetailBean orderDetailBean = car.get(GameSN);
			if (Integer.parseInt(value) > (orderDetailBean.getPK().getGameSN().getStockQuantity().intValue())) {
				System.out.println("庫存不足");
				return "index";
			}
			;
			orderDetailBean.setQuantity(Integer.parseInt(value));
			car.put(GameSN, orderDetailBean);

			for (String a : car.keySet()) {
				int b = car.get(a).getQuantity();
				int c = car.get(a).getPK().getGameSN().getPrice();
				all += (b * c);
				count += b;

			}
			session.setAttribute("count", count);
			session.setAttribute("ALL", all);
			return "checkOut";
		}

		return "checkOut";
	}

	@Autowired
	private Producer captchaProducer = null;

	@RequestMapping(path = "/Image.controller")
	public ModelAndView Image(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String kaptchaExpected = (String) request.getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		// System.out.println("code = " + code + "\nkaptchaExpected =
		// "+kaptchaExpected );
		response.setDateHeader("Expires", 0);

		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");

		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");

		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");

		// return a jpeg
		response.setContentType("image/jpeg");

		// create the text for the image
		String capText = captchaProducer.createText();

		// store the text in the session
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);

		// create the image with the text
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();

		// write the data out
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			System.out.println("close");
			out.close();
		}
		return null;
	}

	// login controller
	@RequestMapping(path = "/login/login.controller")
	public String login(String kaptcha, HttpSession session, HttpServletResponse response, String user, String pass)
			throws IOException, ParseException {
		String code = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

		if (kaptcha == null || kaptcha.trim().length() == 0) {
			session.setAttribute("loginError", "驗證碼輸入錯誤");
			return "login";
		}
		if (!code.equals(kaptcha) && kaptcha.trim().length() != 0) {
			System.out.println("驗證碼比對失敗");
			session.setAttribute("loginError", "驗證碼輸入錯誤");
			return "login";
		} else {
			if (session.getAttribute("loginOK") != null) {
				return "list";
			}
			if (pass == null || pass.trim().equals("") || user == null || user.trim().equals("")) {
				session.setAttribute("loginError", "帳號或密碼輸入錯誤");
				return "login";
			}
			if (user != null && pass != null) {
				System.out.println("checkMember");
				MemberBean memberBean = shopServices.checkMember(user, pass);
				String url = (String) session.getAttribute("url");
				if (memberBean != null) {
					session.setAttribute("count", 1);
					session.setAttribute("loginOK", memberBean);
					session.setAttribute("car", car);
					session.removeAttribute("loginError");
					if (url == null || url.trim().length() == 0) {
						url = "list";
					}
					return url;
				} else {// 密碼錯誤
					session.setAttribute("loginError", "帳號或密碼輸入錯誤");
					return "login";
				}
			}
		}
		return null;
	}

	@RequestMapping(path = "/logout.controller")
	public String logout(HttpSession session, HttpServletResponse response) {
		session.setAttribute("ALL", 0);
		session.setAttribute("count", 0);
		session.removeAttribute("loginOK");
		car.clear();
		count = 0;
		return "home";
	}

	String access_token = "";

	@RequestMapping(path = "/googleLogin.controller")
	public String googleLogin(String code, HttpSession session, HttpServletResponse response, HttpServletRequest req)
			throws Exception {
		System.out.println(code);
		URL urlObtainToken = new URL("https://accounts.google.com/o/oauth2/token");
		HttpURLConnection connectionObtainToken = (HttpURLConnection) urlObtainToken.openConnection();
		connectionObtainToken.setRequestMethod("POST");
		connectionObtainToken.setDoOutput(true);
		OutputStreamWriter writer = new OutputStreamWriter(connectionObtainToken.getOutputStream());
		writer.write("code=" + code + "&"); // 取得Google回傳的參數code
		writer.write("client_id=451639246634-4m1oh7enkiqquk8hje60mfm9ve47onfs.apps.googleusercontent.com&"); // 這裡請將xxxx替換成自己的client_id
		writer.write("client_secret=Dhm_JQEV5en-oyRYoXeshyAc&"); // 這裡請將xxxx替換成自己的client_serect
		writer.write("redirect_uri=http://localhost:8080/FlipYouth/googleLogin.controller&");
		writer.write("grant_type=authorization_code");
		writer.close();
		JSONObject jo = null;
		if (connectionObtainToken.getResponseCode() == HttpURLConnection.HTTP_OK) {
			StringBuilder sbLines = new StringBuilder("");
			// 取得Google回傳的資料(JSON格式)
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(connectionObtainToken.getInputStream(), "utf-8"));
			String strLine = "";
			while ((strLine = reader.readLine()) != null) {
				sbLines.append(strLine);
			}

			// 把上面取回來的資料，放進JSONObject中，以方便我們直接存取到想要的參數
			jo = new JSONObject(sbLines.toString());
			access_token = jo.getString("access_token");
			System.out.println("*************** access token *******************");
			System.out.println(access_token);
			response.sendRedirect("/FlipYouth/getData.controller");
		}
		return null;
	}

	@RequestMapping(path = "/getData.controller")
	public String getGData(HttpSession session) throws Exception {

		System.out.println("getGoogleData");
		URL getUser = new URL("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token);
		HttpURLConnection getUserConnection = (HttpURLConnection) getUser.openConnection();
		getUserConnection.setRequestMethod("GET");
		getUserConnection.setDoOutput(true);
		getUserConnection.setDoInput(true);
		getUserConnection.setRequestProperty("Content-type", "application/json");
		if (getUserConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
			System.out.println("maker1-2");
			StringBuilder sbLines1 = new StringBuilder("");
			BufferedReader reader1 = new BufferedReader(
					new InputStreamReader(getUserConnection.getInputStream(), "utf-8"));
			String strLine1 = "";
			while ((strLine1 = reader1.readLine()) != null) {
				sbLines1.append(strLine1);
			}
			JSONObject userData = new JSONObject(sbLines1.toString());
			String name = userData.getString("name");
			String id = userData.getString("id");
			String email = userData.getString("email");
			String picture = userData.getString("picture");
			System.out.println(picture);
			URL url2 = new URL(picture);
			InputStream uc = url2.openStream();
			byte[] imageBytes = IOUtils.toByteArray(uc);
			uc.close();
			System.out.println(imageBytes);
			Integer MemberId = shopServices.checkGMember(id);
			if (MemberId == 0) {
				MemberBean member = new MemberBean();
				member.setMbrName(name);
				member.setMbrEmail(email);
				member.setImage(imageBytes);
				member.setMbrId(email);
				member.setMbrPassword("尚未建立密碼");
				session.setAttribute("GMember", member);
				session.setAttribute("GID", id);
				return "addGMember";
			} else {
				session.setAttribute("loginOK", (MemberBean) shopServices.selectMbr(MemberId));
				return "home";
			}
		} else {
			System.out.println("getUserConnection.getResponseCode() =  " + getUserConnection.getResponseCode());
		}
		System.out.println("maker3");
		return "home";
	}

	@RequestMapping(path = "/addGMember.controller")
	public String addGMember(String gender, HttpSession session, String nickName, String phone, String address)
			throws Exception {
		MemberBean Gmbr = (MemberBean) session.getAttribute("GMember");
		Gmbr.setNickName(nickName);
		Gmbr.setAddress(address);
		Gmbr.setGender(gender);
		Gmbr.setPhone(phone);
		Gmbr.setMbrState(0);
		Gmbr.setEnergy(10);
		Gmbr.setRptCounter(0);
		Gmbr.setActivatedCode(new byte[] { 0 });
		String GID = (String) session.getAttribute("GID");
		MemberBean MemberBean = shopServices.addGmber(Gmbr, GID);
		session.setAttribute("loginOK", MemberBean);
		return "home";
	}

	@RequestMapping(path = "/FBLogin.controller")
	@ResponseBody
	public String FBLogin(String code, HttpSession session, HttpServletResponse response, HttpServletRequest req)
			throws Exception {
		String fbApi = "https://graph.facebook.com/me?";
		String fields = "fields=id,name,picture.height(400),email&";
		String access_token = "access_token=" + code;
		URL getUser = new URL(fbApi + fields + access_token);
		System.out.println(fbApi + fields + access_token);
		HttpURLConnection getUserConnection = (HttpURLConnection) getUser.openConnection();
		getUserConnection.setRequestMethod("GET");
		getUserConnection.setDoOutput(true);
		getUserConnection.setDoInput(true);
		getUserConnection.setRequestProperty("Content-type", "application/json");
		getUserConnection.setRequestProperty("Content-Language", "zh-TW");

		if (getUserConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
			StringBuilder sbLines1 = new StringBuilder("");
			BufferedReader reader1 = new BufferedReader(
					new InputStreamReader(getUserConnection.getInputStream(), "big5"));
			String strLine1 = "";
			while ((strLine1 = reader1.readLine()) != null) {
				sbLines1.append(strLine1);
			}
			JSONObject mbrData = new JSONObject(sbLines1.toString());
			String id = mbrData.get("id").toString();
			String name = new String(mbrData.get("name").toString().getBytes("UTF-8"), "utf-8");
			String pictureURL = new JSONObject(
					new JSONObject(new String(mbrData.get("picture").toString().getBytes("utf-8"), "utf-8")).get("data")
							.toString()).get("url").toString();
			String email = new String(mbrData.get("email").toString().getBytes("utf-8"), "utf-8").toString();
			System.out.println("id= " + id + "\nname = " + name + "\npicture = " + pictureURL + "\nemail = " + email);

			Integer mbrSN = shopServices.checkFBMember(id);
			if (mbrSN == 0) {
				URL url2 = new URL(pictureURL);
				InputStream uc = url2.openStream();
				byte[] imageBytes = IOUtils.toByteArray(uc);
				MemberBean member = new MemberBean();
				member.setImage(imageBytes);
				member.setMbrName(name);
				member.setMbrEmail(email);
				member.setMbrId(email);
				member.setMbrPassword("尚未建立密碼");
				session.setAttribute("FBMember", member);
				session.setAttribute("FBID", id);
				return "/FlipYouth/Tim/login/addFBMember.jsp";
			} else {
				session.setAttribute("loginOK", (MemberBean) shopServices.selectMbr(mbrSN));
				return "/FlipYouth/home.jsp";
			}
		}
		return "home";
	}

	
	
	@RequestMapping(path = "/addFBMember.controller")
	public String addFBMember(String gender, HttpSession session, String nickName, String phone, String address)
			throws Exception {
		MemberBean FBmbr = (MemberBean) session.getAttribute("FBMember");
		FBmbr.setNickName(nickName);
		FBmbr.setAddress(address);
		FBmbr.setGender(gender);
		FBmbr.setPhone(phone);
		FBmbr.setMbrState(0);
		FBmbr.setEnergy(10);
		FBmbr.setRptCounter(0);
		FBmbr.setActivatedCode(new byte[] { 0 });
		String FBID = (String) session.getAttribute("FBID");
		MemberBean MemberBean = shopServices.addFBmber(FBmbr, FBID);
		session.setAttribute("loginOK", MemberBean);
		return "home";
	}
}


package model;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.InternetHeaders;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDAO;
import model.dao.OrderDao;
import model.dao.ShopDao;

@Service(value = "shopServices")
@Transactional
public class ShopServices {
	@Autowired
	@Resource(name = "shopDao")
	ShopDao shopDao;

	@Autowired
	@Resource(name = "memberDao")
	MemberDAO memberDao;

	@Autowired
	@Resource(name = "OrderDao")
	OrderDao orderDao;
	
	public void getOrderData(int SN) {
		List<OrderBean> orderAll = orderDao.selectOrderAll(SN);
		JSONArray JSON = new JSONArray();
		StringBuffer SB=new StringBuffer();
		for (int i = 0; i < orderAll.size(); i++) {
			JSONObject a = new JSONObject(orderAll.get(i));
			a.remove("image");
			
			
			System.out.println(a.get("orderDate").toString());
//			String b =a.get("orderDate").toString().split("年|月|日","b");
			
//			a.put("star",);
			System.out.println(a);
//			System.out.println(a);
			JSON.put(i, a);
			
		}
		
		System.out.println(JSON);
	}

	public JSONObject getGameData(String search, String gameClass, String orderBy, String theme, String mix, String max,
			String[] checkbox, Integer maxGameSN, Integer mixGameSN) {

		StringBuffer from = new StringBuffer("from ShopBean ");
		StringBuffer from1 = new StringBuffer("from Game ");
		String GameClass = "where Gameclass like '%" + gameClass + "%'";
		String[] Theme = theme.split("\\s");
		StringBuffer STheme = new StringBuffer("");
		String orderby = "";
		StringBuffer language = new StringBuffer("");
		StringBuffer priceRange = new StringBuffer(" and Price BETWEEN ");
		if (search != null && search.trim().length() != 0) {
			search = " and gamename like'%" + search + "%' ";
		} else {
			search = "";
		}
		priceRange.append(mix).append(" and ").append(max);

		if (!"".equals(orderBy) || orderBy != null) {
			orderby = " order by Price " + orderBy;
		}

		if (!"".equals(theme.trim())) {
			STheme = new StringBuffer("and (");
			for (int i = 0; i < Theme.length; i++) {
				STheme.append("StrGameTheme").append(" like '%").append(Theme[i]).append("%' ");
				if (i != Theme.length - 1) {
					STheme.append("or ");
				} else {
					STheme.append(")");
				}

			}
		}
		if (STheme.indexOf("全部") != -1) {
			STheme = new StringBuffer();
		}
		if (checkbox.length != 0) {
			language = new StringBuffer(" and (");
			for (int i = 0; i < checkbox.length; i++) {
				language.append(" StrLanguage = ").append("'").append(checkbox[i]).append("'");
				if (i != checkbox.length - 1) {
					language.append(" or ");
				} else {
					language.append(")");
				}
			}
		}

		String Query = from.append(GameClass).append(STheme).append(language).append(priceRange).append(search)
				.append(orderby).toString();
		String Query1 = from1.append(GameClass).append(STheme).append(language).append(priceRange).append(search)
				.toString();

		List<ShopBean> gameList = shopDao.getGameData(Query, maxGameSN, mixGameSN);
		JSONObject JSONOB = new JSONObject();
		List<JSONObject> jsons = new ArrayList<JSONObject>();
		for (Object a : gameList) {
			JSONObject b = new JSONObject(a);
			b.remove("div1");
			jsons.add(b);
		}
		Map<String, Object> jsonAll = new HashMap<String, Object>();
		int total = shopDao.getGameCount(Query1);
		int page = total / maxGameSN;
		if (page + "".indexOf(".") != -1) {
			page += 1;
		}
		if (page == 0) {
			page++;
		}
		jsonAll.put("data", jsons);
		jsonAll.put("total", total);
		jsonAll.put("page", page);
		// System.out.println(jsonAll);
		return new JSONObject(jsonAll);
	}

	public OrderBean newOrderAndDetail(OrderBean orderBean, String mbrSN, String orderAmount,
			Map<String, OrderDetailBean> car) throws ParseException {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, +3);

		System.err.println("mbrSN =  " + mbrSN);
		orderBean.setMbrSN(Integer.parseInt(mbrSN));
		orderBean.setOrderAmount(Integer.parseInt(orderAmount));
		orderBean.setOrderDate(new SimpleDateFormat("yyyy-MM-dd HH:mm")
				.parse(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new java.util.Date())));
		orderBean.setOrderState("未付款");
		orderBean.setPaymentMethod("超商取貨付款");
		orderBean.setFreight(100);
		orderBean.setProductDelivery(df.parse(df.format(cal.getTime())).toString());
		orderBean.setShippedDate(df.parse(df.format(cal.getTime())));
		return orderDao.save(orderBean, car);
	}

	public ShopBean select(int id) {
		return shopDao.select(id);
	}

	public MemberBean checkMember(String user, String pass) {
		MemberBean memberBean = memberDao.select(user);
		if (memberBean == null) {
			return null;
		}
		if (pass.trim().equals(memberBean.getMbrPassword().trim())) {
			return memberBean;
		} else {
			return null;
		}
	}

	public List<ShopBean> selectAll(String id) {// 進行比對
		switch (id) {
		case "1":
			id = "";
			return shopDao.select(id);
		case "2":
			id = "where Gameclass like '%自有商品%'";
			return shopDao.select(id);
		case "3":
			id = "where Gameclass like '%派對遊戲%'";
			return shopDao.select(id);
		case "4":
			id = "where Gameclass like '%親子桌遊%'";
			return shopDao.select(id);
		case "5":
			id = "where Gameclass like '%輕度策略%'";
			return shopDao.select(id);
		case "6":
			id = "where Gameclass like '%重度策略%'";
			return shopDao.select(id);
		case "7":
			id = "where Gameclass like '%台灣原創%'";
			return shopDao.select(id);
		case "8":
			id = "where Gameclass like '%麥卡貝推%'";
			return shopDao.select(id);
		case "9":
			id = "where Gameclass like '%卡套%'";
			return shopDao.select(id);
		}
		return shopDao.select("1");
	}

	static MimeBodyPart picturePart = new MimeBodyPart();

	public void sendMain(String name, String image, String OrderEmail) throws MessagingException, IOException {
		int port = 587;
		final String username = "flipyoutheeit90@gmail.com";
		final String password = "iiieeit90";
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", port);
		MimeBodyPart textPart = new MimeBodyPart();
		StringBuffer html = new StringBuffer();

		addMsg(image, name, html);

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		textPart.setContent(html.toString(), "text/html; charset=UTF-8");
		Message message = new MimeMessage(session);
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(OrderEmail));
		message.setSubject("FlipYouth訂單明細");
		Multipart email = new MimeMultipart();
		email.addBodyPart(textPart);
		email.addBodyPart(picturePart);
		message.setContent(email);

		Transport transport = session.getTransport("smtp");
		transport.connect("smtp.gmail.com", port, username, password);
		Transport.send(message);
		System.out.println("寄送email結束.");
	}

	public static void addMsg(String image, String name, StringBuffer html) throws MessagingException, IOException {
		html.append("<h4>親愛的 " + name + "您好：</h4>");
		html.append("<h4>期望您有美好的購物經驗，欲查詢出貨進度，請使用訂單查詢功能</h4>");
		html.append("<h4>如有其他問題，歡迎來電客服，我們有專人為您服務。</h4>");
		html.append("<img style='width:500px' src='cid:image'/><br>");
		InternetHeaders headers = new InternetHeaders();
		headers.addHeader("Content-Type", "image/jpeg");
		headers.addHeader("Content-Transfer-Encoding", "base64");
		byte[] bytearray = image.getBytes();
		picturePart = new MimeBodyPart(headers, bytearray);
		picturePart.setContentID("<image>");
		picturePart.setFileName("xxx.jpg");

	}

	public static int recordsTotal;

	public static void setRecordsTotal(int recordsTotal) {
		ShopServices.recordsTotal = recordsTotal;
	}

	public JSONObject PageList(Integer MbrSN, Integer length, Integer start, Integer draw, String orderCol, String dir,
			String search, String OrderColNam) {
		List<OrderBean> list = orderDao.PageList(MbrSN, length, start, draw, orderCol, dir, search, OrderColNam);
		List<JSONObject> jsons = new ArrayList<JSONObject>();
		for (OrderBean json : list) {
			jsons.add(new JSONObject(json));
		}

		Map<String, Object> jsonAll = new HashMap<String, Object>();
		jsonAll.put("draw", draw);
		jsonAll.put("recordsTotal", recordsTotal);
		jsonAll.put("recordsFiltered", recordsTotal);
		jsonAll.put("data", jsons);
		return new JSONObject(jsonAll);
	}

	public int checkGMember(String SN) {
		return shopDao.checkGMember(SN);
	}

	public void addGMbr() {

	}

	public MemberBean addGmber(MemberBean Gmbr, String GID) {

		return shopDao.savegMbrAndGID(Gmbr, GID);
	}

	public MemberBean selectMbr(Integer SN) {
		return (MemberBean) shopDao.selectMbr(SN);
	}

	public Integer checkFBMember(String id) {
		return shopDao.checkFBMember(id);
	}

	public model.MemberBean addFBmber(MemberBean fBmbr, String fBID) {
		return shopDao.savegMbrAndFBID(fBmbr, fBID);
	}

	public void delectOrder(String orderSN) {
		OrderBean OB = orderDao.selectOrder(orderSN);
		OB.setOrderState("已取消");
		orderDao.update(OB);
	}

}
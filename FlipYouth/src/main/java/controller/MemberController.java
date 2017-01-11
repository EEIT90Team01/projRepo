package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import model.MemberBean;
import model.MemberService;
import model.RelationBean;
import model.dao.MemberDAO;
import model.dao.RelationDAO;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class MemberController {
	@Autowired
	MemberService memberService;

	@Autowired
	MemberDAO memberDAO;
	@Autowired
	RelationDAO relationDAO;

	@Autowired
	@Resource(name = "memberBean")
	MemberBean memberBean;

	// 修改會員資料
	@RequestMapping(path = { "/editMember.controller" })
	public String editMember(@RequestParam(name = "nickName") String nickName,
			@RequestParam(name = "mbrPassword") String mbrPassword, @RequestParam(name = "address") String address,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "mbrEmail") String mbrEmail,
			@RequestParam(name = "image") MultipartFile image, Model model, HttpSession session)
			throws UnsupportedEncodingException {

		// 自訂userBean名稱 ,拿到session中儲存的登入者"loginOK"資料
		MemberBean userBean = (MemberBean) session.getAttribute("loginOK");
		try {
			System.out.println("image" + image);
			MemberBean updatBean = memberService.updateMember(userBean.getMbrSN(), nickName, mbrPassword, phone,
					address, mbrEmail, image);
			if (updatBean != null) {
				// 存入修改成功的資料 並轉入下一個頁面"editMemeberSuccess"
				Map<String, String> editSuccess = new HashMap<String, String>();
				editSuccess.put("nickName", nickName);
				editSuccess.put("mbrPassword", mbrPassword);
				editSuccess.put("phone", phone);
				editSuccess.put("address", address);
				editSuccess.put("mbrEmail", mbrEmail);
				session.setAttribute("editSuccess", editSuccess);

				// 將使用者的大頭貼轉轉成Base64存入Map<>
				Map<String, String> editSuccessImage = new HashMap<String, String>();
				String imageBase64 = null;
				imageBase64 = Base64.getEncoder().encodeToString(updatBean.getImage());
				editSuccessImage.put("image", imageBase64);
				session.setAttribute("editSuccessImage", editSuccessImage);

				// 把修改過的updateBean存入session 更改session中的資料
				session.setAttribute("loginOK", updatBean);
				return "editMemberSuccess";

			} else {
				return "editMember";
			}

		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}// end of editMember.controller

	// 搜尋單一會員
	@RequestMapping(path = "/searchMember.controller", produces = "application/json; charset=utf-8")

	// 在SpringMVC 中 如果沒有寫@ResponseBody 就會回傳一個頁面,若是想要回傳指定的類別(如 String Bean List
	// Boolean等) 則需要寫這項
	public @ResponseBody String searchFriend(String nickName, String mbrSN, HttpSession session) {

		if (!nickName.isEmpty()) {

			System.out.println("進入searchMember");
			memberBean = memberDAO.selectOne(nickName);

			// 因接收到的值皆是String 要做型別轉換
			Integer mbrSNTemp = Integer.parseInt(mbrSN);
			System.out.println("mbrSNTemp = " + mbrSNTemp);

			RelationBean relationBean = relationDAO.selectOne(mbrSNTemp, memberBean.getMbrSN());
			System.out.println("搜尋membert成功");

			String memberImageBase64 = Base64.getEncoder().encodeToString(memberBean.getImage());

			// 轉成json
			Map<String, Object> jsonAll = new HashMap<String, Object>();
			jsonAll.put("selectOneRelation", relationBean);
			System.out.println("selectOneRelation (查詢是否為好友)= " + relationBean);
			jsonAll.put("selectOneMember", memberBean);
			jsonAll.put("memberImageBase64", memberImageBase64);

			return new Gson().toJson(jsonAll);

		} else {
			return null;
		}

	}

	// 搜尋房主資料
	@RequestMapping(path = "/searchHost.controller")
	public @ResponseBody String searchHost(String nickName) {

		if (nickName != null || nickName.isEmpty()) {
			MemberBean bean = memberDAO.selectOne(nickName);

			// 轉成json
			Map<String, Object> json = new HashMap<String, Object>();
			json.put("HostBean", bean);
		
			return new Gson().toJson(json);

		} else {
			return null;
		}
	}
	
	
	// 搜尋房主資料
		@RequestMapping(path = "/searchHostData.controller")
		public String searchHostData(String nickName , HttpSession session) {

			if (nickName != null || nickName.isEmpty()) {
				MemberBean bean = memberDAO.selectOne(nickName);
				String imageBase64 = null;
				imageBase64 = Base64.getEncoder().encodeToString(bean.getImage());

				session.setAttribute("memberBean", bean);
				session.setAttribute("memberBeanImage", imageBase64);
				
				return "hostData";
			} else {
				return null;
			}
		}
		
		
		// 搜尋會員資料
				@RequestMapping(path = "/searchMbrData.controller")
				public String searchMbrData(String nickName , HttpSession session) {

					if (nickName != null || nickName.isEmpty()) {
						MemberBean bean = memberDAO.selectOne(nickName);
						String imageBase64 = null;
						imageBase64 = Base64.getEncoder().encodeToString(bean.getImage());

						session.setAttribute("memberBean", bean);
						session.setAttribute("memberBeanImage", imageBase64);
						
						return "mbrData";
					} else {
						return null;
					}
				}

	// @RequestMapping(path = "/showPicture.controller")
	// public byte[] showPicture(@RequestParam(name = "mbrSN") Integer mbrSN) {
	//
	//// memberBean.getImage();
	// // 轉換photo to byte[]
	//// try {
	//// // 暫存BYTE陣列
	//// InputStream fileContent = image.getInputStream();
	//// // 緩衝
	//// ByteArrayOutputStream ByteArrayOutputStream = null;
	////
	//// BufferedInputStream bis = new BufferedInputStream(fileContent);
	//// // 記錄讀進來長度
	//// byte[] contents = new byte[8192];
	//// // 假如等於-1代表沒有資料了
	//// int byteRead = 0;
	//// ByteArrayOutputStream = new ByteArrayOutputStream(5000);
	//// while ((byteRead = bis.read(contents)) != -1) {
	//// // 從緩衝區讀取buffer裡面0~length-1的位置
	//// ByteArrayOutputStream.write(contents);
	//// }
	// return memberBean.getImage();
	//// } catch (IOException e) {
	//// e.printStackTrace();
	//// return null;
	//// }
	//
	// }// end of showPicture.controller

}

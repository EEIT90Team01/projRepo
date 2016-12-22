package controller;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.MemberBean;
import model.dao.MemberDAO;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class MemberController {
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	@Resource(name = "memberBean")
	MemberBean memberBean;

	@RequestMapping(path = { "/editMember.controller" })
	public String editMember(@RequestParam(name = "nickName") String nickName,
			@RequestParam(name = "mbrPassword") String mbrPassword, @RequestParam(name = "address") String address,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "mbrEmail") String mbrEmail,
			@RequestParam(name = "image") MultipartFile image, Model model, HttpSession session, HttpServletRequest req)
			throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		if (nickName == null || nickName.length() == 0) {
			errors.put("nickName", "請輸入暱稱");
		}
		if (mbrPassword == null || mbrPassword.length() == 0) {
			errors.put("mbrPassword", "請輸入密碼");
		}
		if (phone == null || phone.length() == 0) {
			errors.put("phone", "請輸入手機號碼");
		}
		if (mbrEmail == null || mbrEmail.length() == 0) {
			errors.put("mbrEmail", "請輸入Email");
		}
		if (errors != null && !errors.isEmpty()) {
			return "login.error";
		}

		// 呼叫Model

		// 自訂userBean名稱 ,拿到session中儲存的登入者"loginOK"資料
		MemberBean userBean = (MemberBean) session.getAttribute("loginOK");
		try {
			System.out.println("image" + image);
			MemberBean bean = memberDAO.updateMember(userBean.getMbrSN(), nickName, mbrPassword, phone, address,
					mbrEmail, image);
			if (bean != null) {
				// 存入修改成功的資料 並轉入下一個頁面"editMemeberSuccess"
				Map<String, String> editSuccess = new HashMap<String, String>();
				editSuccess.put("nickName", nickName);
				editSuccess.put("mbrPassword", mbrPassword);
				editSuccess.put("phone", phone);
				editSuccess.put("address", address);
				editSuccess.put("mbrEmail", mbrEmail);
				session.setAttribute("editSuccess", editSuccess);
				return "editMemberSuccess";

			} else {
				return "editMember";
			}

		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}// end of editMember.controller

	@RequestMapping(path = "/showPicture.controller")
	public String showPicture(@RequestParam(name = "image") MultipartFile image) {

		// 轉換photo to byte[]
		try {
			// 暫存BYTE陣列
			InputStream fileContent = image.getInputStream();
			// 緩衝
			ByteArrayOutputStream ByteArrayOutputStream = null;

			BufferedInputStream bis = new BufferedInputStream(fileContent);
			// 記錄讀進來長度
			byte[] contents = new byte[8192];
			// 假如等於-1代表沒有資料了
			int byteRead = 0;
			ByteArrayOutputStream = new ByteArrayOutputStream(5000);
			while ((byteRead = bis.read(contents)) != -1) {
				// 從緩衝區讀取buffer裡面0~length-1的位置
				ByteArrayOutputStream.write(contents);
			}
			return "editMemberSuccess";
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}// end of showPicture.controller

}

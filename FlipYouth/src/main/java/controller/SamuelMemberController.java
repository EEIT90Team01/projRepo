package controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
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

import model.MailSenderBean;
import model.MemberBean;
import model.MemberInsertDao;
import model.MemberInsertService;
@Controller
@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET })
public class SamuelMemberController {

	@Autowired
	private MemberInsertService mis;
	@Autowired
	@Resource(name="MemberInsertDao")
	MemberInsertDao mbrDao ;

	@RequestMapping(path = { "/memberInsert.controller" })
	public String data(
			@RequestParam(name = "nickname") String nickname, 
			@RequestParam(name = "id") String mbrId,
			@RequestParam(name = "password") String mbrPassword,
			@RequestParam(name = "action") String action,
			@RequestParam(name = "email") String mbrEmail,
			Model model, HttpSession session) throws IOException {
		System.out.println("===========================nickname = "+nickname);
		MemberBean bean = new MemberBean();
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		mbrEmail = mbrEmail.trim();
		nickname = nickname.trim();
		mbrId = mbrId.trim();
		mbrPassword = mbrPassword.trim();
	
		if ("insert1".equals(action)) {
			if (nickname == null || nickname.length() == 0) {
				errors.put("nickname", "please enter your nickname! ");
			}else{
				bean.setNickName(nickname);
				if(mis.check(bean, "nickname")==null){
					errors.put("nickname", "the nickname is used");
				}
			}
			
			if (mbrId == null || mbrId.length() == 0) {
				errors.put("id", "please enter your id! ");
			}else{
				bean.setMbrId(mbrId);
				if(mis.check(bean, "id")==null){
					errors.put("id", "the mbrId is used");
				}
			}
			
			if (mbrPassword == null || mbrPassword.length() == 0) {
				errors.put("password", "please enter your password! ");
			}

			if (mbrEmail == null || mbrEmail.length() == 0) {
				errors.put("email", "please enter your email! ");
			}else{
				bean.setMbrEmail(mbrEmail);
//				if(mis.check(bean, "email")==null){
//					errors.put("email", "the email is used");
//				}
			}
			if (errors != null && !errors.isEmpty()) {
				return "fail";

			}
			
			
			bean.setMbrId(mbrId);
			bean.setNickName(nickname);
			bean.setMbrPassword(mbrPassword);
			bean.setMbrEmail(mbrEmail);
			session.setAttribute("insert", bean);

			return "information";
		}
		

		return "fail";
	}
	//*****************************************************************************************************
	//*****************************************************************************************************
	
	MailSenderBean msb;
	
	@RequestMapping(path = { "/information.controller" })
	public String information(
			@RequestParam(name = "name") String mbrName,
			@RequestParam(name = "gender") String gender,
			@RequestParam(name = "phone") String phone,
			@RequestParam(name = "image") MultipartFile image,
			@RequestParam(name = "action") String action,
			@RequestParam(name = "address") String address,
			Model model, HttpSession session) throws IOException{
			
		mbrName = mbrName.trim();gender = gender.trim();phone = phone.trim();address = address.trim();     //去除空白
		
		MemberBean sessionBean = (MemberBean)session.getAttribute("insert");
		
		long ct = System.currentTimeMillis();
		Date date = new java.util.Date(ct);
		//============================================================================產生驗證雜湊碼	
		StringBuilder actCode = new StringBuilder(sessionBean.getMbrId()+ct);	//轉換雜湊前之驗證碼(會員帳號+註冊時間)
		
		byte[] actByte = String.valueOf(actCode).getBytes();					//convert to byte[]
		
		byte[] activatedCode = null;
		   
		try {
			MessageDigest messageDiget = MessageDigest.getInstance("MD5");		//設定要轉換的格式ex:MD5, SHA, WHIRLPOOL...
			messageDiget.update(actByte);										//將要轉換之byte[]加入至MessageDigest
			activatedCode = messageDiget.digest();								//digest
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		
		//============================================================================產生驗證雜湊碼			
		
		
		MemberBean checkBean = new MemberBean();
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		msb = new MailSenderBean(sessionBean.getMbrEmail(), activatedCode, sessionBean.getNickName());
		
		if("confirm".equals(action)){
			sessionBean.setMbrName(mbrName);
			sessionBean.setGender(gender);
			sessionBean.setPhone(phone);
			sessionBean.setMbrState(0);
			sessionBean.setEnergy(10);
			sessionBean.setRptCounter(0);
			sessionBean.setCreateTime(date);
			sessionBean.setAddress(address);
			sessionBean.setImage(image.getBytes());
			sessionBean.setActivatedCode(activatedCode);
			MemberBean result = mis.insert(sessionBean);
			new Thread(msb).start();
			return "homepage";
		}
		return "fail";
	}
	
	//*****************************************************************************************************
	//*****************************************************************************************************
//	System.out.println(id);
//	if (nickName != null && nickName.trim().length() != 0) {
//		try {
//			MemberBean  bean = new MemberBean();
//			bean.setNickName(nickName);
//	       result = mis.check(bean,null);
//		} catch(Exception ex){
//			ex.printStackTrace();
//		}
//		if(result != null ){
//			return "2";    //nickname 重複
//		}else{
//			return "1";		//nickname 可以使用
//		}
//	}else{
//		return "0";			//nickname 未輸入
//	}
	@RequestMapping(path={"/check.controller"})        	
	public @ResponseBody String check(String nickname, String id, String email){			// @ResponseBody代表這個方法是真的要回傳一個值 而不是轉換view
		MemberBean temp = new MemberBean();
		if(nickname!=null){
			temp.setNickName(nickname);
			if(mis.check(temp, "nickname") == null){
				return "the nickname is used";
			}else{
 				return null;
			}
		}
		if(id!=null){
			temp.setMbrId(id);
			if(mis.check(temp, "id") == null){
				return "the id is used";
			}else{
 				return null;
			}
		}
//		if(email!=null){
//			temp.setMbrEmail(email);
//			if(mis.check(temp, "email") == null){
//				return "the email is used";
//			}else{
// 				return "success";
//			}
//		}
		return "";
	}
	
	//*****************************************************************************************************
	//*****************************************************************************************************
	@RequestMapping(path={"/checkActivatedCode.controller"})
	public String checkActivatedCode(
			@RequestParam(name="actCode") String activatedCode,
			@RequestParam(name="id")String id){
		MemberBean temp = new MemberBean();
		temp.setMbrId(id);
		//mis.check(bean, "codeCheck")拿回一個MemberBean型態物件
		MemberBean userBean = (MemberBean)mis.check(temp, "codeCheck");
		StringBuilder userActCode = new StringBuilder();			//建立一個StringBuilder hashCode 用以轉換 byte[] activatedCode(不然會有亂碼)
		System.out.println(userBean.getActivatedCode());
		for(byte b : userBean.getActivatedCode())
        {
            String actTemp = Integer.toHexString(b & 0xff);
            if(actTemp.length() == 1)
            {
            	actTemp = "0" + actTemp;
            }
            userActCode.append(actTemp);
        }
		System.out.println(userActCode);
	    System.out.println(userActCode.toString());
		if(activatedCode.equals(userActCode.toString())){
			userBean.setMbrState(1);
			mis.stateUpdate(userBean);
			return "homepage";
		}
		
		
		return "fail";
	}
	
	//*****************************************************************************************************
	    
	@RequestMapping(path={"/getMbrSNByNickName.controller"})
	public @ResponseBody int getMbrSNByNickName(@RequestParam(name="nickName")String nickName){
		System.out.println("mbrController的getMbrSNByNickName ");
		int mbrSN = mbrDao.selectMbrSNByNickName(nickName);
		System.out.println(mbrSN);
		return mbrSN;
	}
	
															
	@RequestMapping(path={"/getNickNameByMbrSN.controller"},produces="text/plain;charset=UTF-8")
	public @ResponseBody String getNickNameByMbrSN(@RequestParam(name="mbrSN")String mbrSNTemp){
		int mbrSN = Integer.parseInt(mbrSNTemp);
		System.out.println( "mbrSN="+mbrSN+",getNickName="+mbrDao.select(mbrSN).getNickName());
		return mbrDao.select(mbrSN).getNickName();
	}
	
	
}
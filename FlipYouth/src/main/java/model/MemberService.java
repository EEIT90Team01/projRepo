package model;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import model.dao.MemberDAO;


@Service(value="memberService")
@Transactional
public class MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	@Autowired
	@Resource(name= "memberBean")
	MemberBean memberBean;

	// 一開始顯示會員資料
	public void select(String mbrId){
		MemberBean result = null;
		if(mbrId != null){
			result = memberDAO.select(mbrId);
		}
	}
	
	// 修改會員資料 
	public  MemberBean updateMember(Integer mbrSN, String nickName, String mbrPassword, String phone, String address,
			String mbrEmail, MultipartFile image) throws IOException {
		MemberBean bean = null;
		
		if(image != null && image.getSize() != 0){
		bean = memberDAO.updateMember(mbrSN, nickName, mbrPassword, phone, address,
				mbrEmail, image);
		}
		return bean;
		
	}
	
	
	//單獨搜尋一個會員
	public MemberBean selectOne(String nickName){
		
		if(!nickName.isEmpty()){
			
			memberBean = memberDAO.selectOne(nickName);
			
		}else{
			System.out.println(" MemberService selectOne() 沒有輸入會員暱稱");
			return null;
		}
				
		return memberBean;
	}
	
	
}

package model;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.RelationDAO;

@Transactional
@Service(value="relationService")
public class RelationService {
	
	@Autowired
	@Resource
	MemberBean memberBean;
	
	@Autowired
	RelationDAO relationDAO;
	
	public List<RelationBean> selectAllFriend(Integer mbrSN){
		List<RelationBean> list = null;
		
		System.out.println("relationService mbrSN (使用者號碼)= " + mbrSN);
		
		if(!(mbrSN == null)){
			
			list = relationDAO.selectAllFriend(mbrSN);
			System.out.println("selectAllFriend list 抓取成功 ");
			return list;
		}
		System.out.println("selectAllFriend 搜尋所有好友失敗");
		return null;
	}
	
	
	public List<RelationBean> selectAllBlockadeMember(Integer mbrSN){
		List<RelationBean> list = null;
		
		System.out.println("relationService mbrSN (使用者號碼)= " + mbrSN);
		
		if(!(mbrSN == null)){
			
			list = relationDAO.selectAllBlockadeMember(mbrSN);
			System.out.println("selectAllBlockadeMember list 抓取成功 ");
			return list;
		}
		System.out.println("selectAllBlockadeMember  搜尋所有好友失敗");
		return null;
	}
	
	

}

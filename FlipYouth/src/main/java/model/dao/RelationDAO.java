package model.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;
import model.RelationBean;

@Transactional
@Repository(value="relationDAO")
public class RelationDAO {
	
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Autowired
	@Resource
	MemberBean memberBean;
	
	@Autowired
	RelationBean relationBean;
	
	
//	*****************  一開始顯示會員資料    ***************************************************************************************
	//顯示(搜尋)所有好友
	public List<RelationBean> selectAllFriend(Integer mbrSN){
		
		System.out.println("relationDAO mbrSN (使用者號碼) = " + mbrSN);
		
		//createQuery 會回傳一個 Query
		Query query =
				this.getSession().createQuery("from RelationBean where mbrSN = " + mbrSN + "and relation = 1");
		
		
		//這是SQL的語法  在createQuery中不能這樣寫------select * from relation where mbrSN = '" + mbrSN + "' AND relation = '2'"
//		List<RelationBean> list = 
//				(List<RelationBean>) this.getSession().createQuery("select * from relation where mbrSN = '" + mbrSN + "' AND relation = '1'");
		
//		System.out.println("relationDAO list = " + list);
		
		System.out.println("relationDAO回傳");
		return (List<RelationBean>) query.getResultList();
		//.getResultList();  -----  list
		//.getSingleResult(); ----  一個單獨的東西
		
	}
	
	
//	***************** 顯示(搜尋)所有封鎖名單   ******************************************************************
	public List<RelationBean> selectAllBlockadeMember(Integer mbrSN){
		
		System.out.println("relationDAO mbrSN (使用者號碼) = " + mbrSN);
		Query query =
				this.getSession().createQuery("from RelationBean where mbrSN = " + mbrSN + "and relation = 2");
		
		System.out.println("relationDAO回傳");
		return (List<RelationBean>) query.getResultList();
	}
	
	
//	*****************  單獨搜尋一個好友--未完成    *******************************************************************
	public MemberBean selectOne(String nickName){
		memberBean = (MemberBean) this.getSession().createQuery("from ");
		return memberBean;
	}
	
	
//	*****************  新增好友    ********************************************************************************
	public void  insertFriend (RelationBean relationBean){
//		System.out.println("結果"+this.getSession().save(relationBean));
		this.getSession().saveOrUpdate(relationBean);
	
	}
	
//	***************** 封鎖會員(黑名單)    ***************************************************************************
	public void  blockadeMember (RelationBean relationBean){
//		System.out.println("結果"+this.getSession().save(relationBean));
		this.getSession().saveOrUpdate(relationBean);
	
	}
	
	
//	***************** 刪除好友    ***************************************************************************************	
	
	public void deleteFriend(String mbrSN , int targetMbrSN){
		
		System.out.println("deleteFriend relationDAO開始");
		Query query 
		= this.getSession().createQuery("delete  RelationBean where mbrSN =" + mbrSN + " and targetMbrSN =" + targetMbrSN + " and relation = 1 ");
		//使用HQL指令時.新增.更新.刪除時都需再加  query.executeUpdate();
		int results = query.executeUpdate();
		
//		以下為CRUD by Session的指令  不適用在複合主主鍵
//		this.getSession().get(RelationBean.class,targetSN);
//		this.getSession().delete(relationBean);
	}
	
//	***************** 解除封鎖(黑名單)    ***************************************************************************
	public void  unBlockadeMember (String mbrSN , int targetMbrSN){
		
		System.out.println("unBlockadeMember relationDAO開始 targetMbrSN= "+targetMbrSN);
		Query query 
		= this.getSession().createQuery("delete  RelationBean where mbrSN =" + mbrSN + " and targetMbrSN =" + targetMbrSN + " and relation = 2 ");
		//使用HQL指令時.新增.更新.刪除時都需再加  query.executeUpdate();
		int results = query.executeUpdate();
	
	}
	

}

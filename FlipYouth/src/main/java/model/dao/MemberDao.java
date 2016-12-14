package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;

@Repository(value = "memberDao")
public class MemberDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
//	@Transactional
//	public ShopBean select(int id) {//查詢一筆
//		ShopBean bean=(ShopBean) this.getSession().get(ShopBean.class, id);
//		return bean;
//	}
	
	
	@Transactional
//	public List<ShopBean> select(String id) {//查詢多筆
//		Query query = this.getSession().createQuery(("from ShopBean "+id));
//		return (List<ShopBean>) query.getResultList();
//	}


	public MemberBean select(String user) {
			Query query = this.getSession().createQuery(("from MemberBean where MbrId = '"+user+"'"));
			
			@SuppressWarnings("rawtypes")
			List results=query.getResultList();
			if(!results.isEmpty()){
				return (MemberBean)results.get(0);
				
			}else{return null;
					
			}
			
			
	}
}

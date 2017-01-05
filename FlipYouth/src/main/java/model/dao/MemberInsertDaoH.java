package model.dao;

import java.util.Base64;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;
import model.MemberInsertDao;
@Transactional
@Repository("MemberInsertDao")
public class MemberInsertDaoH implements MemberInsertDao {
	@Autowired
	SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
//============================================================================================================
	public MemberBean check(MemberBean bean, String field) {
		
		if ("nickname".equals(field)) {
			Query query = this.getSession().createQuery("from MemberBean where nickname=?");
			query.setParameter(0, bean.getNickName());
			if (!query.getResultList().isEmpty()) {
				return  null;
			}
		}
		if ("id".equals(field)) {
			Query query = this.getSession().createQuery("from MemberBean where mbrId=?");
			query.setParameter(0, bean.getMbrId());
			if (!query.getResultList().isEmpty()) {
				return  null;
			}
		}
		if ("email".equals(field)) {
			System.out.println("有進入");
			Query query = this.getSession().createQuery("from MemberBean where mbrEmail=?");
			query.setParameter(0, bean.getMbrEmail());
			if (!query.getResultList().isEmpty()) {
				return  null;
			}
		}
		
		if("codeCheck".equals(field)){
			Query query = this.getSession().createQuery("from MemberBean where nickName=?");
			query.setParameter(0, bean.getMbrId());
			return (MemberBean)query.getSingleResult();
		}
		
		return bean;
	}
	
	//============================================================================================================
	
	@Override
	public MemberBean insert(MemberBean bean) {
		this.getSession().save(bean);
		return bean;
	}
	
	//============================================================================================================
	
	@Override
	public boolean stateUpdate(MemberBean bean) {
		this.getSession().update(bean);
		return true;
	}
	//============================================================================================================
	

	public MemberBean select(int mbrSN){
		return this.getSession().get(MemberBean.class, mbrSN);
		
	}
	
	//=========================================		Comment拿取會員大頭貼  	==================================================

	public String selectImage(int mbrSN){
		return Base64.getEncoder().encodeToString(this.getSession().get(MemberBean.class, mbrSN).getImage());
		
	}
	
	//=========================================		Comment拿取會員大頭貼  	==================================================
	
	//================================================================================================================
	@Override
	public int selectMbrSNByNickName(String nickName) {
		Query query = this.getSession().createQuery("select mbrSN from MemberBean where nickName=?");
		query.setParameter(0, nickName);
		return (int)query.getSingleResult();
	}

	//================================================================================================================
}

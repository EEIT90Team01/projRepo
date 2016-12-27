package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.AdministratorBean;
@Repository(value="administratorDao")
public class AdministratorDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public AdministratorBean select(String admId) {
		
		AdministratorBean bean = null;
		bean = getSession().get(AdministratorBean.class, admId);
		return bean;
	}

//	@Override
//	public List<Object> select() {
//		
//		List<AdministratorBean> beans = null;
//		beans = (List<AdministratorBean>) getSession().createQuery("from AdministratorBean", AdministratorBean.class).getResultList();
//		return beans;
//	}

	public AdministratorBean insert(AdministratorBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}

	public AdministratorBean update(AdministratorBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public boolean delete(String admId) {
	
		AdministratorBean bean = new AdministratorBean();
		bean.setAdmId(admId);	
		getSession().delete(bean);	
		return true;
	}
	
	public List<AdministratorBean> ajaxQuery(String hql, int start, int length) {
		
		List<AdministratorBean> beans = null;
		beans = getSession().createQuery(hql, AdministratorBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

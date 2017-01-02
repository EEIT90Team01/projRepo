package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.AdministratorBean;
@Repository(value="administratorDtdao")
public class AdministratorDTDAO {
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

	public AdministratorBean cu(AdministratorBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		AdministratorBean bean;
		for (String pk : toDelete) {
			if ("admin".equals(pk)){
				continue;
			}
			bean = new AdministratorBean();
			bean.setAdmId(pk);
			getSession().delete(bean);
			result++;
		}
		return result;
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

package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.LocationBean;
@Repository(value="locationDtdao")
public class LocationDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public LocationBean select(Integer locSN) {
		
		LocationBean bean = null;
		bean = getSession().get(LocationBean.class, locSN);
		return bean;
	}

	public LocationBean cu(LocationBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		LocationBean bean;
		for (String pk : toDelete) {
			bean = new LocationBean();
			bean.setLocSN(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<LocationBean> ajaxQuery(String hql, int start, int length) {
		List<LocationBean> beans = null;
		beans = getSession().createQuery(hql, LocationBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

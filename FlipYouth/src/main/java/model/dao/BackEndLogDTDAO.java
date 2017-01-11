package model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Query;

//import org.apache.commons.validator.routines.DateValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.BackEndLogBean;
import model.bean.BackEndLogBeanPK;
@Repository(value="backEndLogDtdao")
public class BackEndLogDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public BackEndLogBean select(String admId, Date executeTime) {
		
		BackEndLogBean bean = null;
		bean = getSession().load(BackEndLogBean.class, new BackEndLogBeanPK(admId, executeTime));
		return bean;
	}

	public BackEndLogBean create(BackEndLogBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	
	public List<BackEndLogBean> ajaxQuery(String hql, int start, int length) {

		List<BackEndLogBean> beans = null;
		List<Object[]> pks = getSession().createQuery("select admId, executeTime "+hql, Object[].class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<BackEndLogBean> select(List<Object[]> pks) {
		
		List<BackEndLogBean> beans = new ArrayList<BackEndLogBean>();
		for (Object[] pk:pks){
			beans.add(this.select((String)pk[0], (Date)pk[1]));
		}
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

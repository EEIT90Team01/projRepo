package model.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.Query;

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
		bean = getSession().get(BackEndLogBean.class, new BackEndLogBeanPK(admId, executeTime));
		return bean;
	}

//	@Override
//	public List<Object> select() {
//		
//		List<AdministratorBean> beans = null;
//		beans = (List<AdministratorBean>) getSession().createQuery("from AdministratorBean", AdministratorBean.class).getResultList();
//		return beans;
//	}

	public BackEndLogBean create(BackEndLogBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}

	public BackEndLogBean update(BackEndLogBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		BackEndLogBean bean;
		for (String pk : toDelete) {
	
			bean = new BackEndLogBean();
			bean.setAdmId(pk);
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<BackEndLogBean> ajaxQuery(String hql, int start, int length) {
		
		List<BackEndLogBean> beans = null;
		beans = getSession().createQuery(hql, BackEndLogBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

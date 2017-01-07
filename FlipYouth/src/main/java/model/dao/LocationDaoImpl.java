package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.LocationBean;
import model.LocationDao;

@Repository(value="locationDao")
public class LocationDaoImpl implements LocationDao{
	
	@Autowired // 連結XML的Bean,所以Bean刪除就會出錯
	private SessionFactory sessionFactory;
	
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public LocationBean select(Integer locSN) {
		LocationBean bean = null;
		bean = (LocationBean) getSession().get(LocationBean.class, locSN);
		return bean;
	}
	
	@Override
	public List<LocationBean> select() {
		List<LocationBean> beans = null;
		beans = (List<LocationBean>) getSession().createQuery("from LocationBean", LocationBean.class).getResultList();
		return beans;
	}

	@Override
	public LocationBean insert(LocationBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public LocationBean update(LocationBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public boolean delete(Integer locSN) {
		LocationBean delete = this.getSession().get(LocationBean.class, locSN);
		if (delete != null) {
			this.getSession().delete(delete);
			return true;
		}
		return false;
	}

}
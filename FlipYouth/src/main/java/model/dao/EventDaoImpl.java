package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EventBean;
import model.EventDao;

@Repository(value = "eventDao")
public class EventDaoImpl implements EventDao {

	@Autowired // 連結XML的Bean,所以Bean刪除就會出錯
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public EventBean select(Integer eventSN) {
		EventBean bean = null;
		bean = (EventBean) getSession().get(EventBean.class, eventSN);
		return bean;
	}

	@Override
	public List<EventBean> select() {
		List<EventBean> beans = null;
		beans = (List<EventBean>) getSession().createQuery("from EventBean", EventBean.class).getResultList();
		return beans;
	}

	@Override
	public EventBean insert(EventBean bean) {
		getSession().save(bean);
		return bean;
	}

	@Override
	public EventBean update(EventBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public boolean delete(Integer eventSN) {
		EventBean delete = this.getSession().get(EventBean.class, eventSN);
		if (delete != null) {
			this.getSession().delete(delete);
			return true;
		}
		return false;
	}

	@Override
	public EventBean select(Date beginTime) {
		EventBean bean = null;
		bean = (EventBean) getSession().get(EventBean.class, beginTime);
		return bean;
	}
}
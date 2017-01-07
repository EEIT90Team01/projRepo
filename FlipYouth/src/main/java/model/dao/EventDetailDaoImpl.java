package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EventDetailBean;
import model.EventDetailDao;
import model.EventDetailPK;

@Repository(value="eventDetailDao")
public class EventDetailDaoImpl implements EventDetailDao{

	@Autowired // 連結XML的Bean,所以Bean刪除就會出錯
	private SessionFactory sessionFactory;

	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public EventDetailBean select(EventDetailPK eventDetailPK) {
		EventDetailBean bean = null;
		bean = (EventDetailBean) getSession().get(EventDetailBean.class, eventDetailPK);
		return bean;
	}

	@Override
	public List<EventDetailBean> select() {
		List<EventDetailBean> beans = null;
		beans = (List<EventDetailBean>) getSession().createQuery("from EventDetailBean", EventDetailBean.class).getResultList();
		return beans;
	}

	@Override
	public EventDetailBean insert(EventDetailBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public EventDetailBean update(EventDetailBean bean) {
		getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public boolean delete(EventDetailPK eventDetailPK) {
		EventDetailBean delete = this.getSession().get(EventDetailBean.class, eventDetailPK);
		if (delete != null) {
			this.getSession().delete(delete);
			return true;
		}
		return false;
	}
	
	
	public int select(Integer a){
		return this.getSession().createNativeQuery("select * from EventDetail where eventSN = '"+ a+"'").getResultList().size();
	}
	
}
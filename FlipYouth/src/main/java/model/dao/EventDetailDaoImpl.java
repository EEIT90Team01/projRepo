package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EventBean;
import model.EventDetailBean;
import model.EventDetailDao;
import model.EventDetailPK;
import model.MemberBean;

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
	
	/////輸入userSN 取出memberBean/////
	public MemberBean mbrselect(Integer userSN){
		MemberBean memberBean = null;
		memberBean = (MemberBean) getSession().get(MemberBean.class, userSN);
		return memberBean;
	}
	/////輸入userSN 取出memberBean/////
	
	/////輸入mbrSN 取出EventDetailBean/////
	public List<EventDetailBean> select(String mbrSN) {
		List<EventDetailBean> beans = null;
		beans = (List<EventDetailBean>) getSession().createQuery("from EventDetailBean where mbrSN="+mbrSN, EventDetailBean.class).getResultList();
		return beans;
	}
	/////輸入mbrSN 取出EventDetailBean/////
	/////輸入eventSN 取出EventDetailBean/////
	public List<EventDetailBean> selecteventSN(String eventSN) {
		List<EventDetailBean> eventDetailBeans = null;
		eventDetailBeans = (List<EventDetailBean>) getSession().createQuery("from EventDetailBean where eventSN="+eventSN, EventDetailBean.class).getResultList();
		return eventDetailBeans;
	}
	/////輸入eventSN 取出EventDetailBean/////	
}
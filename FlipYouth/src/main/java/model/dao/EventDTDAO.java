package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EventBean;
@Repository(value="eventDtdao")
public class EventDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public EventBean select(Integer eventSN) {
		
		EventBean bean = null;
		bean = getSession().load(EventBean.class, eventSN);
		return bean;
	}

	public EventBean cu(EventBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		EventBean bean;
		for (String pk : toDelete) {
			bean = new EventBean();
			bean.setEventSN(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<EventBean> ajaxQuery(String hql, int start, int length) {

		List<EventBean> beans = null;
		List<Integer> pks = getSession().createQuery("select eventSN "+hql, Integer.class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<EventBean> select(List<Integer> pks) {
		
		List<EventBean> beans = new ArrayList<EventBean>();
		for (Integer pk:pks){
			beans.add(this.select(pk));
		}
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

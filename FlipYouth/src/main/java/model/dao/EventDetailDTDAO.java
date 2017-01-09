package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.apache.commons.validator.routines.IntegerValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.EventBean;
import model.EventDetailBean;
import model.EventDetailPK;
import model.MemberBean;
@Repository(value="eventDetailDtdao")
public class EventDetailDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private MemberDTDAO memberDtdao;
	@Autowired
	private EventDTDAO eventDtdao;
	@Autowired
	private IntegerValidator integerValidator;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public EventDetailBean select(EventBean eventSN, MemberBean mbrSN) {
		
		EventDetailBean bean = null;
		bean = getSession().get(EventDetailBean.class, new EventDetailPK(eventSN, mbrSN));
		return bean;
	}
	
	public EventDetailBean select(EventDetailPK eventDetailPK) {
		
		EventDetailBean bean = null;
		bean = getSession().get(EventDetailBean.class, eventDetailPK);
		return bean;
	}

	public EventDetailBean cu(EventDetailBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		EventDetailBean bean;
		for (String pk : toDelete) {
			bean = new EventDetailBean();
			EventDetailPK temp = new EventDetailPK();
			temp.setEventSN(eventDtdao.select(integerValidator.validate(pk.split("_")[0])));
			temp.setMbrSN(memberDtdao.select(integerValidator.validate(pk.split("_")[1])));
			bean.setEventDetailPK(temp);
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<EventDetailBean> ajaxQuery(String hql, int start, int length) {
		
		List<EventDetailBean> beans = null;
		beans = getSession().createQuery(hql, EventDetailBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}
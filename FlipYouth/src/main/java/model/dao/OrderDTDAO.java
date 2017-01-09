package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.OrderBean;
@Repository(value="orderDtdao")
public class OrderDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public OrderBean select(Integer orderSN) {
		
		OrderBean bean = null;
		bean = getSession().get(OrderBean.class, orderSN);
		return bean;
	}

	public OrderBean cu(OrderBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		OrderBean bean;
		for (String pk : toDelete) {
			bean = new OrderBean();
			bean.setOrderSN(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<OrderBean> ajaxQuery(String hql, int start, int length) {
		System.out.println("==============");
		System.out.println(hql);
		List<OrderBean> beans = null;
		beans = getSession().createQuery(hql, OrderBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

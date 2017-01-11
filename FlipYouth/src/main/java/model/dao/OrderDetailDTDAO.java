package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.apache.commons.validator.routines.IntegerValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.OrderBean;
import model.OrderDetailBean;
import model.OrderDetailPK;
import model.ShopBean;
@Repository(value="orderDetailDtdao")
public class OrderDetailDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private ShopDTDAO shopDtdao;
	@Autowired
	private OrderDTDAO orderDtdao;
	@Autowired
	private IntegerValidator integerValidator;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public OrderDetailBean select(OrderBean orderSN, ShopBean gameSN) {
		
		OrderDetailBean bean = null;
		bean = getSession().load(OrderDetailBean.class, new OrderDetailPK(orderSN, gameSN));
		return bean;
	}
	
	public OrderDetailBean select(OrderDetailPK orderDetailPK) {
		
		OrderDetailBean bean = null;
		bean = getSession().get(OrderDetailBean.class, orderDetailPK);
		return bean;
	}

	public OrderDetailBean cu(OrderDetailBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		OrderDetailBean bean;
		for (String pk : toDelete) {
			bean = new OrderDetailBean();
			OrderDetailPK temp = new OrderDetailPK();
			temp.setGameSN(shopDtdao.select(integerValidator.validate(pk.split("_")[0])));
			temp.setOrderSN(orderDtdao.select(integerValidator.validate(pk.split("_")[1])));
			bean.setPK(temp);
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<OrderDetailBean> ajaxQuery(String hql, int start, int length) {

		List<OrderDetailBean> beans = null;
		List<Object[]> pks = getSession().createQuery("select orderSN, gameSN "+hql, Object[].class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<OrderDetailBean> select(List<Object[]> pks) {
		
		List<OrderDetailBean> beans = new ArrayList<OrderDetailBean>();
		for (Object[] pk:pks){
			beans.add(this.select((OrderBean)pk[0], (ShopBean)pk[1]));
		}
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

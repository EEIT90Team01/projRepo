package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ShopBean;
@Repository(value="shopDtdao")
public class ShopDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public ShopBean select(Integer GameSN) {
		
		ShopBean bean = null;
		bean = getSession().get(ShopBean.class, GameSN);
		return bean;
	}

	public ShopBean cu(ShopBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	
	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		ShopBean bean;
		for (String pk : toDelete) {
			bean = new ShopBean();
			bean.setGameSN(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}
	
	public List<ShopBean> ajaxQuery(String hql, int start, int length) {
		List<ShopBean> beans = null;
		beans = getSession().createQuery(hql, ShopBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

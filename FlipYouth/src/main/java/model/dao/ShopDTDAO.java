package model.dao;

import java.util.ArrayList;
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
		bean = getSession().load(ShopBean.class, GameSN);
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
		List<Integer> pks = getSession().createQuery("select GameSN "+hql, Integer.class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<ShopBean> select(List<Integer> pks) {
		
		List<ShopBean> beans = new ArrayList<ShopBean>();
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

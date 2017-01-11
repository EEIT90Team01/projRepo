package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.AuthorityBean;

@Repository(value = "authorityDtdao")
public class AuthorityDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public AuthorityBean select(Integer authId) {
		AuthorityBean bean = null;

		bean = (AuthorityBean) getSession().load(AuthorityBean.class, authId);

		return bean;
	}

	public AuthorityBean cu(AuthorityBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		for (String pk : toDelete) {
			getSession().delete(new AuthorityBean(Integer.parseInt(pk)));
			result++;
		}
		return result;
	}

	public List<AuthorityBean> ajaxQuery(String hql, int start, int length) {

		List<AuthorityBean> beans = null;
		List<Integer> pks = getSession().createQuery("select authId "+hql, Integer.class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<AuthorityBean> select(List<Integer> pks) {
		
		List<AuthorityBean> beans = new ArrayList<AuthorityBean>();
		for (Integer pk:pks){
			beans.add(this.select(pk));
		}
		return beans;
	}
	
	public int ajaxCount(String hql) {

		Query query = getSession().createQuery("select count(*) " + hql);
		int result = ((Long) query.getSingleResult()).intValue();
		return result;
	}
}

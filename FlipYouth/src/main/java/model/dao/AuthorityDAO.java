package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.AuthorityBean;

@Repository(value = "authorityDao")
public class AuthorityDAO {
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public AuthorityBean select(Integer authId) {
		AuthorityBean bean = null;

		bean = (AuthorityBean) getSession().get(AuthorityBean.class, authId);

		return bean;
	}

	public AuthorityBean insert(AuthorityBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public AuthorityBean update(AuthorityBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		AuthorityBean bean;
		for (String pk : toDelete) {
			bean = new AuthorityBean();
			bean.setAuthId(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}

	public List<AuthorityBean> ajaxQuery(String hql, int start, int length) {

		List<AuthorityBean> beans = null;
		beans = getSession().createQuery(hql, AuthorityBean.class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		return beans;
	}

	public int ajaxCount(String hql) {

		Query query = getSession().createQuery("select count(*) " + hql);
		int result = ((Long) query.getSingleResult()).intValue();
		return result;
	}
}

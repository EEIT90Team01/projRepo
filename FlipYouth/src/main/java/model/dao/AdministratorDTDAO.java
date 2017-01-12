package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.AdministratorBean;

@Repository(value = "administratorDtdao")
public class AdministratorDTDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public AdministratorBean select(String admId) {

		AdministratorBean bean = null;
		bean = getSession().load(AdministratorBean.class, admId);
		return bean;
	}

	public AdministratorBean cu(AdministratorBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		for (String pk : toDelete) {
			if ("admin".equals(pk)) {
				continue;
			}
			getSession().delete(new AdministratorBean(pk));
			result++;
		}
		return result;
	}

	public List<AdministratorBean> ajaxQuery(String hql, int start, int length) {
		
		List<AdministratorBean> beans = null;
		List<String> pks = getSession().createQuery("select admId "+hql, String.class).setFirstResult(start).setMaxResults(length).getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<AdministratorBean> select(List<String> pks) {
		
		List<AdministratorBean> beans = new ArrayList<AdministratorBean>();
		for (String pk:pks){
			beans.add(this.select(pk));
		}
		return beans;
	}

	public int ajaxCount(String hql) {

		Query query = getSession().createQuery("select count(*) " + hql);
		int result = ((Long) query.getSingleResult()).intValue();
		return result;
	}

	public AdministratorBean check(String admId) {
		
		AdministratorBean bean = null;
		bean = getSession().get(AdministratorBean.class, admId);
		return bean;
	}
}

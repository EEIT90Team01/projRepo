package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;

@Repository(value = "memberDtdao")
public class MemberDTDAO {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public MemberBean select(Integer mbrSN) {

		MemberBean bean = null;
		bean = getSession().load(MemberBean.class, mbrSN);
		return bean;
	}

	public MemberBean cu(MemberBean bean) {

		getSession().saveOrUpdate(bean);
		return bean;
	}

	public int ajaxDelete(String[] toDelete) {
		int result = 0;
		MemberBean bean;
		for (String pk : toDelete) {
			bean = new MemberBean();
			bean.setMbrSN(Integer.parseInt(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}

	public List<MemberBean> ajaxQuery(String hql, int start, int length) {

		List<MemberBean> beans = null;
		List<Integer> pks = getSession().createQuery("select mbrSN " + hql, Integer.class).setFirstResult(start)
				.setMaxResults(length).getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<MemberBean> select(List<Integer> pks) {

		List<MemberBean> beans = new ArrayList<MemberBean>();
		for (Integer pk : pks) {
			beans.add(this.select(pk));
		}
		return beans;
	}

	public List<MemberBean> queryAll(String hql) {
		List<MemberBean> beans = null;
		beans = getSession().createQuery(hql, MemberBean.class).getResultList();
		return beans;
	}

	public int ajaxCount(String hql) {

		Query query = getSession().createQuery("select count(*) " + hql);
		int result = ((Long) query.getSingleResult()).intValue();
		return result;
	}
}

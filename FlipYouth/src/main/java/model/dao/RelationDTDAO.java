package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

//import org.apache.commons.validator.routines.IntegerValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.RelationBean;
@Repository(value="relationDtdao")
public class RelationDTDAO {
	@Autowired
	private SessionFactory sessionFactory;
//	@Autowired
//	private MemberDTDAO memberDtdao;
//	@Autowired
//	private IntegerValidator integerValidator;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public RelationBean select(Integer mbrSN, Integer targetMbrSN) {
		//Kelsey沒寫Idclass(´_ゝ`)
		RelationBean bean = null;
		Query query 
		= getSession().createQuery("from RelationBean where mbrSN = '" + mbrSN + "' and targetMbrSN = '" + targetMbrSN + "'");
		bean = (RelationBean) query.getSingleResult();
		return bean;
	}
	
	public List<RelationBean> ajaxQuery(String hql, int start, int length) {

		List<RelationBean> beans = null;
		List<Integer[]> pks = getSession().createQuery("select mbrSN, targetMbrSN "+hql, Integer[].class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<RelationBean> select(List<Integer[]> pks) {
		
		List<RelationBean> beans = new ArrayList<RelationBean>();
		for (Integer[] pk:pks){
			beans.add(this.select(pk[0], pk[1]));
		}
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

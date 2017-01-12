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
		hql=hql.replace("Bean", "");
		List<Object[]> pks = getSession().createNativeQuery("select mbrSN, targetMbrSN "+hql).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<RelationBean> select(List<Object[]> pks) {
		
		List<RelationBean> beans = new ArrayList<RelationBean>();
		for (Object[] pk:pks){
			beans.add(this.select((Integer)pk[0], (Integer)pk[1]));
		}
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

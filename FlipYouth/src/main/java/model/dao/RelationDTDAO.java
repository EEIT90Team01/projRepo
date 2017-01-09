package model.dao;

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

//	public RelationBean cu(RelationBean bean) {
//		
//		getSession().saveOrUpdate(bean);
//		return bean;
//	}
//	public int ajaxDelete(String[] toDelete) {
//		int result = 0;
//		RelationBean bean;
//		for (String pk : toDelete) {
//			bean = new RelationBean();
//			bean.setMbrSN(memberDtdao.select(integerValidator.validate(pk.split("_")[0])));
//			bean.setTargetMbrSN(memberDtdao.select(integerValidator.validate(pk.split("_")[1])));
//			getSession().delete(bean);
//			result++;
//		}
//		return result;
//	}
	
	public List<RelationBean> ajaxQuery(String hql, int start, int length) {
		
		List<RelationBean> beans = null;
		beans = getSession().createQuery(hql, RelationBean.class).setFirstResult(start).setMaxResults(length).getResultList();
		return beans;
	}
	
	public int ajaxCount(String hql){
		
		Query query = getSession().createQuery("select count(*) "+hql);
		int result = ((Long)query.getSingleResult()).intValue();
		return result;
	}
}

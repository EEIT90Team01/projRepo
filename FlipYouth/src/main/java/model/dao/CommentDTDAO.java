package model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.apache.commons.validator.routines.IntegerValidator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.CommentBean;
@Repository(value="commentDtdao")
public class CommentDTDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private IntegerValidator integerValidator;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public CommentBean select(Integer cmtSN) {
		
		CommentBean bean = null;
		bean = getSession().load(CommentBean.class, cmtSN);
		return bean;
	}

	public CommentBean cu(CommentBean bean) {
		
		getSession().saveOrUpdate(bean);
		return bean;
	}
	
	public int ajaxDelete(String[] toDelete) {
		
		int result = 0;
		CommentBean bean;
		for (String pk : toDelete) {
			bean = new CommentBean();
			bean.setCmtSN(integerValidator.validate(pk));
			getSession().delete(bean);
			result++;
		}
		return result;
	}	
	
	public List<CommentBean> ajaxQuery(String hql, int start, int length) {

		List<CommentBean> beans = null;
		List<Integer> pks = getSession().createQuery("select cmtSN "+hql, Integer.class).setFirstResult(start).setMaxResults(length)
				.getResultList();
		beans = this.select(pks);
		return beans;
	}

	public List<CommentBean> select(List<Integer> pks) {
		
		List<CommentBean> beans = new ArrayList<CommentBean>();
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

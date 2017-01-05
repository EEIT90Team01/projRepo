package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.CommentBean;
import model.CommentDao;
@Transactional
@Repository("commentDao")
public class CommentDaoH implements CommentDao {
	
	
	@Autowired
	SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//==================================================================================================================
	@Transactional
	@Override
	public CommentBean insert(CommentBean bean) {
		this.getSession().save(bean);
		
		return bean;
	}

	
	
	//==================================================================================================================
	
	@Transactional
	@Override
	public List<CommentBean> select(int gameSN) {
		Query query = this.getSession().createQuery("from CommentBean where gameSN=?");
		query.setParameter(0, gameSN);
		return (List<CommentBean>)query.getResultList();
		
	}

	
	
	//==================================================================================================================
	@Transactional
	@Override
	public boolean delete(int cmtSN) {
		this.getSession().delete(this.getSession().get(CommentBean.class, cmtSN));
		return false;
	}

	@Override

	@Transactional(readOnly =true)
	public CommentBean select(CommentBean bean) {
		CommentBean temp = this.getSession().get(CommentBean.class, bean.getCmtSN());
		return temp ;
	}
	

}

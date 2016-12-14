package model.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;

@Repository(value = "OrderDao")
public class OrderDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	
	@Transactional
	public OrderDetailBean selectCar(MemberBean memberBean,OrderBean orderBean){
		
		
		this.getSession().save(orderBean);
		
		return null;
	}



	
	
}

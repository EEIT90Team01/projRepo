package model.dao;

import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;
import model.OrderDetailPK;
import model.ShopBean;

@Repository(value = "OrderDao")
public class OrderDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public OrderDetailBean selectCar(MemberBean memberBean, OrderBean orderBean) {
		this.getSession().save(orderBean);
		return null;
	}

	public OrderBean save(OrderBean orderBean, Map<String, OrderDetailBean> cars) {
		Session session = this.getSession();
		int a = (int) session.save(orderBean);
		System.out.println("新建立的訂單編號為 = " + a);
		
		for(String key:cars.keySet()){
			ShopBean GameSN=session.get(ShopBean.class, Integer.parseInt(key));
			cars.get(key).getPK().setGameSN(GameSN);
			cars.get(key).getPK().setOrderSN(orderBean);
			session.save(cars.get(key));
		}
		return orderBean;
	}
}

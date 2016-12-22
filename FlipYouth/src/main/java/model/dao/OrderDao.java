package model.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;
import model.ShopBean;
import model.ShopServices;

@Repository(value = "OrderDao")
public class OrderDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public OrderDetailBean select(MemberBean memberBean, OrderBean orderBean) {
		
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
	
	
	
	
	public List<OrderBean> PageList(Integer mbrSN, Integer length, Integer start, Integer draw, String orderCol, String dir, String search,String OrderColNam) {
		List<OrderBean> list;
		String from = "from OrderBean";
		Query<OrderBean> order = this.getSession().createQuery(from+" where mbrSN = "+1 +"order by " + OrderColNam +" "+dir).setFirstResult(start).setMaxResults(length);
		int total= (int) this.getSession().createNativeQuery("SELECT COUNT(*) FROM order1 where mbrSN = "+1).getSingleResult();
		System.out.println(total);
		ShopServices.setRecordsTotal(total);
		
		list = order.getResultList();
//		ShopServices.setRecordsTotal(Total);;
		return list;
	}



	
}

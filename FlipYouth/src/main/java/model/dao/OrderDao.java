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

		for (String key : cars.keySet()) {
			ShopBean GameSN = session.get(ShopBean.class, Integer.parseInt(key));
			cars.get(key).getPK().setGameSN(GameSN);
			cars.get(key).getPK().setOrderSN(orderBean);
			session.save(cars.get(key));
		}
		return orderBean;
	}

	public List<OrderBean> PageList(Integer mbrSN, Integer length, Integer start, Integer draw, String orderCol,
			String dir, String search, String OrderColNam) {
		List<OrderBean> list;
		StringBuffer from = new StringBuffer("from OrderBean");
		StringBuffer  and = new StringBuffer();
		String[] colDB = { "orderSN", "orderDate", "orderAmount", "orderState", "name" };
		if (search.trim().length() != 0) {
			and.append("and ");
			for (int i = 0; i < colDB.length; i++) {
				and.append(colDB[i]);
				and.append(" like ");
				and.append("'%"+search+"%'");
				if(i!=colDB.length-1){and.append(" or ");}
			}
			System.out.println("and =  " + and);
		}
		Query<OrderBean> order = this.getSession()
				.createQuery(from.append(" where mbrSN = ").append(mbrSN).append(and).append("order by ").append(OrderColNam).append(" ").append(dir)+"").setFirstResult(start).setMaxResults(length);
		int total = (int) this.getSession().createNativeQuery("SELECT COUNT(*) FROM order1 where mbrSN = " + mbrSN)
				.getSingleResult();
		ShopServices.setRecordsTotal(total);
		list = order.getResultList();
		return list;
	}

	public void update(OrderBean orderBean) {
		 this.getSession().update(orderBean);
	}

	public OrderBean selectOrder(String orderSN) {
		
		return this.getSession().get(OrderBean.class, Integer.parseInt(orderSN));
	}
}

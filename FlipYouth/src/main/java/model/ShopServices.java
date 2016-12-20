package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.MemberDAO;
import model.dao.OrderDao;
import model.dao.ShopDao;


@Service(value = "shopServices")
@Transactional
public class ShopServices {
	@Autowired
	@Resource(name = "shopDao")
	ShopDao shopDao;

	@Autowired
	@Resource(name = "memberDao")
	MemberDAO memberDao;

	@Autowired
	@Resource(name = "OrderDao")
	OrderDao orderDao;
	
	
	public OrderBean newOrderAndDetail(OrderBean orderBean,String mbrSN, String orderAmount,Map<String, OrderDetailBean> car) throws ParseException {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSX");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DAY_OF_MONTH, +3);
		
		System.err.println("mbrSN =  "+mbrSN);
		orderBean.setMbrSN(Integer.parseInt(mbrSN));
		orderBean.setOrderAmount(Integer.parseInt(orderAmount));
		orderBean.setOrderDate(new java.util.Date(System.currentTimeMillis()));
		orderBean.setOrderState("未付款");
		orderBean.setPaymentMethod("超商取貨付款");
		orderBean.setFreight(100);
		orderBean.setProductDelivery(df.parse(df.format(cal.getTime())).toString());
		orderBean.setShippedDate(df.parse(df.format(cal.getTime())));
		return orderDao.save(orderBean,car);
	}

	
	
	public ShopBean select(int id) {
		return shopDao.select(id);
	}
	
	public MemberBean checkMember(String user, String pass) {
		MemberBean memberBean = memberDao.select(user);
		if (memberBean == null) {
			return null;
		}
		if (pass.trim().equals(memberBean.getMbrPassword().trim())) {
			return memberBean;
		} else {
			return null;
		}
	}
	
	public List<ShopBean> selectAll(String id) {// 進行比對
		switch (id) {
		case "1":
			id = "";
			return shopDao.select(id);
		case "2":
			id = "where Gameclass like '%自有商品%'";
			return shopDao.select(id);
		case "3":
			id = "where Gameclass like '%派對遊戲%'";
			return shopDao.select(id);
		case "4":
			id = "where Gameclass like '%親子桌遊%'";
			return shopDao.select(id);
		case "5":
			id = "where Gameclass like '%輕度策略%'";
			return shopDao.select(id);
		case "6":
			id = "where Gameclass like '%重度策略%'";
			return shopDao.select(id);
		case "7":
			id = "where Gameclass like '%台灣原創%'";
			return shopDao.select(id);
		case "8":
			id = "where Gameclass like '%麥卡貝推%'";
			return shopDao.select(id);
		case "9":
			id = "where Gameclass like '%卡套%'";
			return shopDao.select(id);
		}
		return shopDao.select("1");
	}
}

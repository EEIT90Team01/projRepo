package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.MemberBean;
import model.OrderBean;
import model.OrderDetailBean;
import model.OrderDetailPK;
import model.ShopBean;
import model.ShopServices;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
public class ShopController {
	int count = 0;
	int all = 0;
	Map<String, List<ShopBean>> shopBean = new HashMap<String, List<ShopBean>>();
	Map<String, ShopBean> pruduct = new HashMap<String, ShopBean>();
	Map<String, OrderDetailBean> car = new HashMap<String, OrderDetailBean>();
	Map<String, String> login = new HashMap<String, String>();
	@Autowired
	@Resource(name = "shopServices")
	ShopServices shopServices;

	// WriteOrder.controller

	@RequestMapping(path = "/writeOrder.controller")
	public String WriteOrder(HttpSession session,String mbrSN, String orderAmount,String name,String tel,String phone,String email,String address) throws ParseException {// 寫入訂單的controller
		OrderBean orderBean = new OrderBean(email,address,name,tel,phone);
		OrderBean OrderBean=shopServices.newOrderAndDetail(orderBean,mbrSN,orderAmount,car);
		session.setAttribute("order", OrderBean);
		return "orderOver";
	}

	// shop controller
	@RequestMapping(path = "/Shop.controller")
	public String Shop(Model model, HttpServletResponse response, HttpSession session, String gameClass, String ID,
			String user, String pass, String name, Integer price, String clearCar) throws IOException {
		if (session.isNew() || count == 0 || clearCar != null) {
			// 如果是第一次進入的人 清空購物車
			session.setAttribute("ALL", 0);
			session.setAttribute("count", 0);
			car.clear();
			count = 0;
		}

		if (clearCar != null) {
			return "list";
		}

		if (name != null) {
			// name==我放入購物車的商品的編號

			count++;

			if (car.get(name) == null) {// 先進去購物車找
				OrderDetailPK PK = new OrderDetailPK();
				OrderDetailBean orderDetailBean = new OrderDetailBean();
				PK.setGameSN(shopServices.select(Integer.parseInt(name)));
				orderDetailBean.setPK(PK);
				orderDetailBean.setQuantity(1);
				car.put(name, orderDetailBean);

				System.out.println("第一次加入" + name + "商品 比數=" + orderDetailBean.getQuantity());
			} else {
				OrderDetailBean a = car.get(name);
				a.setQuantity(a.getQuantity().intValue() + 1);
				car.put(name, a);
				System.out.println("更新" + name + "商品" + car.get(name).getQuantity());
			}

			session.setAttribute("cars", car);

			session.setAttribute("count", count);
			all = (int) session.getAttribute("ALL");

			session.setAttribute("ALL", all + price);
			// &#x76EE;&#x524D;&#x4EF6;&#x6578 == 目前件數
			// &#x76EE;&#x524D;&#x91D1;&#x984D == 目前金額
			response.getWriter().write("<font color='red'>&#x76EE;&#x524D;&#x91D1;&#x984D;" + (all + price)
					+ "<br>&#x76EE;&#x524D;&#x4EF6;&#x6578;" + count + "</font>");
			return null;
		}

		// ShopBean bean =
		// shopServices.getShopDao().getSession().get(ShopBean.class, 1);

		// if(user==null|"".equals(user.trim())){
		// System.out.println("user==null");
		// login.put("userError ", "請輸入帳號");
		// return "login.jsp";
		// }

		if (ID == null) {// 把要查詢的遊戲類別送去比對
			if ("".equals(gameClass) || gameClass == null) {
				gameClass = "1";
			}
			List<ShopBean> ShopBean = shopServices.selectAll(gameClass);
			// 放入拿到的資料
			shopBean.put("shopBean", ShopBean);
			model.addAllAttributes(shopBean);
			return "list";
		} else {// 第幾筆商品
			pruduct.put("pruduct", shopServices.select(Integer.parseInt(ID)));
			model.addAllAttributes(pruduct);
			return "pruduct";
		}
	}

	// order controller
	
	@SuppressWarnings("unchecked")
	@RequestMapping(path = "/order.controller")
	public String Order(String delectCar, String goOrder, HttpSession session, String change, String value,
			String GameSN) throws ParseException {

		if (delectCar != null) {// 按下取消
			car.remove(delectCar);
			all = 0;
			count = 0;

			for (String a : car.keySet()) {
				int b = car.get(a).getQuantity();
				int c = car.get(a).getPK().getGameSN().getPrice();
				all += (b * c);
				count += b;

			}
			session.setAttribute("count", count);
			session.setAttribute("ALL", all);
			return "checkOut";
		}
		if (change != null) {
			all = 0;
			count = 0;
			car = (Map<String, OrderDetailBean>) session.getAttribute("cars");
			OrderDetailBean orderDetailBean = car.get(GameSN);
			if (Integer.parseInt(value) > (orderDetailBean.getPK().getGameSN().getStockQuantity().intValue())) {
				System.out.println("庫存不足");
				return "index";
			}
			;
			orderDetailBean.setQuantity(Integer.parseInt(value));
			car.put(GameSN, orderDetailBean);

			for (String a : car.keySet()) {
				int b = car.get(a).getQuantity();
				int c = car.get(a).getPK().getGameSN().getPrice();
				all += (b * c);
				count += b;

			}
			session.setAttribute("count", count);
			session.setAttribute("ALL", all);
			return "checkOut";
		}

		return "checkOut";
	}

	// login controller
	@RequestMapping(path = "/login.controller")
	public String login(HttpServletResponse response, HttpSession session, String user, String pass)
			throws IOException, ParseException {

		if (pass == null || pass.trim().equals("") || user == null || user.trim().equals("")) {
			// 帳或密是空
			return null;
		}
		if (user != null && pass != null) {
			System.out.println("checkMember");
			MemberBean memberBean = shopServices.checkMember(user, pass);

			if (memberBean != null) {
				System.out.println(memberBean.getMbrName());
				session.setAttribute("loginOK", memberBean);
				session.setAttribute("car", car);
				return (String) session.getAttribute("url");
			} else {// 密碼錯誤
				System.out.println("帳號或密碼輸入錯誤或密碼整個錯誤");
				return null;
			}
		}
		return null;
	}

}

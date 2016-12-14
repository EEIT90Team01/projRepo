package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Order1")
public class OrderBean {
	
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	private Integer OrderSN;
	private Integer MbrSN;
	private Integer OrderAmount;//訂單金額
	private Date ShippedDate;//出貨日期
	private Date OrderDate;//下訂日
	private String StrProductDelivery;//到貨日期
	private Integer Freight;//運費
	private String	StrPaymentMethod;//付費方式
	private String StrOrderState;//訂單狀態
	
	

	
	
	public Integer getOrderSN() {
		return OrderSN;
	}

	public void setOrderSN(Integer orderSN) {
		OrderSN = orderSN;
	}

	public Integer getMbrSN() {
		return MbrSN;
	}

	public void setMbrSN(Integer mbrSN) {
		MbrSN = mbrSN;
	}

	public Integer getOrderAmount() {
		return OrderAmount;
	}

	public void setOrderAmount(Integer orderAmount) {
		OrderAmount = orderAmount;
	}

	public Date getShippedDate() {
		return ShippedDate;
	}

	public void setShippedDate(Date shippedDate) {
		ShippedDate = shippedDate;
	}

	public Date getOrderDate() {
		return OrderDate;
	}

	public void setOrderDate(Date orderDate) {
		OrderDate = orderDate;
	}

	public String getStrProductDelivery() {
		return StrProductDelivery;
	}

	public void setStrProductDelivery(String strProductDelivery) {
		StrProductDelivery = strProductDelivery;
	}

	public Integer getFreight() {
		return Freight;
	}

	public void setFreight(Integer freight) {
		Freight = freight;
	}

	public String getStrPaymentMethod() {
		return StrPaymentMethod;
	}

	public void setStrPaymentMethod(String strPaymentMethod) {
		StrPaymentMethod = strPaymentMethod;
	}

	public String getStrOrderState() {
		return StrOrderState;
	}

	public void setStrOrderState(String strOrderState) {
		StrOrderState = strOrderState;
	}

	
	
	
	
	
}

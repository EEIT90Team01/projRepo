package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Order1")
public class OrderBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderSN;
	private Integer mbrSN;
	private Integer orderAmount;//訂單金額
	private Date shippedDate;//出貨日期
	private Date orderDate;//下訂日
	private String productDelivery;//到貨日期
	private Integer freight;//運費
	private String	paymentMethod;//付費方式
	private String orderState;//訂單狀態
	private String email;//連絡資訊
	private String address;
	private String name;
	private String tel;
	private String phone;
	private String image;
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "PK.orderSN")
//	private Set<OrderDetailBean> orderDetail;

	public OrderBean() {
		super();
	}

	public  OrderBean(Integer orderAmount, String email, String address, String name, String tel, String phone) {
		this.orderAmount = orderAmount;
		this.email = email;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.phone = phone;
	}

	public OrderBean(String image,String email, String address, String name, String tel, String phone) {
		this.image=image;
		this.email = email;
		this.address = address;
		this.name = name;
		this.tel = tel;
		this.phone = phone;
	}

//	public Set<OrderDetailBean> getOrderDetail() {
//		return orderDetail;
//	}
//
//	public void setOrderDetail(Set<OrderDetailBean> orderDetail) {
//		this.orderDetail = orderDetail;
//	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getOrderSN() {
		return orderSN;
	}
	public void setOrderSN(Integer orderSN) {
		this.orderSN = orderSN;
	}
	public Integer getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(Integer mbrSN) {
		this.mbrSN = mbrSN;
	}
	public Integer getOrderAmount() {
		return orderAmount;
	}
	public void setOrderAmount(Integer orderAmount) {
		this.orderAmount = orderAmount;
	}
	public Date getShippedDate() {
		return shippedDate;
	}
	public void setShippedDate(Date shippedDate) {
		this.shippedDate = shippedDate;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getProductDelivery() {
		return productDelivery;
	}
	public void setProductDelivery(String productDelivery) {
		this.productDelivery = productDelivery;
	}
	public Integer getFreight() {
		return freight;
	}
	public void setFreight(Integer freight) {
		this.freight = freight;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	@Override
	public String toString() {
		return "OrderBean [orderSN=" + orderSN + ", mbrSN=" + mbrSN + ", orderAmount=" + orderAmount + ", shippedDate="
				+ shippedDate + ", orderDate=" + orderDate + ", productDelivery=" + productDelivery + ", freight="
				+ freight + ", paymentMethod=" + paymentMethod + ", orderState=" + orderState + ", email=" + email
				+ ", address=" + address + ", name=" + name + ", tel=" + tel + ", phone=" + phone + ", image=" + image
				+ "]";
	}

	
	
}
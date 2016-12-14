package model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Embeddable
public class OrderDetailPK implements Serializable {

	// @OneToMany

	// @GeneratedValue(strategy = GenerationType.TABLE)
	private Integer OrderSN;
	// @OneToOne

	// @ManyToOne(cascade = CascadeType.ALL, targetEntity = ShopBean.class)
	// @ManyToOne(cascade = CascadeType.ALL)
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "GameSN")
	private ShopBean shopBean;

	public Integer getOrderSN() {
		return OrderSN;
	}

	public void setOrderSN(Integer orderSN) {
		OrderSN = orderSN;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "GameSN")
	public ShopBean getShopBean() {
		return shopBean;
	}

	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}

	@Override
	public String toString() {
		return "OrderDetailPK [OrderSN=" + OrderSN + ", shopBean=" + shopBean + "]";
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

}

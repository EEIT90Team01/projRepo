package model;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.springframework.context.annotation.Lazy;
@Lazy(false)
@Embeddable
public class OrderDetailPK implements Serializable {

	private static final long serialVersionUID = 1L;

	// @GeneratedValue(strategy = GenerationType.TABLE)
	@ManyToOne
	@JoinColumn(name = "orderSN")
	@JsonBackReference
	private OrderBean orderSN;

	@ManyToOne
	@JoinColumn(name = "gameSN")
	@JsonBackReference
	private ShopBean gameSN;

	public OrderDetailPK(){}
	
	public OrderDetailPK(OrderBean orderSN, ShopBean gameSN) {
		this.orderSN = orderSN;
		this.gameSN = gameSN;
	}

	public OrderBean getOrderSN() {
		return orderSN;
	}

	public void setOrderSN(OrderBean orderSN) {
		this.orderSN = orderSN;
	}

	public ShopBean getGameSN() {
		return gameSN;
	}

	public void setGameSN(ShopBean gameSN) {
		this.gameSN = gameSN;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gameSN == null) ? 0 : gameSN.hashCode());
		result = prime * result + ((orderSN == null) ? 0 : orderSN.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof OrderDetailPK))
			return false;
		OrderDetailPK other = (OrderDetailPK) obj;
		if (gameSN == null) {
			if (other.gameSN != null)
				return false;
		} else if (!gameSN.equals(other.gameSN))
			return false;
		if (orderSN == null) {
			if (other.orderSN != null)
				return false;
		} else if (!orderSN.equals(other.orderSN))
			return false;
		return true;
	}


	

}
package model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetailBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private OrderDetailPK PK;
	// @ManyToOne(cascade=CascadeType.ALL)
	// private ShopBean shopBean;

	public OrderDetailPK getPK() {
		return PK;
	}

	public void setPK(OrderDetailPK pK) {
		PK = pK;
	}

	private Integer Quantity;// 數量

	public Integer getQuantity() {
		return Quantity;
	}

	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetailBean [PK=" + PK + ", Quantity=" + Quantity + "]";
	}
	
}

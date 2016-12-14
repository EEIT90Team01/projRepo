package model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@SuppressWarnings("serial")
@Entity
//@IdClass(OrderDetailPK.class)
@Table(name = "OrderDetail")
@Component(value="OrderDetailBean")
public class OrderDetailBean implements Serializable {

	@EmbeddedId
	private OrderDetailPK PK;
	private Integer Quantity;// 數量
//	@ManyToOne(cascade=CascadeType.ALL)
//	private ShopBean shopBean;
	
	
	
	public OrderDetailPK getPK() {
		return PK;
	}

	public void setPK(OrderDetailPK pK) {
		PK = pK;
	}

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

package model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="Location")
public class LocationBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer locSN;
	private String locName;
	private String locLong;
	private String locLat;
	private String locPhone;
	
	
	public LocationBean() {
		super();
	}
	public Integer getLocSN() {
		return locSN;
	}
	public void setLocSN(Integer locSN) {
		this.locSN = locSN;
	}
	
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	
	public String getLocLong() {
		return locLong;
	}
	public void setLocLong(String locLong) {
		this.locLong = locLong;
	}
	
	public String getLocLat() {
		return locLat;
	}
	public void setLocLat(String locLat) {
		this.locLat = locLat;
	}
	
	public String getLocPhone() {
		return locPhone;
	}
	public void setLocPhone(String locPhone) {
		this.locPhone = locPhone;
	}
	
	@Override
	public String toString() {
		return "LocationBean [locSN=" + locSN + ", locName=" + locName + ", locLong=" + locLong + ", locLat=" + locLat
				+ ", locPhone=" + locPhone + "]";
	}
	public LocationBean(String locName) {
		super();
		this.locName = locName;
	}
	
	public LocationBean(Integer locSN, String locName, String locLong, String locLat, String locPhone) {
		super();
		this.locSN = locSN;
		this.locName = locName;
		this.locLong = locLong;
		this.locLat = locLat;
		this.locPhone = locPhone;
	}
}
package model;

import java.io.Serializable;

public class EventGoFbBean implements Serializable {
	private static final long serialVersionUID = 1L;

	// 會員資料
	private Integer userSN;
	private String locLat;
	private String locLong;
	// 用戶輸入資料
	private String userAddAddress;
	private java.util.Date startDateTime;
	private java.util.Date endDateTime;
	private java.util.Date closeDateTime;
	private Integer userAddUpLimit;
	private Integer userAddDownLimit;
	
	//使用者輸入之地址資料
	private String userInputAddress;
	
	public Integer getUserSN() {
		return userSN;
	}
	public void setUserSN(Integer userSN) {
		this.userSN = userSN;
	}
	public String getUserAddAddress() {
		return userAddAddress;
	}
	public void setUserAddAddress(String userAddAddress) {
		this.userAddAddress = userAddAddress;
	}
	public java.util.Date getStartDateTime() {
		return startDateTime;
	}
	public void setStartDateTime(java.util.Date startDateTime) {
		this.startDateTime = startDateTime;
	}
	public java.util.Date getEndDateTime() {
		return endDateTime;
	}
	public void setEndDateTime(java.util.Date endDateTime) {
		this.endDateTime = endDateTime;
	}
	public java.util.Date getCloseDateTime() {
		return closeDateTime;
	}
	public void setCloseDateTime(java.util.Date closeDateTime) {
		this.closeDateTime = closeDateTime;
	}
	public Integer getUserAddUpLimit() {
		return userAddUpLimit;
	}
	public void setUserAddUpLimit(Integer userAddUpLimit) {
		this.userAddUpLimit = userAddUpLimit;
	}
	public Integer getUserAddDownLimit() {
		return userAddDownLimit;
	}
	public void setUserAddDownLimit(Integer userAddDownLimit) {
		this.userAddDownLimit = userAddDownLimit;
	}
	public String getUserInputAddress() {
		return userInputAddress;
	}
	public void setUserInputAddress(String userInputAddress) {
		this.userInputAddress = userInputAddress;
	}
	public String getLocLat() {
		return locLat;
	}
	public void setLocLat(String locLat) {
		this.locLat = locLat;
	}
	public String getLocLong() {
		return locLong;
	}
	public void setLocLong(String locLong) {
		this.locLong = locLong;
	}
	
}
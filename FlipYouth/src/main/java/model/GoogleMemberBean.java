package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GoogleMember")
public class GoogleMemberBean implements Serializable {
	
	public GoogleMemberBean() {
	}
	public GoogleMemberBean(String googleSN, Integer mbrSN) {
		this.GoogleSN = googleSN;
		this.mbrSN = mbrSN;
	}
	@Id
	@Column(name="GoogleSN")
	private String GoogleSN; 
	@Column(name="mbrSN")
	private Integer mbrSN;
	public String getGoogleSN() {
		return GoogleSN;
	}
	public void setGoogleSN(String googleSN) {
		GoogleSN = googleSN;
	}
	public Integer getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(Integer mbrSN) {
		this.mbrSN = mbrSN;
	}
	
	
}
package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FBMember")
public class FBMemberBean implements Serializable {
	private Integer mbrSN;
	@Id
	private String FBSN;

	public FBMemberBean(Integer mbrSN, String fBSN) {
		this.mbrSN = mbrSN;
		FBSN = fBSN;
	}

	public FBMemberBean() {
	}

	public Integer getMbrSN() {
		return mbrSN;
	}

	public void setMbrSN(Integer mbrSN) {
		this.mbrSN = mbrSN;
	}

	public String getFBSN() {
		return FBSN;
	}

	public void setFBSN(String fBSN) {
		FBSN = fBSN;
	}

}
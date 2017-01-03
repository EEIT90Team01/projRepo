package model.bean;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Administrator")
public class AdministratorBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	private String admId;
	private byte[] admPassword;
	private String admEmail;
	private AuthorityBean authId;
	
	@Id
	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public byte[] getAdmPassword() {
		return admPassword;
	}

	public void setAdmPassword(byte[] admPassword) {
		this.admPassword = admPassword;
	}

	public String getAdmEmail() {
		return admEmail;
	}

	public void setAdmEmail(String admEmail) {
		this.admEmail = admEmail;
	}
	
	@ManyToOne
	@JoinColumn(name="AuthId")
	public AuthorityBean getAuthId() {
		return authId;
	}

	public void setAuthId(AuthorityBean authId) {
		this.authId = authId;
	}

	@Override
	public String toString() {
		return "AdministratorBean [admId=" + admId + ", admPassword=" + Arrays.toString(admPassword) + ", admEmail="
				+ admEmail + ", authId=" + authId + "]";
	}

	public AdministratorBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdministratorBean(String admId) {
		super();
		this.admId = admId;
	}

	public AdministratorBean(String admId, byte[] admPassword, String admEmail, AuthorityBean authId) {
		super();
		this.admId = admId;
		this.admPassword = admPassword;
		this.admEmail = admEmail;
		this.authId = authId;
	}
	
}

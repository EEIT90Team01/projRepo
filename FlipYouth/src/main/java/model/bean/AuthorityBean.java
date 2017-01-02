package model.bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "Authority")
public class AuthorityBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer authId;
	private String authName;

	@Id
	public Integer getAuthId() {
		return authId;
	}

	public void setAuthId(Integer authId) {
		this.authId = authId;
	}
	
	@Nationalized
	public String getAuthName() {
		return authName;
	}

	public void setAuthName(String authName) {
		this.authName = authName;
	}

	@Override
	public String toString() {
		return "authId=" + authId + ", authName=" + authName + "]";
	}

	public AuthorityBean() {
		super();
	}

	public AuthorityBean(Integer authId) {
		super();
		this.authId = authId;
	}

	public AuthorityBean(Integer authId, String authName) {
		super();
		this.authId = authId;
		this.authName = authName;
	}	
	
}

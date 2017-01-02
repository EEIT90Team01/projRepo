package model.bean;

import java.io.Serializable;
import java.util.Date;

public class BackEndLogBeanPK implements Serializable {
	private static final long serialVersionUID = 1L;
	
	protected String admId;
	protected java.util.Date executeTime;
	public BackEndLogBeanPK() {
		super();
	}
	public BackEndLogBeanPK(String admId, Date executeTime) {
		super();
		this.admId = admId;
		this.executeTime = executeTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((admId == null) ? 0 : admId.hashCode());
		result = prime * result + ((executeTime == null) ? 0 : executeTime.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BackEndLogBeanPK other = (BackEndLogBeanPK) obj;
		if (admId == null) {
			if (other.admId != null)
				return false;
		} else if (!admId.equals(other.admId))
			return false;
		if (executeTime == null) {
			if (other.executeTime != null)
				return false;
		} else if (!executeTime.equals(other.executeTime))
			return false;
		return true;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public java.util.Date getExecuteTime() {
		return executeTime;
	}
	public void setExecuteTime(java.util.Date executeTime) {
		this.executeTime = executeTime;
	}
	
}

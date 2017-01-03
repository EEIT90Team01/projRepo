package model.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import org.hibernate.annotations.Nationalized;

@Entity
@Table(name = "BackEndLog")
@IdClass(BackEndLogBeanPK.class)
public class BackEndLogBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String admId;
	private java.util.Date executeTime;
	private String belNotes;
	private String sqlCommand;
	
	@Id
	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}
	@Id
	public java.util.Date getExecuteTime() {
		return executeTime;
	}

	public void setExecuteTime(java.util.Date executeTime) {
		this.executeTime = executeTime;
	}
	@Nationalized
	public String getBelNotes() {
		return belNotes;
	}

	public void setBelNotes(String belNotes) {
		this.belNotes = belNotes;
	}

	public String getSqlCommand() {
		return sqlCommand;
	}

	public void setSqlCommand(String sqlCommand) {
		this.sqlCommand = sqlCommand;
	}

	@Override
	public String toString() {
		return "BackEndLogBean [admId=" + admId + ", executeTime=" + executeTime + ", belNotes=" + belNotes
				+ ", sqlCommand=" + sqlCommand + "]";
	}

	public BackEndLogBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BackEndLogBean(String admId, Date executeTime) {
		super();
		this.admId = admId;
		this.executeTime = executeTime;
	}

	public BackEndLogBean(String admId, Date executeTime, String belNotes, String sqlCommand) {
		super();
		this.admId = admId;
		this.executeTime = executeTime;
		this.belNotes = belNotes;
		this.sqlCommand = sqlCommand;
	}
}

package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "Relation")
@Component(value="relationBean")
public class RelationBean implements Serializable{
	
	private MemberBean mbrSN;
	private MemberBean targetMbrSN;
	private String notes;
	private Integer relation;
	private java.util.Date createTime;
	
	public RelationBean(){
		
	}
	
	
	public RelationBean(MemberBean mbrSN, MemberBean targetMbrSN, String notes, Integer relation, Date createTime) {
		super();
		this.mbrSN = mbrSN;
		this.targetMbrSN = targetMbrSN;
		this.notes = notes;
		this.relation = relation;
		this.createTime = createTime;
	}


	@Override
	public String toString() {
		return "RelationBean [mbrSN=" + mbrSN + ", targetMbrSN=" + targetMbrSN + ", notes=" + notes + ", relation="
				+ relation + ", createTime=" + createTime + "]";
	}
	
	@Id
	@ManyToOne
	@JoinColumn(name = "mbrSN")
	public MemberBean getMbrSN() {
		return this.mbrSN;
	}
	public void setMbrSN(MemberBean mbrSN) {
		this.mbrSN = mbrSN;
	}
	

	@Id
	@ManyToOne
	@JoinColumn(name = "targetMbrSN")
	public MemberBean getTargetMbrSN() {
		return this.targetMbrSN;
	}
	public void setTargetMbrSN(MemberBean targetMbrSN) {
		this.targetMbrSN = targetMbrSN;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Integer getRelation() {
		return relation;
	}
	public void setRelation(Integer relation) {
		this.relation = relation;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	

	
}

// INSERT INTO [dbo].[Relation]

// VALUES
// (<mbrSN, int,>
// ,<targetMbrSN, int,>
// ,<notes, nvarchar(50),>
// ,<relation, int,>
// ,<createTime, datetime,>)
// GO


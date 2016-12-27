package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Comment")
public class CommentBean implements Serializable{
	
	private Integer cmtSN;
	private Integer gameSN;
	private MemberBean mbrSN;
	private java.util.Date cmtTime;
	private String text;
	
		
	@Id
	@Column(name="cmtSN")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCmtSN() {
		return cmtSN;
	}
	public void setCmtSN(Integer cmtSN) {
		this.cmtSN = cmtSN;
	}
	public Integer getGameSN() {
		return gameSN;
	}
	public void setGameSN(Integer gameSN) {
		this.gameSN = gameSN;
	}
	@ManyToOne
	@JoinColumn(name = "mbrSN")
	public MemberBean getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(MemberBean mbrSN) {
		this.mbrSN = mbrSN;
	}
	public java.util.Date getCmtTime() {
		return cmtTime;
	}
	public void setCmtTime(java.util.Date cmtTime) {
		this.cmtTime = cmtTime;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	@Override
	public String toString() {
		return "CommentBean [cmtSN=" + cmtSN + ", gameSN=" + gameSN + ", mbrSN=" + mbrSN + ", cmtTime=" + cmtTime
				+ ", text=" + text + "]";
	}
	
	
	
}

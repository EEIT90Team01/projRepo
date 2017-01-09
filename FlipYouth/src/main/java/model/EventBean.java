package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="Event")
public class EventBean implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer eventSN;
	@ManyToOne //有很多不同的會員
	@JoinColumn(name = "hostMbrSN") //join到Member Table
	private MemberBean hostMbrSN;
//	@ManyToOne //有很多不同的位置
//	@JoinColumn(name="locSN") //join到Location Table
	private Integer locSN;
	private Integer minMember;
	private java.util.Date beginTime;
	private java.util.Date endTime;
	private Integer eventState;
	private Integer maxMember;
	private java.util.Date deadline;
	
	public EventBean() {
	}

	public Integer getEventSN() {
		return eventSN;
	}
	public void setEventSN(Integer eventSN) {
		this.eventSN = eventSN;
	}

//	@ManyToOne //有很多房主
//	@JoinColumn(name="mbrSN")
	public MemberBean getHostMbrSN() {
		return hostMbrSN;
	}
	public void setHostMbrSN(MemberBean hostMbrSN) {
		this.hostMbrSN = hostMbrSN;
	}
	
	public Integer getLocSN() {
		return locSN;
	}
	public void setLocSN(Integer locSN) {
		this.locSN = locSN;
	}

	public Integer getMinMember() {
		return minMember;
	}
	public void setMinMember(Integer minMember) {
		this.minMember = minMember;
	}

	public java.util.Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(java.util.Date beginTime) {
		this.beginTime = beginTime;
	}

	public java.util.Date getEndTime() {
		return endTime;
	}
	public void setEndTime(java.util.Date endTime) {
		this.endTime = endTime;
	}

	public Integer getEventState() {
		return eventState;
	}
	public void setEventState(Integer eventState) {
		this.eventState = eventState;
	}

	public Integer getMaxMember() {
		return maxMember;
	}
	public void setMaxMember(Integer maxMember) {
		this.maxMember = maxMember;
	}

	public java.util.Date getDeadline() {
		return deadline;
	}
	public void setDeadline(java.util.Date deadline) {
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return "EventBean [eventSN=" + eventSN + ", hostMbrSN=" + hostMbrSN + ", locSN=" + locSN + ", minMember="
				+ minMember + ", beginTime=" + beginTime + ", endTime=" + endTime + ", eventState=" + eventState
				+ ", maxMember=" + maxMember + ", deadline=" + deadline + "]";
	}
	
	public EventBean( MemberBean hostMbrSN, Integer locSN, Integer minMember, Date beginTime, Date endTime,
			Integer eventState, Integer maxMember, Date deadline) {
		super();
		
		this.hostMbrSN = hostMbrSN;
		this.locSN = locSN;
		this.minMember = minMember;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.eventState = eventState;
		this.maxMember = maxMember;
		this.deadline = deadline;
	}
	
}
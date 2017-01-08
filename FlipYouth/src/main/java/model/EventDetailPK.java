package model;

import java.io.Serializable;
import javax.persistence.*;

@Embeddable
public class EventDetailPK implements Serializable {
	private static final long serialVersionUID = 1L;
	///////////////////
	@ManyToOne //有很多不同的團
	@JoinColumn(name = "eventSN") //join到Event Table
	private EventBean eventSN;
	@ManyToOne //有很多不同的會員 
	@JoinColumn(name = "mbrSN") //join到Member Table
	private MemberBean mbrSN;
	
	///////////////////
	///////////////////
	public EventDetailPK() {
	}
	///////////////////
	
	///////////////////
	public EventBean getEventSN() {
		return eventSN;
	}
	public EventDetailPK(EventBean eventSN, MemberBean mbrSN) {
		super();
		this.eventSN = eventSN;
		this.mbrSN = mbrSN;
	}

	public void setEventSN(EventBean eventSN) {
		this.eventSN = eventSN;
	}
	///////////////////
	///////////////////
	public MemberBean getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(MemberBean mbrSN) {
		this.mbrSN = mbrSN;
	}
	///////////////////
	///////////////////
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eventSN == null) ? 0 : eventSN.hashCode());
		result = prime * result + ((mbrSN == null) ? 0 : mbrSN.hashCode());
		return result;
	}
	///////////////////
	///////////////////
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		EventDetailPK other = (EventDetailPK) obj;
		if (eventSN == null) {
			if (other.eventSN != null)
				return false;
		} else if (!eventSN.equals(other.eventSN))
			return false;
		if (mbrSN == null) {
			if (other.mbrSN != null)
				return false;
		} else if (!mbrSN.equals(other.mbrSN))
			return false;
		return true;
	}
	///////////////////
	///////////////////
	@Override
	public String toString() {
		return "...EventDetailPK [eventSN=" + eventSN.getEventSN() + ", mbrSN=" + mbrSN.getMbrSN() + "]...";
	}
	///////////////////
}
package model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="EventDetail")
public class EventDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	private Integer eventSN;
	@Id
	private Integer mbrSN;
	
	@OneToOne
	@JoinColumn(name="eventSN")
	public Integer getEventSN() {
		return eventSN;
	}
	public void setEventSN(Integer eventSN) {
		this.eventSN = eventSN;
	}
	
	@OneToOne
	@JoinColumn(name="mbrSN")
	public Integer getMbrSN() {
		return mbrSN;
	}
	public void setMbrSN(Integer mbrSN) {
		this.mbrSN = mbrSN;
	}
	
	@Override
	public String toString() {
		return "EventDetailBean [eventSN=" + eventSN + ", mbrSN=" + mbrSN + "]";
	}
}
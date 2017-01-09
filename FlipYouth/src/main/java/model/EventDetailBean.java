package model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "EventDetail")
public class EventDetailBean implements Serializable {
	private static final long serialVersionUID = 1L;
	///////////////////
	@EmbeddedId
	private EventDetailPK eventDetailPK;
	///////////////////
	public EventDetailBean(){
	}
	///////////////////
	public EventDetailPK getEventDetailPK() {
		return eventDetailPK;
	}
	public void setEventDetailPK(EventDetailPK eventDetailPK) {
		this.eventDetailPK = eventDetailPK;
	}
	///////////////////
	///////////////////
	@Override
	public String toString() {
		return "EventDetailBean {eventDetailPK=" + eventDetailPK + "}";
	}
	///////////////////
	
	public EventDetailBean(EventDetailPK eventDetailPK) {
		super();
		this.eventDetailPK = eventDetailPK;
	}
}
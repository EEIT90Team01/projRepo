package model;

public class EventSNDetailFbBean {

	private String eventSN;
	private String locName;
	private String hostName;
	private java.util.Date startTime;
	private java.util.Date endTime;
	private String hostimage;
	
	public String getEventSN() {
		return eventSN;
	}
	public void setEventSN(String eventSN) {
		this.eventSN = eventSN;
	}
	public String getLocName() {
		return locName;
	}
	public void setLocName(String locName) {
		this.locName = locName;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public java.util.Date getStartTime() {
		return startTime;
	}
	public void setStartTime(java.util.Date startTime) {
		this.startTime = startTime;
	}
	public java.util.Date getEndTime() {
		return endTime;
	}
	public void setEndTime(java.util.Date endTime) {
		this.endTime = endTime;
	}
	public String getHostimage() {
		return hostimage;
	}
	public void setHostimage(String hostimage) {
		this.hostimage = hostimage;
	}
	
}
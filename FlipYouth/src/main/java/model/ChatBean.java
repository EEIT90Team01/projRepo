package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="chatHistory")
public class ChatBean {
	private Integer chatSN;
	private Integer sendMbrSN;
	private Integer receivedMbrSN;
	private String message;
	private java.util.Date createTime;
	
	
	public ChatBean() {
		
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getChatSN() {
		return chatSN;
	}
	public void setChatSN(Integer chatSN) {
		this.chatSN = chatSN;
	}
	
//	@ManyToOne
//	@JoinColumn(name = "sendMbrSN")
	public Integer getSendMbrSN() {
		return sendMbrSN;
	}
	public void setSendMbrSN(Integer sendMbrSN) {
		this.sendMbrSN = sendMbrSN;
	}
	
//	@ManyToOne
//	@JoinColumn(name = "receivedMbrSN")
	public Integer getReceivedMbrSN() {
		return receivedMbrSN;
	}
	public void setReceivedMbrSN(Integer receivedMbrSN) {
		this.receivedMbrSN = receivedMbrSN;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	@Override
	public String toString() {
		return "chatBean [chatSN=" + chatSN + ", sendMbrSN=" + sendMbrSN + ", receivedMbrSN=" + receivedMbrSN
				+ ", message=" + message + ", createTime=" + createTime + "]";
	}
	public ChatBean( Integer sendMbrSN, Integer receivedMbrSN, String message, Date createTime) {
		super();
		this.sendMbrSN = sendMbrSN;
		this.receivedMbrSN = receivedMbrSN;
		this.message = message;
		this.createTime = createTime;
	}
	


	
	
	
}

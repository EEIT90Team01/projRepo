package model;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.*;
import org.springframework.context.*;
import org.springframework.context.support.*;

@Entity
@Table(name = "Event")
public class EventBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private Integer eventSN;
	private Integer hostMbrSN;
	private Integer locSN;
	private Integer minMember;
	private java.util.Date beginTime;
	private java.util.Date endTime;
	private Integer eventState;
	private Integer maxMember;
	private java.util.Date deadline;

	@ManyToOne
	@JoinColumn(name = "eventSN")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getEventSN() {
		return eventSN;
	}

	public void setEventSN(Integer eventSN) {
		this.eventSN = eventSN;
	}

	@OneToOne
	@JoinColumn(name = "mbrSN")
	public Integer getHostMbrSN() {
		return hostMbrSN;
	}

	public void setHostMbrSN(Integer hostMbrSN) {
		this.hostMbrSN = hostMbrSN;
	}

	@OneToOne
	@JoinColumn(name = "locSN")
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
		return "EvenBean [eventSN=" + eventSN + ", hostMbrSN=" + hostMbrSN + ", locSN=" + locSN + ", minMember="
				+ minMember + ", beginTime=" + beginTime + ", endTime=" + endTime + ", eventState=" + eventState
				+ ", maxMember=" + maxMember + ", deadline=" + deadline + "]";
	}

	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		Session session = sessionFactory.getCurrentSession();

		EventBean bean = new EventBean();

		try {
			session.beginTransaction();

			bean = session.get(EventBean.class, "A123");
			System.out.println(bean.getEventSN() + "," + bean.getEventState() + "," + bean.getHostMbrSN() + ","
					+ bean.getLocSN() + "," + bean.getMaxMember() + "," + bean.getMinMember() + ","
					+ bean.getBeginTime() + "," + bean.getDeadline() + "," + bean.getEndTime() + ",");

			session.getTransaction().commit();
			((ConfigurableApplicationContext) context).close();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}
		session.close();
	}
}
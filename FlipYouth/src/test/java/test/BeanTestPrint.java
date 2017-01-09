package test;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.EventBean;
import model.EventDetailBean;
import model.LocationBean;

public class BeanTestPrint {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beanTest.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		Session session = sessionFactory.getCurrentSession();

		EventBean bean;
//		EventDetailBean bean1;
		LocationBean bean2;
//		MemberBean mb;
		try {
			session.beginTransaction();

			for (int i = 1; i <= 5; i++) {
				bean = session.get(EventBean.class, i);
				System.out.println(bean);
				System.out.println(bean.toString());
				System.out.println(bean.getEventSN() + "," + bean.getEventState() + "," + bean.getHostMbrSN() + ","
						+ bean.getLocSN() + "," + bean.getMaxMember() + "," + bean.getMinMember() + ","
						+ bean.getBeginTime() + "," + bean.getDeadline() + "," + bean.getEndTime() + ",");
				
//				mb = session.get(MemberBean.class, i);
//				System.out.println(mb);
//				bean1 = session.get(EventDetailBean.class, new EventDetailPK(bean, mb));
//				System.out.println(bean1.getEventDetailPK());

				bean2 = session.get(LocationBean.class, i);
				System.out.println(bean2.getLocSN() + "," + bean2.getLocName() + "," + bean2.getLocLong() + ","
						+ bean2.getLocLat() + "," + bean2.getLocPhone());
			}
			System.out.println("===========================================");
			/////印出eventSN=1的資料/////
			List<EventDetailBean> testbeans;
			Query query = session.createQuery("from EventDetailBean where eventSN = 1");
			testbeans = query.getResultList();
			for(EventDetailBean testbean:testbeans){
				System.out.println(testbean);
			}
			for(EventDetailBean testbean:testbeans){
				System.out.println(testbean.getEventDetailPK());
			}
			for(EventDetailBean testbean:testbeans){
				System.out.println(testbean.getEventDetailPK().getMbrSN());
			}
			for(EventDetailBean testbean:testbeans){
				System.out.println(testbean.getEventDetailPK().getMbrSN().getMbrSN());
			}
			System.out.println(testbeans);
			//////////////////////////
			///////////mbrSN=1////////
			Query querymbrSN = session.createQuery("from EventDetailBean where mbrSN = 1");
			testbeans = querymbrSN.getResultList();
			for(EventDetailBean testbean:testbeans){
				System.out.println(testbean);
			}
			//////////////////////////
			
			
			session.getTransaction().commit();
			
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			throw e;
		}finally {
			((ConfigurableApplicationContext) context).close();
		}
	}
}
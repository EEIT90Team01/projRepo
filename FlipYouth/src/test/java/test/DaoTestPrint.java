package test;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import model.EventBean;
import model.EventDao;

public class DaoTestPrint {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("beanTest.xml");
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			// TogetherDAO dao=(TogetherDAO)context.getBean("togetherDao");
			EventDao dao = (EventDao) context.getBean("eventDao");

			// 單筆查詢
			// TogetherBean tobn=dao.select(1);
			// System.out.println(tobn.getTogether_name());
			 EventBean eb=dao.select(1);
			 System.out.println(eb);

			// 多筆查詢
			// List<TogetherBean> list=dao.select();
			// for(TogetherBean tobn : list ){
			// System.out.println(tobn.getTogether_no() + "," );
			// System.out.println(tobn.getMember_no().getName() + ",");
			// System.out.println(tobn.getTogether_name());
			// System.out.println(tobn.getTogether_people());
			// System.out.println(tobn.getMember_no().getAccount());
			// }
				 List<EventBean> list=dao.select();
				 for(EventBean ebl : list ){
				 System.out.println(ebl.getBeginTime());
				 System.out.println(ebl.getClass());
				 System.out.println(ebl.getDeadline());
				 System.out.println(ebl.getEndTime());
				 System.out.println(ebl.getEventSN());
				 System.out.println(ebl.getEventState());
				 System.out.println(ebl.getHostMbrSN());
				 System.out.println(ebl.getLocSN());
				 System.out.println(ebl.getMaxMember());
				 System.out.println(ebl.getMinMember());
				 }

			// 條件設定查詢(文章狀態)
			// MemberBean memberBean = new MemberBean(); // 部門POJO
			// memberBean.setMember_no(2);
			// List<TogetherBean> list=dao.selectStatus(memberBean,0);
			// for(TogetherBean tobn : list){
			// List<TogetherBean> list=dao.selectStatus(memberBean,0);
			// for(TogetherBean tobn : list){
			// System.out.println(tobn.getTogether_no() + "," );
			// System.out.println(tobn.getMember_no().getName() + ",");
			// System.out.println(tobn.getTogether_name());
			// System.out.println(tobn.getTogether_people());
			// System.out.println(tobn.getTogether_locate());
			// System.out.println(tobn.getTogether_memo());
			// System.out.println(tobn.getTogether_status());
			// System.out.println("================================");
			// }

			// 新增
			// MemberBean memberBean = new MemberBean(); // 部門POJO
			// memberBean.setMember_no(2);
			// TogetherBean tobn=new TogetherBean();
			// tobn.setMember_no(memberBean);
			// tobn.setTogether_no(4);
			// tobn.setTogether_topic("遊戲");
			// tobn.setTogether_name("翻花繩");
			// tobn.setTogether_locate("大安森林公園");
			// tobn.setTogether_when(java.sql.Date.valueOf("2016-12-20"));
			// tobn.setTogether_when_end(java.sql.Date.valueOf("2016-12-23"));
			// tobn.setTogether_people(20);
			// tobn.setTogether_memo("翻花繩教學");
			// tobn.setTogether_post_time(null);
			// tobn.setTogether_delete_time(null);
			// tobn.setTogether_modify_time(null);
			// tobn.setTogether_status(0);
			// tobn.setTogether_lat(0);
			// tobn.setTogether_lng(0);
			// dao.insert(tobn);
			// dao.update(4, memberBean, "遊戲", "翻花繩", "和平公園",
			// java.sql.Date.valueOf("2016-12-20"),
			// java.sql.Date.valueOf("2016-12-22"), 5, "翻花繩教學", null, null,
			// null, 1, 0, 0);

			// 刪除
			// dao.delete(5);

			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			sessionFactory.close();
			((ConfigurableApplicationContext) context).close();
		}
	}
}
package model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;
import model.dao.LocationDaoImpl;


@Service(value="eventService")
@Transactional
public class EventService {
	
	//Main方法//
//	public static void main(String[] args) {
//		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.config.federer.xml");
//		EventService es = (EventService)ctx.getBean("eventService");
// 		try {
// 			es.eventDao.getSession().beginTransaction();
// 			//TODO
// 			
// 			//TODO
// 			es.eventDao.getSession().getTransaction().commit();
// 		}catch(Exception e){
// 			e.printStackTrace();
// 			es.eventDao.getSession().getTransaction().rollback();
// 		}
// 		((ConfigurableApplicationContext)ctx).close();
//	}
	//Main方法//
	
	//222EventGo的新增揪團Event//
	@Autowired
	@Resource(name="eventDao")
	EventDaoImpl eventDaoImpl;
	public EventBean eventGoInsert(EventGoFbBean eventGoFbBean,Integer locSN){
		String userAddAddress = eventGoFbBean.getUserAddAddress();
		System.out.println("印出userAddAddress=="+userAddAddress+"&"+"印出locSN=="+locSN);
		System.out.println("locSN type ==="+locSN.getClass().getSimpleName());
		if(!"null".equals(userAddAddress)){
			System.out.println("userAddAddress不為空 = "+ userAddAddress);
			System.out.println("userAddAddress type ==="+userAddAddress.getClass().getSimpleName());
//			locSN = Integer.parseInt(userAddAddress);
			System.out.println("locSN type ==="+locSN.getClass().getSimpleName());
			System.out.println("所以locSN = "+locSN);
			EventBean eventBean = new EventBean(new MemberBean(eventGoFbBean.getUserSN()) ,locSN,eventGoFbBean.getUserAddDownLimit(),eventGoFbBean.getStartDateTime(),eventGoFbBean.getEndDateTime(),1,eventGoFbBean.getUserAddUpLimit(),eventGoFbBean.getCloseDateTime());
		}///////////////////////////////////會員加進來就要改了///////////
			EventBean eventBean = new EventBean(new MemberBean(eventGoFbBean.getUserSN()) ,locSN,eventGoFbBean.getUserAddDownLimit(),eventGoFbBean.getStartDateTime(),eventGoFbBean.getEndDateTime(),1,eventGoFbBean.getUserAddUpLimit(),eventGoFbBean.getCloseDateTime());
		System.out.println("印出待輸入的eventBean=="+eventBean);
		eventDaoImpl.insert(eventBean);
		System.out.println("service's result="+eventBean);
		return eventBean;
	}
	//222EventGo的新增揪團到Event//
	//111EventGo新增位置到Location//
	@Autowired
	@Resource(name="locationDao")
	LocationDaoImpl locationDaoImpl;
	public LocationBean eventGoInsertLocationTable(EventGoFbBean eventGoFbBean){
		String userInputAddress = eventGoFbBean.getUserInputAddress();
		Integer locSN=null;
		LocationBean locationBean=new LocationBean(locSN, userInputAddress, eventGoFbBean.getLocLong(), eventGoFbBean.getLocLat(), null);
		locationDaoImpl.insert(locationBean);
		return locationBean;
	}
	//111EventGo新增位置到Location//
	//333EventGo新增到eventSN mbrSN 到 EventDetail table//
	@Autowired
	@Resource(name="eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	public EventDetailBean eventGoInsertEventDetailTable(EventBean eventBean){
		EventDetailBean eventDetailBean = new EventDetailBean(new EventDetailPK(eventBean,eventBean.getHostMbrSN()));
		eventDetailDaoImpl.insert(eventDetailBean);
		return eventDetailBean;
	}
	//333EventGo新增到eventSN mbrSN 到 EventDetail table//
	//Event從Member TABLE 選擇室長
//	@Autowired
//	@Resource(name="MemberInsertDao")
//	MemberInsertDaoH memberInsertDaoH;
//	public MemberBean eventGoSelect(int mbrSN){
////		MemberBean memberBean = new MemberBean(mbrSN);
//		MemberBean memberBean = memberInsertDaoH.select(mbrSN);
//		return memberBean;
//	}
	//Event從Member TABLE 選擇室長
}
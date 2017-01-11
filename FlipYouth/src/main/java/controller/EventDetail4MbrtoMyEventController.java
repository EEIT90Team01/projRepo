package controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventDeleteService;
import model.EventDetailBean;
import model.MbrtoMyEventFbBean;
import model.dao.EventDetailDaoImpl;
import model.dao.LocationDaoImpl;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4MbrtoMyEvent" })
public class EventDetail4MbrtoMyEventController {
	
	@Autowired
	EventDeleteService eventDeleteService;
	@Resource(name = "eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	@Resource(name = "locationDao")
	LocationDaoImpl locationDaoImpl;
	
	@RequestMapping(path = { "/events/3EventDetail4Mbrto6MyEvent.controller" })  //接3EventDetail4Mbr.jsp 加入團用
	public String eventDetail4MbrtoMyEventProcess(String mbrSN,String eventSN,MbrtoMyEventFbBean mbrtoMyEventFbBean,HttpSession session){
		System.out.println("有進eventDetail4MbrtoMyEventProcess");
		System.out.println("上個網頁接的mbrSN = "+mbrSN);
		System.out.println("上個網頁接的eventSN = "+eventSN);
		mbrtoMyEventFbBean.setEventSN(eventSN);
		mbrtoMyEventFbBean.setMbrSN(mbrSN);
		
		if(eventDeleteService.eventDetail4MbrJoinUse(mbrSN, eventSN)==true){
			System.out.println("FFFFFFF-----"+"成功");
		}
	///////有會員登錄後要改//////
//		String mbrSN1 = "1";
//		session.setAttribute("mbrSN", mbrSN);
	///////有會員登錄後要改//////
//		session.setAttribute("eventSN", "null");
//		System.out.println("session = "+session.getAttribute("eventSN")+" & "+session.getAttribute("mbrSN"));
		
		List<EventDetailBean> eventDetailBeans = eventDetailDaoImpl.select(mbrSN);
		System.out.println("eventDetailBean"+eventDetailBeans);
		List<Map> myEventData = new ArrayList<>();
		for (EventDetailBean edb:eventDetailBeans){
			Map<String, Object> tempMap = new HashMap<String, Object>();
//			edb.getEventDetailPK().getEventSN().getEventSN();
			tempMap.put("EventDetailBean", edb);
			tempMap.put("EventBean",edb.getEventDetailPK().getEventSN());
			tempMap.put("MemberBean", edb.getEventDetailPK().getMbrSN());
			tempMap.put("image", Base64.getEncoder().encodeToString(edb.getEventDetailPK().getEventSN().getHostMbrSN().getImage()));
			Integer locSN = edb.getEventDetailPK().getEventSN().getLocSN();
			String locName = locationDaoImpl.select(locSN).getLocName();
			tempMap.put("locName", locName);
			myEventData.add(tempMap);
		}
		session.setAttribute("myEventData", myEventData);
		
		return "MyEvent.index";
	}
}
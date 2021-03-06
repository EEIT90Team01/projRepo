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

import model.EventBean;
import model.EventDeleteService;
import model.EventDetailBean;
import model.EventDetailPK;
import model.MemberBean;
import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;
import model.dao.LocationDaoImpl;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "myEvent" })
public class MyEventCotroller {

	@Autowired
	EventDeleteService eventDeleteService;
	
	@Resource(name = "eventDao")
	EventDaoImpl eventDaoImpl;
	@Resource(name = "eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	@Resource(name = "locationDao")
	LocationDaoImpl locationDaoImpl;
	
	@RequestMapping(path = { "/events/myEvent.controller" }) //接1Eventing.jsp //接3EventDetail4Host.jsp
	public String myEventProcess(String mbrSN,String eventSN,Model model,HttpSession session){
		System.out.println("MyEventCotroller's 上個網頁接的mbrSN = "+mbrSN);
		model.addAttribute("myEvent", mbrSN);
		
		
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
	
	@RequestMapping(path = { "/events/myEvent2.controller" }) //接6MyEvent.jsp的退除此團 以及 刪除紀錄用
	public String myEventdelete(String mbrSN,String eventSN,HttpSession session){
		
		eventDeleteService.EventDeleteUseOnly(mbrSN, eventSN);
		System.out.println("MyEventCotroller's 上個網頁接的mbrSN = "+mbrSN);
		
		
		List<EventDetailBean> eventDetailBeans = eventDetailDaoImpl.select(mbrSN);
		System.out.println("eventDetailBean"+eventDetailBeans);
		List<Map> myEventData = new ArrayList<>();
		for (EventDetailBean edb:eventDetailBeans){
			Map<String, Object> tempMap = new HashMap<String, Object>();
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
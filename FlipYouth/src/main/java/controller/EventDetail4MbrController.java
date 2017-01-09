package controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventBean;
import model.EventDetail4MbrFbBean;
import model.EventDetailBean;
import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4Mbr" })
public class EventDetail4MbrController {

	@Resource(name = "eventDao")
	EventDaoImpl eventDaoImpl;
	@Resource(name = "eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	
	@RequestMapping(path = { "/events/eventDetail4Mbr.controller" }) //接1Eventing.jsp
	public String eventDetail4MbrProcess(String eventSN,String locName,String hostName,EventDetail4MbrFbBean eventDetail4MbrFbBean,Model model,HttpSession session){
		System.out.println("上個網頁接的eventSN = "+eventSN);
		System.out.println("上個網頁接的locName = "+locName);
		System.out.println("上個網頁接的hostName = "+hostName);
		eventDetail4MbrFbBean.setEventSN(eventSN);
		eventDetail4MbrFbBean.setLocName(locName);
		eventDetail4MbrFbBean.setHostName(hostName);
		
		EventBean eventBean = eventDaoImpl.select(Integer.parseInt(eventSN));
		String hostimage = Base64.getEncoder().encodeToString(eventBean.getHostMbrSN().getImage());
		eventDetail4MbrFbBean.setHostimage(hostimage);
		
		java.util.Date startTime = eventBean.getBeginTime();
		java.util.Date endTime = eventBean.getEndTime();
		java.util.Date closetTime = eventBean.getDeadline();
		Integer upNumber = eventBean.getMaxMember();
		Integer downNumber = eventBean.getMinMember();
		Integer eventState = eventBean.getEventState();
		eventDetail4MbrFbBean.setStartTime(startTime);
		eventDetail4MbrFbBean.setEndTime(endTime);
		eventDetail4MbrFbBean.setClosetTime(closetTime);
		eventDetail4MbrFbBean.setUpNumber(upNumber);
		eventDetail4MbrFbBean.setDownNumber(downNumber);
		eventDetail4MbrFbBean.setEventState(eventState);
		
		model.addAttribute("eventDetail4Mbr", eventDetail4MbrFbBean);
		
		List<EventDetailBean> eventDetailBeans = eventDetailDaoImpl.selecteventSN(eventSN);
		List<Map> eventDetail4MbrData = new ArrayList<>();
		for (EventDetailBean edb:eventDetailBeans){
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("image", Base64.getEncoder().encodeToString(edb.getEventDetailPK().getMbrSN().getImage()));
			eventDetail4MbrData.add(tempMap);
		}
		session.setAttribute("eventDetail4MbrData", eventDetail4MbrData);
		return "EventDetail4Mbr.index";
	}
}
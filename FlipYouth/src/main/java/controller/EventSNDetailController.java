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
import model.EventDetailBean;
import model.EventSNDetailFbBean;
import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventSNDetail" })
public class EventSNDetailController {

	@Resource(name = "eventDao")
	EventDaoImpl eventDaoImpl;
	@Resource(name = "eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	
	@RequestMapping(path = { "/events/eventSNDetail.controller" }) //接6MyEvent.jsp
	public String eventSNDetailProcess(String eventSN,String locName,EventSNDetailFbBean eventSNDetailFbBean,Model model,HttpSession session){
		System.out.println("上個網頁接的eventSN = "+eventSN);
		System.out.println("上個網頁接的locName = "+locName);
		eventSNDetailFbBean.setEventSN(eventSN);
		eventSNDetailFbBean.setLocName(locName);
		EventBean eventBean = eventDaoImpl.select(Integer.parseInt(eventSN));
		String hostName = eventBean.getHostMbrSN().getMbrName();
		eventSNDetailFbBean.setHostName(hostName);
		java.util.Date startTime = eventBean.getBeginTime();
		eventSNDetailFbBean.setStartTime(startTime);
		java.util.Date endTime = eventBean.getEndTime();
		eventSNDetailFbBean.setEndTime(endTime);
		String hostimage = Base64.getEncoder().encodeToString(eventBean.getHostMbrSN().getImage());
		eventSNDetailFbBean.setHostimage(hostimage);
		model.addAttribute("eventSNDetail", eventSNDetailFbBean);
		
		List<EventDetailBean> eventDetailBeans = eventDetailDaoImpl.selecteventSN(eventSN);
		System.out.println("eventDetailBeans==="+eventDetailBeans);
		List<Map> eventSNDetailData = new ArrayList<>();
		for(EventDetailBean edb:eventDetailBeans){
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("mbrName", edb.getEventDetailPK().getMbrSN().getMbrName());
			tempMap.put("image", Base64.getEncoder().encodeToString(edb.getEventDetailPK().getMbrSN().getImage()));
			eventSNDetailData.add(tempMap);
		}
		session.setAttribute("eventSNDetailData", eventSNDetailData);
		return "EventSNDetail.index";
	}
}
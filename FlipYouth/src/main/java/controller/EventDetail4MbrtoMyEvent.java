package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MbrtoMyEventFbBean;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4MbrtoMyEvent" })
public class EventDetail4MbrtoMyEvent {
	
	@RequestMapping(path = { "/events/3EventDetail4Mbrto6MyEvent.controller" })  //接3EventDetail4Mbr.jsp
	public String eventDetail4MbrtoMyEventProcess(String mbrSN,String eventSN,MbrtoMyEventFbBean mbrtoMyEventFbBean,Model model,HttpSession session){
		System.out.println("上個網頁接的mbrSN = "+mbrSN);
		System.out.println("上個網頁接的eventSN = "+eventSN);
		mbrtoMyEventFbBean.setEventSN(eventSN);
		mbrtoMyEventFbBean.setMbrSN(mbrSN);
		
		model.addAttribute("eventDetail4MbrtoMyEvent", mbrSN);
		return "MyEvent.index";
	}
}
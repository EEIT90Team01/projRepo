package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventDeleteService;
import model.MbrtoMyEventFbBean;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4MbrtoMyEvent" })
public class EventDetail4MbrtoMyEventController {
	
	@Autowired
	EventDeleteService eventDeleteService;
	
	@RequestMapping(path = { "/events/3EventDetail4Mbrto6MyEvent.controller" })  //接3EventDetail4Mbr.jsp 加入團用
	public String eventDetail4MbrtoMyEventProcess(String mbrSN,String eventSN,MbrtoMyEventFbBean mbrtoMyEventFbBean,HttpSession session){
		System.out.println("上個網頁接的mbrSN = "+mbrSN);
		System.out.println("上個網頁接的eventSN = "+eventSN);
		mbrtoMyEventFbBean.setEventSN(eventSN);
		mbrtoMyEventFbBean.setMbrSN(mbrSN);
		
		eventDeleteService.eventDetail4MbrJoinUse(mbrSN, eventSN);
	///////有會員登錄後要改//////
		String mbrSN1 = "11";
		session.setAttribute("mbrSN", mbrSN1);
	///////有會員登錄後要改//////
		session.setAttribute("eventSN", "null");
		System.out.println("session = "+session.getAttribute(eventSN)+" & "+session.getAttribute(mbrSN));
		return "MyEvent.index";
	}
}
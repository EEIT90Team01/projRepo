package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4Mbr" })
public class EventDetail4MbrController {

	
	@RequestMapping(path = { "/events/eventDetail4Mbr.controller" }) //接1Eventing.jsp
	public String eventingProcess(String eventSN){
		System.out.println("上個網頁接的eventSN = "+eventSN);
		
		return "EventDetail4Mbr.index";
	}
}
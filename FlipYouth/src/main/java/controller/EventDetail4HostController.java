package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventDetail4Host" })
public class EventDetail4HostController {

	
	@RequestMapping(path = { "/events/eventDetail4Host.controller" }) //接2EventGo.jsp
	public String eventingProcess(String eventSN){
		System.out.println("上個網頁接的eventSN = "+eventSN);
		
		return "EventDetail4Host.index";
	}
}
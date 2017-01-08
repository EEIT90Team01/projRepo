package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "myEvent" })
public class MyEventCotroller {

	
	@RequestMapping(path = { "/events/myEvent.controller" }) //接1Eventing.jsp
	public String myEventProcess(String mbrSN){
		System.out.println("上個網頁接的mbrSN = "+mbrSN);
		
		return "MyEvent.index";
	}
}
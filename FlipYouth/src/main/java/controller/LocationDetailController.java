package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "locationDetail" })
public class LocationDetailController {

	@RequestMapping(path = { "/events/locationDetail.controller" }) //接3EventDetail4Host.jsp
	public String locationDetailProcess(String locName){
		System.out.println("上個網頁接的locName = "+locName);
		
		return "LocationDetail.index";
	}
}
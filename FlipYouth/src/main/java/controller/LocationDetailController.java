package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import model.LocationDetailFbBean;
import model.LocationDetailService;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "locationDetail" })
public class LocationDetailController {
	@Autowired
	LocationDetailService locationDetailService;
	
	@RequestMapping(path = { "/events/locationDetail.controller" }) //接3EventDetail4Host.jsp
	public String locationDetailProcess(String locName,Model model,LocationDetailFbBean locationDetailFbBean){
		System.out.println("上個網頁接的locName = "+locName);
		locationDetailFbBean.setLocName(locName);
		
		model.addAttribute("locationDetail", locationDetailFbBean);
		
		return "LocationDetail.index";
	}
}
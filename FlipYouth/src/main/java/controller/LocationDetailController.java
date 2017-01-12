package controller;

import javax.servlet.http.HttpSession;

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
	public String locationDetailProcess(String locLat,String locLong,String locName,Model model,LocationDetailFbBean locationDetailFbBean,HttpSession session){
		System.out.println("上個網頁接的locName = "+locName);
		locationDetailFbBean.setLocName(locName);
		locationDetailFbBean.setLocLat(locLat);
		System.out.println("上個網頁接的locLat = "+locLat);
		locationDetailFbBean.setLocLong(locLong);
		System.out.println("上個網頁接的locLong = "+locLong);
		
		model.addAttribute("locationDetail", locationDetailFbBean);
		session.setAttribute("locLat", locLat);
		session.setAttribute("locLong", locLong);
		return "LocationDetail.index";
	}
}
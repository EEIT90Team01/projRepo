package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventBean;
import model.EventDetail4HostService;
import model.EventDetailBean;
import model.EventGoFbBean;
import model.EventService;
import model.LocationBean;
import model.MemberBean;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventGo" })
public class EventGoController {
	@Autowired // 可以不加Resource
	EventService eventService;
	@Autowired
	EventDetail4HostService eventDetail4HostService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(format, false));
		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
	}

	@RequestMapping(path = { "/events/eventgo2.controller" })
	public String getMbrSNfromEventingJSP(String mbrSN,HttpSession session){
		System.out.println("EventGoController有接到mbrSN = "+mbrSN);
		session.setAttribute("mbrSN", mbrSN);
		return "EventGo.index";
	}
	
	@RequestMapping(path = { "/events/eventgo.controller" })
	public String ProcessName(
//			 @RequestParam(name="userInputAddress") String userInputAddress,
			EventGoFbBean eventGoFbBean, BindingResult bindingResult, Model model, HttpServletRequest req ,HttpSession session,String mbrSN) {
		// 接收資料
		eventGoFbBean.setUserSN(Integer.parseInt(mbrSN));
		System.out.println("mbrSN============="+eventGoFbBean.getUserSN());
		// 驗證資料
		/////////// 測試抓到JSP name的值///////////
		Enumeration<String> e1 = req.getParameterNames();
		while (e1.hasMoreElements()) {
			String i = e1.nextElement();
			System.out.println(i + " : " + req.getParameter(i));
		}
		/////////// 測試抓到JSP name的值///////////
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);

		String userAddAddress = eventGoFbBean.getUserAddAddress();
	///////TODO暫時用會員11來做/////1Eventing.jsp EventGoController.java
//		eventGoFbBean.setUserSN(1);
	///////TODO暫時用會員11來做/////1Eventing.jsp EventGoController.java
		if (userAddAddress == null || userAddAddress.length() == 0 || "elseMap".equals(userAddAddress)) {
			errors.put("userAddAddress", "地址為必填(Address cannot be empty)!");
		}

		System.out.println("bindingResult=" + bindingResult);
		if (bindingResult != null) {
			if (bindingResult.getFieldError("startDateTime") != null) {
				errors.put("startDateTime", "開始時間為必填(Start Time cannot be empty)!");
			}
			if (bindingResult.getFieldError("endDateTime") != null) {
				errors.put("endDateTime", "結束時間為必填(End Time cannot be empty)!");
			}
			if (bindingResult.getFieldError("closeDateTime") != null) {
				errors.put("closeDateTime", "截止時間為必填(Close Event Time cannot be empty)!");
			}
			if (bindingResult.getFieldError("userAddUpLimit") != null) {
				errors.put("userAddUpLimit", "上限人數僅能為數字!");
			}
			if (bindingResult.getFieldError("userAddDownLimit") != null) {
				errors.put("userAddDownLimit", "上限人數僅能為數字!");
			}
		}
		System.out.println("controller's errors=" + errors);
		if (errors != null && !errors.isEmpty()) {
			return "EventGo.index";
		}
		// 轉換資料
		// 呼叫Model 根據執行結果導向View 使用model參數儲存執行結果
		model.addAttribute("eventGo", eventGoFbBean);
		//

		//// 111呼叫EventService 做FormBackingBean 位置Insert到Location///
		LocationBean locationBean = eventService.eventGoInsertLocationTable(eventGoFbBean);
//		System.out.println("1111111111=" + eventGoFbBean.getUserAddAddress());//抓選項表單的value
//		System.out.println("1111111111=" + eventGoFbBean.getUserInputAddress());// 抓隱藏表單的地址
		System.out.println("controller's LocationBean=" + locationBean);
		//// 111呼叫EventService 做FormBackingBean 位置Insert到Location///
		//// 222呼叫EventService 做FormBackingBean Insert///
		System.out.println("進入EventGoController 準備做insert event table");
		System.out.println("EventGoController typeof locationBean.getLocSN()=="+locationBean.getLocSN().getClass().getSimpleName());
		EventBean eventBean = eventService.eventGoInsert(eventGoFbBean, locationBean.getLocSN());
		System.out.println("做完 insert event table");
//		System.out.println("controller's eventGoFbBean.getUserAddAddress()=" + eventGoFbBean.getUserAddAddress());
		System.out.println("controller's EventBean=" + eventBean);
		//// 222呼叫EventService 做FormBackingBean Insert///
		//// 333呼叫EventService eventSN mbrSN Insert到EventDetail table////
		EventDetailBean eventDetailBean = eventService.eventGoInsertEventDetailTable(eventBean);
//		System.out.println("controller's eventBean.getEventSN()" + eventBean.getEventSN());
//		System.out.println("controller's eventBean.getHostMbrSN()" + eventBean.getHostMbrSN());
		System.out.println(eventDetailBean);
		//// 333呼叫EventService eventSN mbrSN Insert到EventDetail table////
		
		////呼叫EventDetail4HostService做找尋Mbr////
		MemberBean memberBean = eventDetail4HostService.mbrSelectNameImg(eventGoFbBean.getUserSN());
		System.out.println(memberBean);
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("hostName", memberBean.getMbrName());
		tempMap.put("image",Base64.getEncoder().encodeToString(memberBean.getImage()));
		session.setAttribute("listNameImg", tempMap);
		////呼叫EventDetail4HostService做找尋Mbr/////
		
		return "EventDetail4Host.index";
	}
}
package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventBean;
import model.EventDetailBean;
import model.EventGoFbBean;
import model.EventService;
import model.LocationBean;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventGo" })
public class EventGoController {
	@Autowired // 可以不加Resource
	EventService eventService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(format, false));
		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
	}

	@RequestMapping(path = { "/events/eventgo.controller" })
	public String ProcessName(
			// @RequestParam(name="userInputAddress") String userInputAddress,
			EventGoFbBean eventGoFbBean, BindingResult bindingResult, Model model, HttpServletRequest req) {
		// 接收資料
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
		System.out.println("1111111111=" + eventGoFbBean.getUserAddAddress());
		System.out.println("1111111111=" + eventGoFbBean.getUserInputAddress());
		System.out.println("controller's LocationBean=" + locationBean);
		//// 111呼叫EventService 做FormBackingBean 位置Insert到Location///
		//// 222呼叫EventService 做FormBackingBean Insert///
		EventBean eventBean = eventService.eventGoInsert(eventGoFbBean, locationBean.getLocSN());
		System.out.println("controller's eventGoFbBean.getUserAddAddress()=" + eventGoFbBean.getUserAddAddress());
		System.out.println("controller's EventBean=" + eventBean);
		//// 222呼叫EventService 做FormBackingBean Insert///
		//// 333呼叫EventService eventSN mbrSN Insert到EventDetail table////
		EventDetailBean eventDetailBean = eventService.eventGoInsertEventDetailTable(eventBean);
		System.out.println("controller's eventBean.getEventSN()" + eventBean.getEventSN());
		System.out.println("controller's eventBean.getHostMbrSN()" + eventBean.getHostMbrSN());
		System.out.println(eventDetailBean);
		//// 333呼叫EventService eventSN mbrSN Insert到EventDetail table////
		return "EventDetail4Host.index";
	}
}
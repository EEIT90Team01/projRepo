package controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.EventBean;
import model.EventService;
import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;
import model.dao.LocationDaoImpl;

@Controller
@RequestMapping(method = { RequestMethod.GET, RequestMethod.POST })
@SessionAttributes(names = { "eventing" })
public class EventingController {
	@Autowired
	private EventService eventService;
	
	@Resource(name = "eventDao")
	EventDaoImpl EventDaoImpl;
	@Resource(name = "eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	@Resource(name = "locationDao")
	LocationDaoImpl locationDaoImpl;

	@RequestMapping(path = { "/events/eventing.controller" })
	public String eventingProcess(String mbrSN ,HttpSession session) {
		
		System.out.println("上個網頁接的mbrSN = "+ mbrSN +"----------------------");
		List<EventBean> list = EventDaoImpl.select();
		List<Map> listImage = new ArrayList<>();
//		list.get(0).getEventSN();//抓eventSN
		for(EventBean bean: list){
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put("EventBean", bean);
		    System.out.println(eventDetailDaoImpl.select(bean.getEventSN()));
			tempMap.put("mbrSNCount", eventDetailDaoImpl.select(bean.getEventSN()));//抓eventSN //抓幾人參與
			tempMap.put("image",Base64.getEncoder().encodeToString(bean.getHostMbrSN().getImage()));
			tempMap.put("Location",locationDaoImpl.select(bean.getLocSN()));
//			System.out.println("locationDaoImpl.select(bean.getLocSN())="+locationDaoImpl.select(bean.getLocSN()));
			listImage.add(tempMap);
		}
//		int mbrSNCount=0;
//		for(int i=0;i<=list.get(0).getEventSN();i++){
//			mbrSNCount+=i;
//		}//抓幾人參與
		//System.out.println("list="+list);
//		System.out.println(list.get(0).getBeginTime());/// 印出開始時間
		session.removeAttribute("eventing");
		System.out.println("session = "+session);
		session.setAttribute("eventing", listImage);
		session.setAttribute("mbrSN", mbrSN);
		System.out.println("抓到比數 = "+((List<Map>)session.getAttribute("eventing")).size());
		return "Eventing.index";
	}
}
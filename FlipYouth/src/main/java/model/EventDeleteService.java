package model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dao.EventDaoImpl;
import model.dao.EventDetailDaoImpl;
import model.dao.LocationDaoImpl;

@Service(value="eventDeleteService")
@Transactional
public class EventDeleteService {

	@Autowired
	@Resource(name="eventDao")
	EventDaoImpl eventDaoImpl;
	@Autowired
	@Resource(name="locationDao")
	LocationDaoImpl locationDaoImpl;
	@Autowired
	@Resource(name="eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	
	public boolean EventDeleteUseOnly(String mbrSN,String eventSN){
		System.out.println("以下進入EventDeleteService的EventDeleteService方法");
		Integer a = Integer.parseInt(eventSN);
		System.out.println(a);
		Integer b = Integer.parseInt(mbrSN);
		System.out.println(b);
		
		EventBean eventBean = eventDaoImpl.select(Integer.parseInt(eventSN));
		System.out.println();
		MemberBean memberBean = eventDaoImpl.selectmbr(Integer.parseInt(mbrSN));
		EventDetailPK eventDetailPK = new EventDetailPK(eventBean, memberBean);
		boolean c = eventDetailDaoImpl.delete(eventDetailPK);
		System.out.println("是否刪除eventDetail table c = "+c);
		
		EventBean eBCheck = eventDaoImpl.select(a);
		if(eBCheck.getEventSN()==a&&eBCheck.getHostMbrSN().getMbrSN()==b){
			boolean d = eventDaoImpl.delete(a);
			System.out.println("是否刪除event table d = "+d);
		}else{
			System.out.println("mbrSN ="+mbrSN+" 不是房主");
		}
		
		Integer locSN = eBCheck.getLocSN();
		boolean e = locationDaoImpl.delete(locSN);
		System.out.println("是否刪除location table e = "+e);
		
		return true;
	}
	
	public boolean eventDetail4MbrJoinUse(String mbrSN,String eventSN){
		
		EventBean eventBean = eventDaoImpl.select(Integer.parseInt(eventSN));
		MemberBean memberBean = eventDaoImpl.selectmbr(Integer.parseInt(mbrSN));
		System.out.println("=======================================================================");
		EventDetailBean eventDetailBean = new EventDetailBean(new EventDetailPK(eventBean,memberBean));
		eventDetailDaoImpl.insert(eventDetailBean);
		return true;
	}
	
}

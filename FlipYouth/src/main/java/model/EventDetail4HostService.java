package model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import model.dao.EventDetailDaoImpl;

@Service(value="eventDetail4HostService")
@Transactional
public class EventDetail4HostService {

	@Autowired
	@Resource(name="eventDetailDao")
	EventDetailDaoImpl eventDetailDaoImpl;
	public MemberBean mbrSelectNameImg(Integer userSN){
		MemberBean memberBean = null;
		memberBean=eventDetailDaoImpl.mbrselect(userSN);
		return memberBean;
	}
	
}
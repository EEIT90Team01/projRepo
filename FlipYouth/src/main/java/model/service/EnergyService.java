package model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.MemberBean;
import model.dao.MemberDTDAO;

@Service(value = "energyService")
public class EnergyService {

	@Autowired
	private MemberDTDAO memberDtdao;

	private Map<String, MemberBean> playCheck;
	
	@PostConstruct
	private void init(){
		playCheck = new HashMap<String, MemberBean>(); 
	}
	
	@Transactional
	@Scheduled(fixedDelay = 30 * 60 * 1000L)
	// 玩好玩的30分鐘跑一次
	public void addEnergy() {
		
		List<MemberBean> mbs = memberDtdao.queryAll("from MemberBean where energy != 200");
		for (MemberBean mb : mbs) {
			
			mb.setEnergy( mb.getEnergy()<=170 ? mb.getEnergy()+30 : 200);
			memberDtdao.cu(mb);
		}
	}
	
	@Transactional
	public Map<String, MemberBean> playGameConsumeEnergy(MemberBean beanInSession) {
		playCheck.clear();
		MemberBean realTimeBean = memberDtdao.select(beanInSession.getMbrSN());
		System.out.println("energy = " + realTimeBean.getEnergy());
		if (realTimeBean.getEnergy()>30){
			realTimeBean.setEnergy(realTimeBean.getEnergy()-30);
			memberDtdao.cu(realTimeBean);
			playCheck.put("ok", realTimeBean);
		} else {
			playCheck.put("fail", realTimeBean);
		}
		return playCheck;
	}
}

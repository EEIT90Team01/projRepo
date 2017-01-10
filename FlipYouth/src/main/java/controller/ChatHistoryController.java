package controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.ChatBean;
import model.MemberBean;
import model.dao.PrivateChatDao;

@Controller
@RequestMapping(method=RequestMethod.POST)
public class ChatHistoryController {
	
	@Autowired
	@Resource(name="privateChatDao")
	PrivateChatDao privateChatDao;
	
	//===============================	儲存聊天訊息	==============================================================
	@RequestMapping(path="/saveChatHistory.controller")
	public @ResponseBody Integer saveChatHistory(@RequestParam(name="send")String sendTemp,
								   @RequestParam(name="receive")String receivedTemp, 
								   @RequestParam(name="message")String message){
		Integer sendMbrSN = Integer.parseInt(sendTemp);
		Integer receivedMbrSN = Integer.parseInt(receivedTemp);
//		System.out.println("ChatHistoryController ======== new Date() = "+new Date());
		ChatBean bean = new ChatBean(sendMbrSN, receivedMbrSN, message, new Date());
		Integer chatSN = privateChatDao.saveChatHistory(bean);
//		System.out.println("ChatHistoryController chatSN = "+chatSN);
		
		return chatSN;
	}
	//===================================================================================================
	
	
	//===============================	讀取雙方對話紀錄		==============================================================
	@RequestMapping(path="/selectChatHistory.controller",produces="text/plain;charset=UTF-8")
	public @ResponseBody String selectChatHistory(@RequestParam(name="send")String sendTemp,
								   @RequestParam(name="receive")String receivedTemp,
								   @RequestParam(name="counter")String counterTemp){
		Integer sendMbrSN = Integer.parseInt(sendTemp);
		Integer receivedMbrSN = Integer.parseInt(receivedTemp);
		int counter = Integer.parseInt(counterTemp);
//		System.out.println("counterTemp="+counterTemp+",counter"+counter);
		List<ChatBean> chatList = privateChatDao.selectChatHistory(sendMbrSN, receivedMbrSN,counter);
		Gson gson = new Gson();
//		setFirstResult(0).setMaxResults(5)  從0開始往後5筆
		String jsonChatList = gson.toJson(chatList);
		return jsonChatList;
	}
	
	//===================================================================================================
	
	
	
	
}

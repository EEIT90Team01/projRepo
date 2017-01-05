package webSocketServer;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@ServerEndpoint("/privateChatServer/{user}")
public class PrivateChatServer {
	
	//Set<Session> allUserSessions    放置所有上線者的session
	static Set<Session> allUserSessions = Collections.synchronizedSet(new HashSet<Session>());
	
	//Map<Session, String> memberSessions   將該session與name綁一起放入一個map<session, name>
	static Map<Session, String> memberSessions = Collections.synchronizedMap(new HashMap<Session, String>()); 
	
	//Set<String> onlineUserNames  用來顯示誰在線上
	static Set<String> onlineUsersNames = Collections.synchronizedSet(new HashSet<String>()); 
	
	private String userName;
	
	//===================================================================================================================
	@OnOpen
	public void handleOpen(Session userSession,@PathParam("user") String userName) throws IOException, EncodeException{
		System.out.println("=================="+userName+"連接websocketServer========================================");
		System.out.println("Map<Session, String> memberSessions 裡有"+memberSessions);
		this.userName = userName;
		getOnlineUser(userSession, userName);
		broadCastJoinUser(userSession, userName);	//顯示哪個user上線
		onOpenProcess(userSession, userName);
		
	}
	//===================================================================================================================	
	
	//========================================== OnMessage ==============================================================
	
	@OnMessage
	public void handleMessage(String data, Session user) throws IOException, EncodeException {
		System.out.println("===========@OnMessage收到的資料"+data+"=============");
		
		JsonObject jsonData = new JsonParser().parse(data).getAsJsonObject();	//jsonString轉成json方便取值
		String action = jsonData.get("action").getAsString();

		switch (action){
		
		case "clickChatRoom" :
			System.out.println("進入openChatRoom, data = "+data);
			sendMsgToSelfSessions(data, user);
			break;
		
		case "oneChat" :
			String sendTo = jsonData.get("to").getAsString();						//要用gson的getAsString方法將jsonelement
																				//轉成String不可用toString會變成 ""Tom"" 
			System.out.println(jsonData.get("from")+"寄給"+jsonData.get("to")+":"+jsonData.get("text"));
			
			sendMsgToSelfSessions(data,user);							//讓使用者其他頁面也有剛剛自己傳送之訊息內容
			
			for(Session userSession:getReceiverSessions(sendTo)){      //getReceiverSessions(sendTo)取得收訊者所有Session
			userSession.getBasicRemote().sendText(data);
			}
			break;
			
		//*****************		comment的message		************************************	
		case "sendComment":
			System.out.println("privateChatServer的 onMessage方法 action=sendComment, data="+data);
			for(Session session : allUserSessions){
				session.getBasicRemote().sendText(data);
			};
			break;
		case "deleteComment":
			System.out.println("privateChatServer的 onMessage方法 action=deleteComment, data="+data);
			for(Session session : allUserSessions){
				session.getBasicRemote().sendText(data);
			};
			break;
			
		//*************************************************************************************
			
		}
	}
	
	
	//=============================================================================================================
	
	//========================================== OnClose ============================================================
	
	@OnClose
	public void handleClose(Session user) throws IOException{
//		System.out.println(user);
		allUserSessions.remove(user);
		memberSessions.remove(user);
		checkOnlineUserNames(userName);			
		System.out.println(user+"離開後幾個session在線上"+allUserSessions);
	}
	
	//=============================================================================================================
	
	
	//========================================== OnError ==============================================================
	@OnError
	public void handleError(Throwable t){
		
	}
	//============================================================================================================================
	
	
	//=========================    得到收訊者所有的session   ===============================================
	
	private Set<Session> getReceiverSessions(String sendTo){				
		Set<Session> receiverSessions = new HashSet<Session>();
		
		for(Map.Entry<Session, String> entry : memberSessions.entrySet()){	//使用map的entrySet方法取得一個個封裝的 key+value
			if(entry.getValue()!=null){										//得到Entry.<K, V> 並可使用getValue, getKey方法
//				System.out.println(entry.getValue().getClass());			//拿到map中的key或value
//				System.out.println(entry.getValue().equals(sendTo));
				if(entry.getValue().equals(sendTo)){						//若value(name) 與收訊者名相同即將該key(session)放入
					System.out.println("收訊者的session"+entry.getKey());		//一個集合並回傳
					receiverSessions.add(entry.getKey());
				}
			}
		}
		return receiverSessions;
	}
	
	//=================================================================================================	
	
	//===========================		讓使用者其他頁面也有剛剛自己傳送之訊息內容		================================================
	private void sendMsgToSelfSessions(String data, Session user) throws IOException {
		Set<Session> receivedSessions = getReceiverSessions(userName);
		System.out.println("sendMsgToSelfSessions的receivedSessions = "+receivedSessions);
		for(Session userSession:receivedSessions){      //getReceiverSessions(sendTo)取得收訊者所有Session
			if(userSession == user){
				continue;
			}
			userSession.getBasicRemote().sendText(data);	//送出後由前端判斷該訊息要顯示在哪
			System.out.println("userSession == user = "+(userSession == user));
		}
	}
	//=================================================================================================
	
	//==========================   onOpen後的處理動作     ====================================================
	
	private void onOpenProcess(Session user, String userName){
		allUserSessions.add(user);
		memberSessions.put(user, userName);				
//		onlineUserNames.add(userName);					//將userName放入onlineUserNames集合中(set無重複值)	
	}
	
	//=====================================================================================================
	
	
	
	//==========================    該user上線通知其他已上線的user	====================================================
	private void broadCastJoinUser(Session userSession, String userName) throws IOException, EncodeException{
		System.out.println(userName+"進入broadCastJoinUser, onlineUserNames線上有"+onlineUsersNames);
		if(!onlineUsersNames.contains(userName)){		//若onlineUserNames無這位使用者，代表他剛上線(反之則表示他開分頁)

			Map<String, String> message = new HashMap<String, String>();
			message.put("userName", userName);
			message.put("action", "updateOnline");
			
			Gson gson = new Gson();
			String messageJsonString = gson.toJson(message);		//將要給的資訊放到Map並轉為jsonString
			
			for(Session session : allUserSessions){						
					session.getBasicRemote().sendText(messageJsonString);
			}
		}
		onlineUsersNames.add(userName);			//廣播完再把該user加入onlineUserNames
	}
	//=================================================================================================
	
	
	
	//============確認memberSessions還有沒有該user的session若無則移除onlineUsersNames內的該user====================================
				//沒有該user的session代表該user沒有在線上則傳送該user下線
	private void checkOnlineUserNames(String userName) throws IOException{
		if(!memberSessions.containsValue(userName)){
			onlineUsersNames.remove(userName);
			String[] leavingUser = {userName}; 
			GetOnlineUserBean message = new GetOnlineUserBean(leavingUser, "getLeavingUser");
			Gson gson = new Gson();
			String messageJsonString = gson.toJson(message);
			//message轉為json字串並傳給當前頁面
			broadCastLeaving(messageJsonString);
		}
		System.out.println("============="+userName+"離開=========================");
		System.out.println(userName+"離開後onlineUsersNames有 ,"+onlineUsersNames);
	}
	//==================================================================================================
	
	//==========================    傳送已下限userName給其他user  =========================================
	
	private void broadCastLeaving(String messageJsonString) throws IOException{
		if(!allUserSessions.isEmpty()){
			for(Session session :allUserSessions){
				session.getBasicRemote().sendText(messageJsonString);
			}
		}else{
			return ;
		}
	}
	
	//==================================================================================================
	
	//============================ 剛上線的user取得已經在線上的users==========================================
	private void getOnlineUser(Session userSession, String userName) throws IOException{
		if(onlineUsersNames.isEmpty()){
			System.out.println(onlineUsersNames.isEmpty());
			return;
		}
		System.out.println(userName+"進入getOnlineUser, onlineUsersNames有"+onlineUsersNames);
		String[] userNameArray ;
		if(onlineUsersNames.contains(userName)){		//若onlineUsersNames已有該userName(表示他開分頁)
			onlineUsersNames.remove(userName);			//則先移除，等取完所有線上userName在加回去
			
			userNameArray = putUserNameInArray(onlineUsersNames);
			
			onlineUsersNames.add(userName);
		}else{
			userNameArray = putUserNameInArray(onlineUsersNames);
		}
		
//		Map<String, Object[]> message = new HashMap<String, Object[]>();
//		Object[] userNameArray = userNameList.toArray();
//		Object[] action = {"getOnlineUser"};
//		message.put("onlineUsers", userNameArray);
//		message.put("action", action);
		
		//將userNameArray放入GetOnlineUserBean message並設定action值
		GetOnlineUserBean message = new GetOnlineUserBean(userNameArray,"getOnlineUser");	
		Gson gson = new Gson();
		String messageJsonString = gson.toJson(message);
		//message轉為json字串並傳給當前頁面
		userSession.getBasicRemote().sendText(messageJsonString);
	}
	
	//====================================================================================================
	
	//==================	getOnlineUser用的方法 	 =========================================
	private String[] putUserNameInArray(Set<String> nameSet){
		Iterator<String> userNameIterator = onlineUsersNames.iterator();	//將onlineUsersNames轉為Iterator
		String[] userNameArray = new String[onlineUsersNames.size()]; 		//方便取值，建立一個String[] userNameArray
		for(int i = 0; i <onlineUsersNames.size(); i ++){			//將userNameIterator的值一個個放入userNameArray	
			if(userNameIterator.hasNext()  ){
				userNameArray[i]=userNameIterator.next();
			}	
		}
		
		return userNameArray;
	}
	//====================================================================================================
	
	
	//============================	getOnlineUser的Message用的Bean	=======================================
	private class GetOnlineUserBean{
		String[] userNameArray;			//放置已經在線上的users
		String action;
		
		public GetOnlineUserBean(String[] userNameArray, String action) {
			this.userNameArray = userNameArray;
			this.action = action;
		}
	}
	//====================================================================================================	
	
}

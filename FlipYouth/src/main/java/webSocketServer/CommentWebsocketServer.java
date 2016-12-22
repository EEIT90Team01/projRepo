package webSocketServer;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.MemberInsertDao;

@ServerEndpoint("/CommentInsertWebSocket")
public class CommentWebsocketServer {
	
	@Autowired
	@Resource(name="MemberInsertDao")
	MemberInsertDao mDao;
	
	static Set<Session> users = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void handleOpen(Session user){
		users.add(user);
		System.out.println("open websocket");
	}
	
	@OnMessage
	public void handleMessage(String message, Session user) throws IOException, EncodeException {
		System.out.println("websocket 傳送資料成功");
		Iterator<Session> iteratorUsers = users.iterator();
		JsonObject jMessage = new JsonParser().parse(message).getAsJsonObject();	//將message轉為JsonObject

		while(iteratorUsers.hasNext()){
			iteratorUsers.next().getBasicRemote().sendText(jMessage.toString());
		}
	}
	
	@OnClose
	public void handleClose(Session user){
		users.remove(user);
	}
	
	@OnError
	public void handleError(Throwable t){
		
	}
	
	
	
	
	
	
}

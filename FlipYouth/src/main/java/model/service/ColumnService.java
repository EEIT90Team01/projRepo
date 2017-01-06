package model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Service(value = "columnService")
public class ColumnService {
	
	@Autowired
	private Gson gson;
	
	String tableName;
	String[] cols;
	Map<String, String[]> colsMap;
	Map<String, String[]> colStringsMap;
	
	@PostConstruct
	void init(){
		colsMap = new HashMap<String, String[]>();
		colStringsMap = new HashMap<String, String[]>(); 
		
		colsMap.put("Administrator", new String[]{"admId","admPassword","admEmail","authId_Dis"});
		colsMap.put("Authority", new String[]{"authId","authName"});
		colsMap.put("BackEndLog", new String[]{"admId","executeTime","belNotes","sqlCommand"});
		colsMap.put("Shop", new String[]{"GameSN","GameName","Introduction","PlayingTime","PlayerNumber","SmallImage_Dis","StockQuantity","Gameclass","Ages","StrGameTheme","StrGameMechanics","StrLanguage","Price","Discount","Freight"});//,"BigImageDis","div1Dis"
		colsMap.put("Order", new String[]{"orderSN","mbrSN","orderAmount","shippedDate","orderDate","productDelivery","freight","paymentMethod","orderState","email","address","name","tel","phone"});
		colsMap.put("OrderDetail", new String[]{"orderSN","gameSN","Quantity"});
		colsMap.put("Member", new String[]{"mbrSN","mbrId","gender","mbrName","createTime","phone","address","mbrEmail","mbrState","energy","nickName","image_Dis"});
		colsMap.put("Relation", new String[]{"mbrSN_Dis","targetMbrSN_Dis","notes","relation_Dis","createTime"});
		colsMap.put("Comment", new String[]{"cmtSN","gameSN","mbrSN_Dis","cmtTime","text"});
		colStringsMap.put("Administrator", new String[]{"管理員帳號","密碼","Email","管理員權限"});
		colStringsMap.put("Authority", new String[]{"權限編號","權限名稱"});
		colStringsMap.put("BackEndLog", new String[]{"管理員帳號","執行時間","附註","SQL指令"});
		colStringsMap.put("Shop", new String[]{"商品編號","商品名稱","簡介","遊戲時間","人數","縮圖","庫存","遊戲分類","年齡","遊戲主題","遊戲機制","遊戲語言","價格","優惠價格","運送方式"});//,"大圖","遊戲介紹"
		colStringsMap.put("Order", new String[]{"訂單編號","會員編號","訂單金額","出貨日期","下訂日","到貨日期","運費","付費方式","訂單狀態","Email","地址","姓名","電話","手機"});
		colStringsMap.put("OrderDetail", new String[]{"訂單編號","商品編號","數量"});
		colStringsMap.put("Member", new String[]{"會員編號","會員帳號","性別","姓名","加入時間","電話","地址","Email","狀態碼","能量值","暱稱","大頭貼"});
		colStringsMap.put("Relation", new String[]{"會員編號","目標會員編號","註記","關係","建立時間"});
		colStringsMap.put("Comment", new String[]{"留言編號","商品編號","會員編號","留言時間","內容"});
	}
	
	public String getTableName() {
		return tableName;
	}

	public String[] getCols() {
		return cols;
	}

	public String getColumnInfo(String tableName) {
		
		this.tableName = tableName;
		cols=colsMap.get(tableName);
		JsonArray jArray = new JsonArray();
		for (String col:cols){
			JsonObject colDef = new JsonObject();
			colDef.add("data", gson.toJsonTree(col));
			colDef.add("defaultContent", gson.toJsonTree(""));
			jArray.add(colDef); 
		}
		JsonObject jObj = new JsonObject();
		jObj.add("cols", jArray);
		jObj.add("colStrings", gson.toJsonTree(colStringsMap.get(tableName)));

		return gson.toJson(jObj);
	}
}

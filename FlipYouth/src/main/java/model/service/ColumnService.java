package model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service(value = "columnService")
public class ColumnService {
	
	String tableName;
	String[] cols;
	Map<String, String[]> colsMap;
	Map<String, String[]> colStringsMap;
	
	@PostConstruct
	void init(){
		colsMap = new HashMap<String, String[]>();
		colStringsMap = new HashMap<String, String[]>(); 
		colsMap.put("Administrator", new String[]{"admId","admPassword","admEmail","authIdText"});
		colsMap.put("Authority", new String[]{"authId","authName"});
		colsMap.put("BackEndLog", new String[]{"admId","executeTime","belNotes","sqlCommand"});
		colStringsMap.put("Administrator", new String[]{"管理員帳號","密碼","Email","管理員權限"});
		colStringsMap.put("Authority", new String[]{"權限編號","權限名稱"});
		colStringsMap.put("BackEndLog", new String[]{"管理員帳號","執行時間","附註","SQL指令"});
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
		JSONArray jsonArray = new JSONArray();
		for (String col:cols){
			JSONObject colDef = new JSONObject();
			colDef.put("data", col).put("defaultContent", "");
			jsonArray.put(colDef); 
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("cols", jsonArray);
		jsonObject.put("colStrings", colStringsMap.get(tableName));
//		System.out.println(jsonArray.toString());
		return jsonObject.toString();
	}
}

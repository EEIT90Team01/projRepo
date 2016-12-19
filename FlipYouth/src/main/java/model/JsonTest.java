package model;

import org.json.JSONObject;

public class JsonTest {

	public static void main(String[] args) {
		
		JSONObject jsonObject = new JSONObject(new OrderBean("test","test","test","test","test"));
		
		System.out.println(jsonObject);
	}

}

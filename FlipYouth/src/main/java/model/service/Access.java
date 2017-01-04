package model.service;

import java.io.Serializable;

public class Access implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String accessString;
	private String accessName;

	public String getAccessString() {
		return accessString;
	}

	public String getAccessName() {
		return accessName;
	}

	public Access(String accessString, String accessName) {
		this.accessString = accessString;
		this.accessName = accessName;
	}
}

package model.service;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service(value="tempService")
public class TempService {
	
	@Autowired
	private ServletContext context; 

	private String rootPath;

	public String getRootPath() {
		return rootPath;
	}
	
	@PostConstruct
	public void init(){
		this.rootPath = (System.getProperty("catalina.base")+"/wtpwebapps"+context.getContextPath()).replace("/", File.separator);
	}
}

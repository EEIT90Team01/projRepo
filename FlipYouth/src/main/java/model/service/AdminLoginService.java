package model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.bean.AdministratorBean;
import model.dao.AdministratorDTDAO;
@Service(value="adminLoginService")
@Transactional
public class AdminLoginService {

	List<Access> accessList1;
	List<Access> accessList2;
	List<Access> accessList3;

	public class Access {
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
	@PostConstruct
	void init(){
		accessList1 = new ArrayList<Access>();
		accessList1.add(new Access("管理員", "Administrator"));
		accessList1.add(new Access("權限", "Authority"));
		accessList1.add(new Access("管理紀錄", "BackEndLog"));
		// accessList2 = new ArrayList<Access>();
		// accessList3 = new ArrayList<Access>();
	}
	
	public List<Access> getAccessList(Integer id) {
		switch (id) {
		case 1:	
			return accessList1;
		case 2:
			return accessList2;
		case 3:
			return accessList3;
		default:
			return null;
		}
	}

	@Autowired
	private AdministratorDTDAO administratorDao;
	
	@Transactional(readOnly=true)
	public AdministratorBean login(String admId, String admPassword) {
		
		AdministratorBean bean = null;
		bean = administratorDao.select(admId);
		if (bean != null) {
			if (admPassword != null && admPassword.length() != 0) {
				
				byte[] pass = bean.getAdmPassword();
				byte[] temp = admPassword.getBytes();
				if (!Arrays.equals(pass, temp)) {
					bean = null;
				}
			} else {
				bean = null;
			}
		}
		return bean;
	}
}

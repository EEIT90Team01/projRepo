package model.service;

import java.io.Serializable;
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
	@PostConstruct
	void init(){
		accessList1 = new ArrayList<Access>();
		accessList1.add(new Access("管理員帳號", "Administrator"));
		accessList1.add(new Access("權限列表", "Authority"));
		accessList1.add(new Access("管理紀錄(唯讀)", "BackEndLog"));
		accessList2 = new ArrayList<Access>();
		accessList2.add(new Access("商品資訊", "Shop"));
		accessList2.add(new Access("訂單", "Order"));
		accessList2.add(new Access("訂單明細", "OrderDetail"));
		accessList3 = new ArrayList<Access>();
		accessList3.add(new Access("會員", "Member"));
		accessList3.add(new Access("留言", "Comment"));	
		accessList3.add(new Access("揪團", "Event"));
		accessList3.add(new Access("揪團成員", "EventDetail"));
		accessList3.add(new Access("地點", "Location"));
		accessList3.add(new Access("評價", "Rating"));
		accessList3.add(new Access("檢舉", "Report"));
		accessList3.add(new Access("好友關係(唯讀)", "Relation"));
		accessList3.add(new Access("封鎖記錄(唯讀)", "BanLog"));
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
			if (admPassword != null && !admPassword.isEmpty()) {
				
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

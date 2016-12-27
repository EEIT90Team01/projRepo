package model.dao;

import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import model.MemberBean;
@Transactional
@Lazy(value = false)
@Repository(value = "memberDao")
public class MemberDAO {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// @Transactional
	// public ShopBean select(int id) {//查詢一筆
	// ShopBean bean=(ShopBean) this.getSession().get(ShopBean.class, id);
	// return bean;
	// }

	@Transactional
	// public List<ShopBean> select(String id) {//查詢多筆
	// Query query = this.getSession().createQuery(("from ShopBean "+id));
	// return (List<ShopBean>) query.getResultList();
	// }
	// 一開始顯示會員資料
	public MemberBean select(String mbrId) {
		MemberBean memberBean = null;
		List list = this.getSession().createQuery("from MemberBean where mbrId = '" + mbrId + "'").getResultList();
		// 原本是用這個方法 但get只能找primaryKey,所以不適用
		// return memberBean = this.getSession().get(MemberBean.class, mbrId);
		if (!list.isEmpty()) {
			return memberBean = (MemberBean) list.get(0);
		} else {
			return null;
		}
	}

	// 修改會員資料 SQL指令
	// UPDATE employees
	// SET department_id = 60
	// WHERE employee_id = 178;

	public MemberBean updateMember(Integer mbrSN, String nickName, String mbrPassword, String phone, String address,
			String mbrEmail, MultipartFile image) throws IOException {

		MemberBean memberBean = (MemberBean) this.getSession().get(MemberBean.class, mbrSN);
		if (memberBean != null) {
			memberBean.setNickName(nickName);
			memberBean.setMbrPassword(mbrPassword);
			memberBean.setPhone(phone);
			memberBean.setAddress(address);
			memberBean.setMbrEmail(mbrEmail);
			memberBean.setImage(image.getBytes());
			 this.getSession().update(memberBean);
		}
		return memberBean;
	}
}

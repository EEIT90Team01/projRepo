package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import model.FBMemberBean;
import model.GoogleMemberBean;
import model.MemberBean;
import model.ShopBean;

@Lazy(value = false)
@Repository(value = "shopDao")
public class ShopDao {
	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public int checkGMember(String GMemberSN) {
		int result = 0;
		GoogleMemberBean GMember = (GoogleMemberBean)this.getSession().get(GoogleMemberBean.class, GMemberSN);
		if (GMember != null){
			result = GMember.getMbrSN();
		}
		return result;
	}

	public ShopBean select(int id) {// 查詢一筆
		ShopBean bean = (ShopBean) this.getSession().get(ShopBean.class, id);
		return bean;
	}

	@SuppressWarnings("unchecked")
	public List<ShopBean> select(String id) {// 查詢多筆
		Query query = this.getSession().createQuery(("from ShopBean " + id));
		return (List<ShopBean>) query.getResultList();
	}

	public MemberBean savegMbrAndGID(MemberBean gmbr, String GID) {
		Integer mbrSN= (Integer) this.getSession().save(gmbr);
		this.getSession().save(new GoogleMemberBean(GID,mbrSN));
		return (MemberBean)this.getSession().get(MemberBean.class, mbrSN);
	}
	public MemberBean selectMbr(Integer mbrSN){
		return (MemberBean)this.getSession().get(MemberBean.class, mbrSN);
	}

	public Integer checkFBMember(String id) {
		int result = 0;
		FBMemberBean FBMember = (FBMemberBean)this.getSession().get(FBMemberBean.class, id);
		if (FBMember != null){
			result = FBMember.getMbrSN();
		}
		return result;
	}

	public MemberBean savegMbrAndFBID(MemberBean fBmbr, String fBID) {
		Integer mbrSN= (Integer) this.getSession().save(fBmbr);
		this.getSession().save(new FBMemberBean(mbrSN,fBID));
		return (MemberBean)this.getSession().get(MemberBean.class, mbrSN);
	}
}

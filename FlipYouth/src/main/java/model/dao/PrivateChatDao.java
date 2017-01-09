package model.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.ChatBean;
@Transactional
@Repository("privateChatDao")
public class PrivateChatDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	private  Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	//===================	 選取雙方所有對話		===================================
	@Transactional
	public List<ChatBean> selectChatHistory(Integer sendMbrSN, Integer receivedMbrSN, int counter){
		Query query = this.getSession().createQuery("from ChatBean where (sendMbrSN="+sendMbrSN+"or sendMbrSN="+ receivedMbrSN+" ) and (receivedMbrSN="+receivedMbrSN+"or receivedMbrSN="+sendMbrSN+")order by createTime desc");
//		Query query = this.getSession().createQuery("from ChatBean where sendMbrSN="+sendMbrSN+"and receivedMbrSN ="+receivedMbrSN+"order by createTime");
		query.setFirstResult(counter);
		query.setMaxResults(10);
		List<ChatBean> resultList = query.getResultList();
		for(ChatBean bean: resultList){
			System.out.println(bean);
		}
		return resultList;
	}
	//============================================================================
	
	//===================	 儲存對話		===================================
	@Transactional
	public Integer saveChatHistory(ChatBean chatBean){
		Integer a = (Integer) this.getSession().save(chatBean);
		return a;
	}
	//============================================================================	
	
	//===================	 選取單一對話		===================================
	@Transactional
	public ChatBean seletSingleChat(Integer chatSN){
		 
		return this.getSession().get(ChatBean.class, chatSN);
	}
	//============================================================================	
	
}

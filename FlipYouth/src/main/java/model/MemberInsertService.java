package model;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("memberInsertService")
@Transactional
public class MemberInsertService {
	@Autowired
	@Resource(name="MemberInsertDao")
	MemberInsertDao dao ;
	@Transactional
	public MemberBean insert(MemberBean bean){
		MemberBean result = null;
		if(bean != null){
			result = dao.insert(bean);
		}
		return result;
	}
	
	public MemberBean check(MemberBean bean, String field){
		MemberBean result = null;
		if(bean != null){
			result = dao.check(bean, field);
		}else{
			return null;
		}
		return result;
	}
	
	public boolean stateUpdate(MemberBean bean){
		return dao.stateUpdate(bean);
	}
	
}

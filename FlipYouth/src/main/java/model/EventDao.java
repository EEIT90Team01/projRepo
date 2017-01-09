package model;

import java.util.List;
import org.hibernate.Session;

public interface EventDao {
	
	Session getSession();
	EventBean select(java.util.Date beginTime);
	EventBean select(Integer eventSN);
	List<EventBean> select();
	EventBean insert(EventBean bean);
	EventBean update(EventBean bean);
	boolean delete(Integer eventSN);
	
}
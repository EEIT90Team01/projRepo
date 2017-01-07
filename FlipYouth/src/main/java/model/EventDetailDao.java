package model;

import java.util.List;

import org.hibernate.Session;

public interface EventDetailDao {
	
	Session getSession();
	EventDetailBean select(EventDetailPK eventDetailPK);
	List<EventDetailBean> select();
	EventDetailBean insert(EventDetailBean bean);
	EventDetailBean update(EventDetailBean bean);
	boolean delete(EventDetailPK eventDetailPK);
	
}
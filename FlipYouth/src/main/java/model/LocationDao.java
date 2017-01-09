package model;

import java.util.List;

import org.hibernate.Session;

public interface LocationDao {
	
	Session getSession();
	LocationBean select(Integer locSN);
	List<LocationBean> select();
	LocationBean insert(LocationBean bean);
	LocationBean update(LocationBean bean);
	boolean delete(Integer locSN);
	
}
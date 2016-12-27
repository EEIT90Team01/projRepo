package model;

import java.util.List;

public interface CommentDao {
	CommentBean insert (CommentBean bean);
	List<CommentBean> select (int gameSN);
	boolean delete(int cmtSN);
	CommentBean select(CommentBean bean);
 	
	
}

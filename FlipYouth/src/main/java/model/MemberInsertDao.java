package model;

public interface MemberInsertDao {
	MemberBean select(int mbrSN);
	MemberBean insert(MemberBean bean);
	MemberBean check(MemberBean bean , String field);
	boolean stateUpdate(MemberBean bean);
	String selectImage(int mbrSN);

}

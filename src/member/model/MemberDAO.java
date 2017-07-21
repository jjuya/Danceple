package member.model;


import dandb.UserVO;

public interface MemberDAO {
	
	void insertMember(UserVO memberVO) throws Exception;

	boolean duplicateIdCheck(String id) throws Exception;


	
	



	

}

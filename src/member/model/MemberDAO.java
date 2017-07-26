package member.model;


import dandb.UserVO;

public interface MemberDAO {
	
	void insertMember(UserVO userVO) throws Exception;

	int userCheck(UserVO userVO) throws Exception;

	UserVO getUser(UserVO userVO) throws Exception;
	
	UserVO confirmAction(UserVO userVO) throws Exception;
	void userUpdateAction(UserVO userVO) throws Exception;
	UserVO getpageIn(UserVO userVO) throws Exception;
	void userDeleteAction(String userId) throws Exception;

}

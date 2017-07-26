package member.model;

import com.ibatis.sqlmap.client.SqlMapClient;

import dandb.UserVO;
import ibatis.QueryHandler;

public class MemberDAOImpl implements MemberDAO {

	private static MemberDAOImpl memberDAO = null;
	
	public static MemberDAOImpl getInstance() {
		if (memberDAO == null) {
			memberDAO = new MemberDAOImpl();
		}
		return memberDAO;
	}

	@Override
	public void insertMember(UserVO userVO) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		sqlMap.insert("user.insertUser",userVO);

	}

	@Override // 유저사용자인증확인
	public int userCheck(UserVO userVO) throws Exception {
		int result = -1;
		String pwd = null;
		
		SqlMapClient sqlMap = QueryHandler.getInstance();
		pwd = (String) sqlMap.queryForObject("user.userCheck", userVO.getUserId());
		
			if (pwd != null) {
				if (pwd.equals(userVO.getUserPwd())) {
					result = 1;

				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			
		return result;
	}

	@Override
	public UserVO getUser(UserVO userVO) throws Exception {

		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (UserVO) sqlMap.queryForObject("user.getUser", userVO.getUserId());
	}
	
	
	
	@Override
	public UserVO confirmAction(UserVO userVO) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (UserVO) sqlMap.queryForObject("user.userConfirm",userVO);
	}
	
	@Override
	public UserVO getpageIn(UserVO userVO) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (UserVO) sqlMap.queryForObject("user.pageIn",userVO);
	}
	
	@Override
	public void userUpdateAction(UserVO userVO) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		sqlMap.update("user.userUpdate", userVO);
		if (sqlMap.update("user.userUpdate",userVO)==0) {
			throw new RuntimeException("회원정보가 틀립니다.");
		}
		
	}

	@Override
	public void userDeleteAction(String userId) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		if (sqlMap.delete("user.userDelete", userId)==0) {
			throw new RuntimeException("회원정보가 틀립니다.");
		}
		
	}

}

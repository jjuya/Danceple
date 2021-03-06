package apply.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibatis.sqlmap.client.SqlMapClient;

import basic.controllers.DispatcherServlet;
import dandb.ApplyVO;
import dandb.GenreVO;
import dandb.TeamVO;
import dandb.UserVO;
import ibatis.QueryHandler;

public class ApplyDAOImpl implements ApplyDAO {
	private static ApplyDAOImpl applyDAO = null;

	private static Logger logger = 
			LoggerFactory.getLogger(DispatcherServlet.class);

	public static ApplyDAOImpl getInstance() {
		if (applyDAO == null) {
			applyDAO = new ApplyDAOImpl();
		}
		return applyDAO;
	}

	@Override
	public void insertApply(ApplyVO applyVO) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		sqlMap.insert("apply.insertApply", applyVO);

	}

	@Override
	public List<TeamVO> getTeamList() throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return sqlMap.queryForList("apply.getTeamList");
	}

	@Override
	public List<GenreVO> getGenreList() throws Exception {
	    SqlMapClient sqlMap = QueryHandler.getInstance();
	    return sqlMap.queryForList("apply.getGenreList");
	}

/*	public List<SeasonVO> getSeasonList() throws Exception {
	    SqlMapClient sqlMap = QueryHandler.getInstance();
	    return sqlMap.queryForList("apply.getSeasonList");
	}*/

    @Override
    public UserVO getUser() throws Exception {
        SqlMapClient sqlMap = QueryHandler.getInstance();
        return (UserVO) sqlMap.queryForObject("apply.getuser");
    }

	@Override
	public String getDay(String day) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (String) sqlMap.queryForObject("apply.getday", day);
	}

	@Override
	public UserVO userIn(String userId) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (UserVO) sqlMap.queryForObject("apply.userIn", userId);
	}

	@Override
	public TeamVO teamIn(String teamId) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (TeamVO) sqlMap.queryForObject("apply.teamIn", teamId);
	}

	@Override
	public GenreVO genreIn(String genreId) throws Exception {
		SqlMapClient sqlMap = QueryHandler.getInstance();
		return (GenreVO) sqlMap.queryForObject("apply.genreIn", genreId);
	}


    

}

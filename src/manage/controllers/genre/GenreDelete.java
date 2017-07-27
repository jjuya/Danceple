package manage.controllers.genre;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.GenreVO;
import dandb.GradeVO;
import dandb.TeamVO;
import dandb.UserVO;
import info.model.InfoDAO;
import info.model.InfoDAOImpl;
import manage.controllers.team.TeamUpdate;

public class GenreDelete extends AbstractController{
	
	private static Logger logger = LoggerFactory.getLogger(TeamUpdate.class);

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		InfoDAO infoDAO = InfoDAOImpl.getInstance();
		
		ModelAndView mav = new ModelAndView();
		
		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			try {
				String genreId = request.getParameter("genreId");

				GenreVO genreVO = infoDAO.getGenreDetail(genreId);

				mav.setViewName("/WEB-INF/manage/genre/GenreDelete.jsp");
				mav.addObject("genreVO", genreVO);

			} catch (Exception e) {
				logger.info(e.toString());

				mav.setViewName("/WEB-INF/views/result.jsp");

				mav.addObject("msg", e.getMessage());
				mav.addObject("url", "../admin/genre");
			}
		} else {
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
		}
		
		return mav;		
	}

}

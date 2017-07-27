package manage.controllers.genre;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.GenreVO;
import dandb.UserVO;
import manage.model.GenreManageDAO;
import manage.model.GenreManageDAOImpl;

public class GenreDeleteAction extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		String genreId = request.getParameter("genreId");
		
		GenreManageDAO genreManageDAO = GenreManageDAOImpl.getInstance();
		ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");
		
		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			try {
				genreManageDAO .deleteGenre(genreId);
				mav.addObject("msg", "장르 삭제 성공");
				mav.addObject("url", "../admin/genre");
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("msg", "장르 삭제 실패");
				mav.addObject("url", "javascript:history.back();");
			}
		} else {
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
		}

		return mav;
		
		
	}
} //end class
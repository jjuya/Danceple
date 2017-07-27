package manage.controllers.genre;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.UserVO;

public class GenreInsert extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		ModelAndView mav = new ModelAndView();
		
		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			mav.setViewName("/WEB-INF/manage/genre/GenreInsert.jsp");
		} else {
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
		}
		
		return mav;
	}

}

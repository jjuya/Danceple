package manage.controllers.grade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.UserVO;

public class GradeInsert extends AbstractController{


	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			return new ModelAndView("/WEB-INF/manage/grade/GradeInsert.jsp");
		} else {
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
			
			return mav;
		}
	}
}

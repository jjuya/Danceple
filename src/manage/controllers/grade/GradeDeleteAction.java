package manage.controllers.grade;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.GradeVO;
import dandb.UserVO;
import manage.model.GradeManageDAO;
import manage.model.GradeManageDAOImpl;

public class GradeDeleteAction extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		String gradeId = request.getParameter("gradeId");

		GradeManageDAO gradeManageDAO = GradeManageDAOImpl.getInstance();
		ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");

		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			try {
				gradeManageDAO .deleteGrade(gradeId);
				mav.addObject("msg", "등급 삭제 성공");
				mav.addObject("url", "../admin/grade");
			} catch (Exception e) {
				e.printStackTrace();
				mav.addObject("msg", "등급 삭제 실패");
				mav.addObject("url", "javascript:history.back();");
			}
		} else {
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
		}

		return mav;
	}
} //end class
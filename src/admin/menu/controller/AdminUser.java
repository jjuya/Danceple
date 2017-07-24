package admin.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.GradeVO;
import dandb.UserVO;
import info.model.InfoDAO;
import info.model.InfoDAOImpl;

public class AdminUser extends AbstractController{
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		InfoDAO infoDAO = InfoDAOImpl.getInstance();
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List<UserVO> userList = infoDAO.getUserList();
			List<GradeVO> gradeList = infoDAO.getGradeList(); 
			
			mav.setViewName("/WEB-INF/admin/manageUser.jsp");
			mav.addObject("userList", userList);
			mav.addObject("gradeList", gradeList);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "리스트 출력에러\n관리자에게 문의하세요");
			mav.addObject("url", "test");
		}
		
		return mav;
	}
} //end class

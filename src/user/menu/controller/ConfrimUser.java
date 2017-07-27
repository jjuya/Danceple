package user.menu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.UserVO;

public class ConfrimUser extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/user/confirmPage.jsp");
		mav.addObject("loginUser", loginUser);
		
		return mav;
	}

}

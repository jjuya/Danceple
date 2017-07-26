package user.menu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;

public class ConfrimUser extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("/WEB-INF/user/confirmPage.jsp");
	}

}

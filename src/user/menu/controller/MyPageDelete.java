package user.menu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import member.model.MemberDAO;
import member.model.MemberDAOImpl;

public class MyPageDelete extends AbstractController{

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		
		try{
			memberDAO.userDeleteAction(userId);
			mav.addObject("msg", "회원탈퇴가 성공적으로 이루어졌습니다.");
			mav.setViewName("./index.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("msg", "삭제가 실패했습니다. 아이디 잘못들고온듯");
			mav.addObject("url", "javascript:history.back()");
		}
		return mav;
	}

}

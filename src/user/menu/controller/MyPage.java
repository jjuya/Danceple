package user.menu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.UserVO;
import member.model.MemberDAO;
import member.model.MemberDAOImpl;

public class MyPage extends AbstractController{
	private static Logger logger = 
			LoggerFactory.getLogger(ConfirmAction.class);
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		UserVO userVO = new UserVO();
		ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");
		
		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
				
		userVO.setUserId(loginUser.getUserId());
		
		try {
			UserVO pageIn = memberDAO.getpageIn(userVO);
			mav.addObject("pageIn", pageIn);
			mav.setViewName("/WEB-INF/user/mypage.jsp");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("msg", "회원정보를 조회할 수 없습니다.");
			mav.addObject("url", "javascript:history.back()");
		}
		return mav;
	}

}

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

public class ConfirmAction extends AbstractController{
	private static Logger logger = 
			LoggerFactory.getLogger(ConfirmAction.class);
	
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		logger.info(userId);
		
		ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");
		
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		userVO.setUserPwd(userPwd);
		
		
		
		
		try {
			memberDAO.confirmAction(userVO);
			
			if(memberDAO.confirmAction(userVO) != null) {
				mav.addObject("msg", "본인 확인 완료");
				mav.addObject("url", "myPage");
			} else {
				mav.addObject("msg", "잘못된 회원 정보입니다.");
				mav.addObject("url", "javascript:history.back()");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", "try도 안됐어!!!!!");
			mav.addObject("url", "javascript:history.back()");
		}
				
		return mav;
	}

}

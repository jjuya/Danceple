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

public class MyPageUpdate extends AbstractController{
	private static Logger logger = 
			LoggerFactory.getLogger(ConfirmAction.class);

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView("/WEB-INF/views/result.jsp");
		MemberDAO memberDAO = MemberDAOImpl.getInstance();
		UserVO userVO = new UserVO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		String userPwd = request.getParameter("nuserPwd");
		String userPwd2 = request.getParameter("nuserPwd2");
		String phone = request.getParameter("nphone");
		String email = request.getParameter("nemail");
		String imgurl = request.getParameter("nimgUrl");
		
		logger.info(userPwd);
		logger.info(userPwd2);
		logger.info(phone);
		logger.info(email);
		logger.info(userId);
		logger.info(imgurl);
		
		
		userVO.setUserId(userId);
		userVO.setUserPwd(userPwd);
		userVO.setPhone(phone);
		userVO.setEmail(email);
		userVO.setImgUrl(imgurl);
		
		try {
			if (userPwd.equals(userPwd2)) {
				memberDAO.userUpdateAction(userVO);
				mav.addObject("msg", "개인 정보 수정 완료");
				mav.setViewName("../index.jsp");
			} else {
				mav.addObject("msg", "새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			}
			
		} catch(Exception e) {
			mav.addObject("msg", "오류 발생");
			mav.addObject("url", "javascript:history.back()");
			e.printStackTrace();
		}
		
		session.removeAttribute("userId");
		return mav;
	}

}

package list.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.SeasonVO;
import dandb.UserVO;
import info.model.InfoDAO;
import info.model.InfoDAOImpl;

public class SeasonList extends AbstractController {

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session=request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		InfoDAO infoDAO = InfoDAOImpl.getInstance();

		ModelAndView mav = new ModelAndView();

		if(loginUser.getGradeId().equals("0")) { //admin 등급 확인
			try {
				List<SeasonVO> seasonList = infoDAO.getSeasonList(); 

				mav.setViewName("/WEB-INF/manage/list/SeasonList.jsp");
				mav.addObject("seasonList", seasonList);
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("/WEB-INF/views/result.jsp");
				mav.addObject("msg", "리스트 출력에러\n관리자에게 문의하세요");
				mav.addObject("url", "test");
			}
		} else {
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "접근 권한이 없습니다.");
			mav.addObject("url", "javascript:history.back();");
		}


		return mav;
	}

} //end class

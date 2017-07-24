package admin.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.ProjectVO;
import dandb.SeasonVO;
import info.model.InfoDAO;
import info.model.InfoDAOImpl;

public class AdminSeason extends AbstractController{
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		SeasonVO teamVO = new SeasonVO();
		ProjectVO genreVO = new ProjectVO();
		
		InfoDAO infoDAO = InfoDAOImpl.getInstance();
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List<SeasonVO> seasonList = infoDAO.getSeasonList(); 
			List<ProjectVO> projectList = infoDAO.getProjectList();
			
			mav.setViewName("/WEB-INF/admin/manageSeason.jsp");
			mav.addObject("seasonList", seasonList);
			mav.addObject("projectList", projectList);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("/WEB-INF/views/result.jsp");
			mav.addObject("msg", "리스트 출력에러\n관리자에게 문의하세요");
			mav.addObject("url", "test");
		}
		
		return mav;
	}
} //end class

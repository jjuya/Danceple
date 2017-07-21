package manage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.controllers.AbstractController;
import basic.controllers.ModelAndView;
import dandb.GenreVO;
import dandb.GradeVO;
import dandb.TeacherVO;
import dandb.TeamVO;
import info.model.InfoDAO;
import info.model.InfoDAOImpl;

public class ManageList extends AbstractController{
	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) {
		
		TeamVO teamVO = new TeamVO();
		GenreVO genreVO = new GenreVO();
		TeacherVO teacherVO = new TeacherVO();
		GradeVO gradeVO = new GradeVO();
		
		InfoDAO infoDAO = InfoDAOImpl.getInstance();
		
		ModelAndView mav = new ModelAndView();
		
		try {
			List<TeamVO> teamList = infoDAO.getTeamList(); 
			List<GenreVO> genreList = infoDAO.getGenreList();
			List<TeacherVO> teacherList = infoDAO.getTeacherList();
			List<GradeVO> gradeList = infoDAO.getGradeList();
			
			mav.setViewName("/WEB-INF/menu/managepage.jsp");
			mav.addObject("teamList", teamList);
			mav.addObject("genreList", genreList);
			mav.addObject("teacherList", teacherList);
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

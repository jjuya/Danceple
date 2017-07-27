package auth;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dandb.UserVO;

public class AdminFilter implements Filter {

   @Override
   public void destroy() {
      
   }

   @Override
   public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain fc)
         throws IOException, ServletException {
      System.out.println("Admin Filter수행중");
      
      HttpServletRequest request = (HttpServletRequest) srequest;
      HttpServletResponse response = (HttpServletResponse) sresponse;
      HttpSession session = request.getSession();
      String contextPath = request.getContextPath();
      String action = request.getRequestURI().substring(contextPath.length());
      
      UserVO loginUser = (UserVO) session.getAttribute("loginUser");
      
      if (!loginUser.getGradeId().equals("0")) {   // 로그인을 하지 않음...
         request.setAttribute("msg", "접근 권한이 없습니다.");
         request.setAttribute("url", "..user/menu");
         RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/result.jsp");
         dispatcher.forward(request, response);
         return;
      } 
      
      fc.doFilter(request, response);
   }

   @Override
   public void init(FilterConfig arg0) throws ServletException {
      
   }

}
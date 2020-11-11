package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/MSearch")
public class MSearchOk extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    String nickname = request.getParameter("nickname");
    
    MemberDao dao = new MemberDao();
    MemberVo vo = dao.mSearch("nickname", nickname);
    
    PrintWriter out = response.getWriter();
    
    if(vo == null) {
      out.println("<script>");
      out.println("alert('검색 실패....(확인하세요)');");
      out.println("location.href='"+request.getContextPath()+"/member/mSearch.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('검색 완료!!');");
      //out.println("location.href='"+request.getContextPath()+"/member/mMain.jsp';");
      out.println("</script>");
      
      request.setAttribute("vo", vo);
      
      RequestDispatcher dispatcher = request.getRequestDispatcher("/member/mSearchView.jsp");
      dispatcher.forward(request, response);
    }
  }
}

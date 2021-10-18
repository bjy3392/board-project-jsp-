//git hub test
package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/mLogin")
public class MLoginOk extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    MemberDao dao = new MemberDao();
    MemberVo vo = new MemberVo();
    
    vo.setMid(request.getParameter("mid")==null ? "" : request.getParameter("mid"));
    vo.setPwd(request.getParameter("pwd")==null ? "" : request.getParameter("pwd"));
    
    vo = dao.loginCheck(vo);  // DB에서 로그인 체크
    
    PrintWriter out = response.getWriter();
    HttpSession session = request.getSession();
    
    if(vo == null) {
      out.println("<script>");
      out.println("alert('로그인 실패....(확인하세요)');");
      out.println("location.href='"+request.getContextPath()+"/member/mLogin.jsp';");
      out.println("</script>");
      return;
    }
    else {
      if(vo.getLevel().equals("관리자")) {
        session.setAttribute("smid", "admin");
      }
      else {
        session.setAttribute("smid", vo.getMid());
      }
      session.setAttribute("snickname", vo.getNickname());
      session.setAttribute("slevel", vo.getLevel());
      
      
      out.println("<script>");
      out.println("alert('"+vo.getNickname()+"님 반갑습니다.');");
      out.println("location.href='"+request.getContextPath()+"/';");
      out.println("</script>");
    }
  }
}

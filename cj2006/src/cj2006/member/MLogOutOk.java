package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/MLogOut")
public class MLogOutOk extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");

    HttpSession session = request.getSession();
    String snickname = (String) session.getAttribute("snickname");
    session.invalidate();
    
    PrintWriter out = response.getWriter();
    
    out.println("<script>");
    out.println("alert('"+snickname+"님 로그아웃!!!!');");
    out.println("location.href='"+request.getContextPath()+"/';");
    out.println("</script>");
  }
}

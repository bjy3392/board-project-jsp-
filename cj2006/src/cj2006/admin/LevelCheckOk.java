package cj2006.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/LevelCheck")
public class LevelCheckOk extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    int idx = Integer.parseInt(request.getParameter("idx"));
    String level = request.getParameter("level");
    
    AdminDao dao = new AdminDao();
    
    int res = dao.levelCheck(idx, level);
    
    PrintWriter out = response.getWriter();
    
    if(res == 1) {
      out.println("<script>");
      out.println("alert('회원 등급이 변경되었습니다.');");
      out.println("location.href='"+request.getContextPath()+"/admin/aMenu.jsp?sw=m';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('회원 등급이 변경작업이 취소되었습니다.');");
      out.println("location.href='"+request.getContextPath()+"/admin/aMenu.jsp?sw=m';");
      out.println("</script>");
    }
    
  }
}

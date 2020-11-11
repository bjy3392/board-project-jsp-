package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/MInput")
public class MInputOk extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    request.setCharacterEncoding("utf-8");
    
    MemberDao dao = new MemberDao();
    MemberVo vo = new MemberVo();
    
    vo.setMid(request.getParameter("mid"));
    vo.setPwd(request.getParameter("pwd"));
    vo.setNickname(request.getParameter("nickname"));
    vo.setName(request.getParameter("name"));
    vo.setGender(request.getParameter("gender"));
    vo.setBirth(request.getParameter("birth"));
    vo.setTel(request.getParameter("tel"));
    vo.setAddress(request.getParameter("address"));
    vo.setEmail(request.getParameter("email"));
    vo.setHomepage(request.getParameter("homepage"));
    vo.setJob(request.getParameter("job"));
    vo.setHobby(request.getParameter("hobby"));
    vo.setUserinfo(request.getParameter("userinfor"));
    
    String name = dao.mInput(vo);
    
    PrintWriter out = response.getWriter();
    
    if(name.equals("")) {
      out.println("<script>");
      out.println("alert('중복된 아이디/닉네임을 가입할 수 없습니다.');");
      out.println("location.href='"+request.getContextPath()+"/member/mInput.jsp';");
      out.println("</script>");
    }
    else {
      out.println("<script>");
      out.println("alert('"+name+"님 가입을 환영합니다.');");
      out.println("location.href='"+request.getContextPath()+"/member/mLogin.jsp';");
      out.println("</script>");
    }
  }
}

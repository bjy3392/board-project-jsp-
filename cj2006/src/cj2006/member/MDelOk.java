package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/MDel")
public class MDelOk extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    String smid = request.getParameter("mid");
		String cause = request.getParameter("cause");

		HttpSession session = request.getSession();
		
		MemberDao dao = new MemberDao();
		boolean res =dao.delCheck(cause,smid);
		
		PrintWriter out = response.getWriter();
		
		if(res) {
			  session.invalidate();
		      out.println("<script>");
		      out.println("alert('탈퇴처리 되었습니다.');");
		      out.println("location.href='"+request.getContextPath()+"/member/mLogin.jsp';");
		      out.println("</script>");
		    }
		    else {
		      out.println("<script>");
		      out.println("alert('탈퇴처리 할 수 없습니다.');");
		      out.println("location.href='"+request.getContextPath()+"/member/mMain.jsp';");
		      out.println("</script>");
		};
	}
}
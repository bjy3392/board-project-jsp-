package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/DelOk")
public class DelOkOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberDao dao= new MemberDao();
		boolean res = dao.delOk(idx);

		PrintWriter out = response.getWriter();
		
		if(res) {
		      out.println("<script>");
		      out.println("alert('탈퇴처리 되었습니다.');");
		      out.println("location.href='"+request.getContextPath()+"/admin/aMenu.jsp';");
		      out.println("</script>");
		    }
		    else {
		      out.println("<script>");
		      out.println("alert('탈퇴처리 할 수 없습니다.');");
		      out.println("location.href='"+request.getContextPath()+"/admin/aMenu.jsp';");
		      out.println("</script>");
		}
	}
}

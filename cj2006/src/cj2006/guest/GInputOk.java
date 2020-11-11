package cj2006.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GInput")
public class GInputOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; chrset=utf8");
		
		request.setCharacterEncoding("utf-8");
		
		GuestVo vo = new GuestVo();
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setHomepage(request.getParameter("homepage"));
		vo.setHostip(request.getParameter("hostip"));
		vo.setContent(request.getParameter("content"));
		
		GuestDao dao = new GuestDao();
		int res = dao.gInput(vo);
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			out.println("<script>");
			out.println("alert('등록되었습니다.')");
		    out.println("location.href='/cj2006/guest/gList.jsp';");	
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('등록안되었습니다.')");
		    out.println("location.href='/cj2006/guest/gInput.jsp';");
		    out.println("</script>");			
		}
		
		
	}
}

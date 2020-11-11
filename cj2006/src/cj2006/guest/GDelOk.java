package cj2006.guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GDel")
public class GDelOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; chrset=utf8");
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pag = Integer.parseInt(request.getParameter("pag"));
		
		GuestDao dao = new GuestDao();
		int res = dao.gDel(idx);
		
		PrintWriter out = response.getWriter();
	    
	    if(res == 1) {
	      out.println("<script>");
	      out.println("alert('삭제되었습니다.');");
	      out.printf("location.href='/cj2006/guest/gList.jsp?pag=%s'",pag);
	      out.println("</script>");
	      //response.sendRedirect("/cj2006/guest/gList.jsp?pag=%s"+pag);
	    }
	    else {
	      out.println("<script>");
	      out.println("alert('삭제되지않았습니다.');");
	      out.println("location.href='/cj2006/guest/gList.jsp';");
	      out.println("</script>");
	    }
		
	}
}

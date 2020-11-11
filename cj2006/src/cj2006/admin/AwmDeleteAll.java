package cj2006.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.webmessage.WebMessageDao;

@WebServlet("/awmDeleteAll")
public class AwmDeleteAll extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");		
		
		
		WebMessageDao dao = new WebMessageDao();
		dao.awmDeleteAll();
		
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('모든 메세지 삭제')");
		out.println("location.href='"+request.getContextPath()+"/aMenu.ad?sw=wm'");
		out.println("</script>");
	}
}

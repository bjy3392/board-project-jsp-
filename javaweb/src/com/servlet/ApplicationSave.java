package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//실제 file과 이름이 같지 않다. '@'로 입력이름을 설정
@WebServlet("/0924/applicationSave")
public class ApplicationSave extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		ServletContext application = request.getServletContext(); //서블릿에서는 ServletContext로 application에 접근한다.
		application.setAttribute("admin", "mbc");
		application.setAttribute("visitCnt", 500);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('application이 저장되었습니다.');");
		out.println("location.href='/javaweb/0924_application/t1_application_main.jsp';");
		out.println("</script>");
	}
}

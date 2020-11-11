package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0924/applicationDelete")
public class ApplicationDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		ServletContext application = request.getServletContext();
		
		application.removeAttribute("admin");
		application.removeAttribute("visitCnt");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('application변수가 삭제되었습니다.')");
		out.println("location.href='/javaweb/0924_application/t1_application_main.jsp';");
		out.println("</script>");
		
	}

}

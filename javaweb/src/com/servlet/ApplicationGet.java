package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/0924/applicationGet")
public class ApplicationGet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("visitCnt") != null){
			int visitCnt = (int)application.getAttribute("visitCnt") +1;
			application.setAttribute("visitCnt", visitCnt);
		}
		
		PrintWriter out = response.getWriter();
		out.println("admin: " + application.getAttribute("admin"));
		out.println("방문자수 : "+ application.getAttribute("visitCnt"));
		
		out.println("<p><a href='/javaweb/0924_application/t1_application_main.jsp'>돌아가기</a></p>");
		
	}
}

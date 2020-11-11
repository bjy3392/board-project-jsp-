package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ab")
public class AtomServlet2 extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		int su = (request.getParameter("su") == null) || (request.getParameter("su") == "") ? 1 : Integer.parseInt(request.getParameter("su"));
		
		//int su = Integer.parseInt(strSu);
		
		PrintWriter out = response.getWriter();
		
		for(int i=0; i<su; i++) {
			out.print((i+1) + "안녕<br/>");
		}
		
	}
}

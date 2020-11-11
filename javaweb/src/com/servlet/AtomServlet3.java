package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ac")
public class AtomServlet3 extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); //
		//request.setCharacterEncoding("utf-8"); //내가 요청해서 받은 객체
		
		String title = (request.getParameter("title") == null) ? "" : request.getParameter("title");
		String content = (request.getParameter("content") == null) ? "" : request.getParameter("content");
		
		//int su = Integer.parseInt(strSu);
		
		PrintWriter out = response.getWriter();
			
		out.println("제목: " + title + "<br/>");
		out.println("내용: " + content);
		
	}
}

package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0924/sessionGet")
public class SessionGet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		HttpSession session = request.getSession();
		
		String smid = (String)session.getAttribute("smid");
		int svisitCnt = (int)session.getAttribute("svisitCnt") +1;
		session.setAttribute("svisitCnt", svisitCnt);
		
		PrintWriter out = response.getWriter();
		
		out.println("<h2>서블릿에서 확인</h2>");
		out.println("<p>세션아이디 "+smid+"</p>");
		out.println("<p>방문자수 "+session.getAttribute("svisitCnt")+"</p>");
	}

}

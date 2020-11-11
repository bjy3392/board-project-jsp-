package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/0924/sessionSave")
public class SessionSave extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		HttpSession session = request.getSession();
		
		session.setAttribute("smid", "kbs");
		session.setAttribute("sage", 29);
		session.setAttribute("svisitCnt", 500);
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('서블릿을 통한 저장')");
		out.println("history.back()");
		out.println("</script>");
		
		
	}
	
}

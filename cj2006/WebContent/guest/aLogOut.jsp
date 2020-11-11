<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	String sname = (String)session.getAttribute("sname");
	
	session.invalidate();
	
	out.println("<script>");
	out.println("alert('"+sname+" 님 로그아웃되셨습니다.')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
%>
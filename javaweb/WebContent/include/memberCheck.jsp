<!-- memberCheck.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String smid = (String)session.getAttribute("smid");
	
	if(smid== null){
		out.println("<script>");
		out.println("alert('로그인 해주세요.')");
		out.println("location.href='login.jsp'");
		out.println("</script>");
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="T0925.*"%>
<jsp:useBean id="vo" class="T0925.LoginVo"/>
<jsp:setProperty name="vo" property="*" />
<%
	request.setCharacterEncoding("utf-8");
/* 
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
 */
 
	LoginDao dao= new LoginDao();

	String name = dao.loginInputOk(vo);
	
	out.println("<script>");
	out.println("alert('"+name+" 님 회원가입을 완료하였습니다.')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
	
%>

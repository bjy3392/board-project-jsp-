<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies= request.getCookies();

	for(int i=0; i<cookies.length; i++){
		out.println(i+"번째 쿠키 이름 : " + cookies[i].getName()+"<br/>");
		out.println(i+"번째 쿠키 값 : " + cookies[i].getValue()+"<br/>");
	}
%>
<p><a href="test2_cookies.jsp">돌아가기</a></p>

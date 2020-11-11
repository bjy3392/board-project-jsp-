<!-- test2_cDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

	for(int i=0; i<cookies.length; i++){
		out.println("쿠키이름: " + cookies[i].getName()+"<br/>");
		cookies[i].setMaxAge(0); //조건에 만족하는 쿠키 삭제처리
		response.addCookie(cookies[i]);
		out.println("<p>쿠키삭제완료</p>");
	}
%>

<p><a href="test2_cookies.jsp">돌아가기</a></p>
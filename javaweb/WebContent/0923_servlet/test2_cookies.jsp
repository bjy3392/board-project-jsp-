<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2_cookies</title>
</head>
<body>
<h2>쿠키연습</h2>
<p>사용자 쿠키가 저장됩니다.</p>
<%
	Cookie cookie = new Cookie("maid","hkd1022"); //쿠키변수,쿠키값
	
	cookie.setMaxAge(60*60*24); //쿠키의 만료시간을 1일로 설정(단위:초)
	
	response.addCookie(cookie); // 설정된 쿠키를 클라이언트에 저장한다.
%>
<p><a href="test2_cSearch.jsp">쿠키확인</a></p>
<p><a href="test2_cDelete.jsp">쿠키삭제</a></p>
</body>
</html>
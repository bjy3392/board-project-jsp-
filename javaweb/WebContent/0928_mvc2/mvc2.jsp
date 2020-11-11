<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mvc.jsp</title>
</head>
<body>
<h2>친구 회원 보기</h2>
	<p>고유번호 : <%= request.getAttribute("idx") %><p/>
	<p>아이디 : <%= request.getAttribute("mid") %><p/>
	<p>비밀번호 : <%= request.getAttribute("pwd") %><p/>
	<p>이름 : <%= request.getAttribute("name") %><p/>			
	<p><a href="login.jsp">다시검색</a></p>
</body>
</html>

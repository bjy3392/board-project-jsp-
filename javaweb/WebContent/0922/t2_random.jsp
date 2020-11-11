<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t2_random.jsp</title>
</head>
<body>
<h2>난수연습</h2>
<%
	String[] str = {"Java","Python","Javascript","CSS3","JQuery"};
	int su =(int)( Math.random()*(str.length-1));
%>
<p>사용가능한 언어 : <%= str[su] %></p>
</body>
</html>
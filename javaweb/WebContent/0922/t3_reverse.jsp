<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t3_reverse.jsp</title>
</head>
<body>
<h2>문자열을 뒤집는 함수</h2>
<%
	String str = "Welcome to 코리아!";
	StringBuffer sb = new StringBuffer(str);
	sb.reverse();
	out.println(str+ " -> ");
	out.println(sb.toString());
%>
</body>
</html>
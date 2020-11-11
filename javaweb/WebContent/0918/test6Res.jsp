<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String mid= request.getParameter("mid")== null ? "" :  request.getParameter("mid");
String pwd= request.getParameter("pwd")== null ? "" :  request.getParameter("pwd"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test6Res.jsp</title>
</head>
<body>
<hr/>
<h2>이곳은 test6Res.jsp</h2>
<p>넘어온 ID : <%=mid %></p>
<p>넘어온 pwd : <%=pwd %></p>
<hr/>
</body>
</html>
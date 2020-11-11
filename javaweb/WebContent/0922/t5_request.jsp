<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t5_request.jsp</title>
</head>
<body>
<h2>시스템의 환경 설절 정보</h2>
<div>
	<p>프로토콜 : <%= request.getProtocol() %></p>
	<p>도메인이름 : <%= request.getServerName() %></p>
	<p>요청방식 : <%= request.getMethod() %></p>
	<p>QueryString : <%= request.getQueryString() %></p>
	<p>URI : <%= request.getRequestURI() %></p>
	<p>Host Name: <%= request.getRemoteHost() %></p>
	<p>IP : <%= request.getRemoteAddr() %></p>
	<p>port : <%= request.getRemotePort() %></p>
	<p>sever port : <%= request.getServerPort() %></p>
	<p>Context Path : <%= request.getContextPath() %></p>
	<p> : <%= request %></p>
	<p> : <%= request %></p>
	<p> : <%= request %></p>
	<p> : <%= request %></p>
</div>
</body>
</html>
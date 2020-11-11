<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage = "error1Ok.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>error1.jsp</title>
</head>
<body>
<p>에러가 발생되는 프로그램입니다.</p>
<hr/>
<p>에러가 발생되면 error1Ok.jsp 프로그램을 호출합니다.</p>
<%
	int su = 100/0;
%>
<p><a hrf="errorMain.jsp">돌아가기</a></p>
</body>
</html>
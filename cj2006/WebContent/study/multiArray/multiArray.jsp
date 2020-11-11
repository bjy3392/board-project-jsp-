<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%
	String[][] fruits ={
			{"사과","1000원"},
			{"바나나","1500원"},
			{"포도","900원"}
	};

	pageContext.setAttribute("fruits", fruits);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MultiArray.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>과일출력(2차원배열 연습)</h2>
	<c:forEach var="fruit" items="${fruits }">
		<c:forEach var="item" items="${fruit }">
			${item }
		</c:forEach>	
	</c:forEach>
</div>
</body>
</html>
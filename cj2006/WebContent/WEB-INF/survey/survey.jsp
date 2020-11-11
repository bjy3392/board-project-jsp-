<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>설문지 메뉴</h2>
	<hr/>
	<p><a href="${contextPath }/sList.su">설문지 리스트</a></p>
	<p><a href="${contextPath }/home.su">홈으로</a></p>
		
</div>
</body>
</html>
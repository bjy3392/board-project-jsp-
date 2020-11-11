<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test6.jsp</title>
</head>
<body>
<h2>이곳은 test6.jsp</h2>
<%-- <%@ include file="test6Res.jsp" %> --%>
<jsp:include page="test6Res.jsp">
	<jsp:param value="admin" name="mid"/>
	<jsp:param value="1234" name="pwd"/>			
</jsp:include>
<h2>이곳은 아직도 test6.jsp</h2>
</body>
</html>
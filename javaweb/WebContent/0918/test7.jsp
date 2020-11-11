<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test7.jsp</title>
</head>
<body>
<h2>3제곱 값 구하기</h2>
<jsp:useBean id="calc" class="T0918.Calculator"/> <!--jsp에서 java 사용하기  -->
<p>5의 3제곱?<%=calc.process(5) %>
</p>
</body>
</html>
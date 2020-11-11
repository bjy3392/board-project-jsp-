<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<jsp:useBean id="proc" class="T0922.TestProcess"/>
<p>2^5 = <%= proc.power(2,5) %> </p>
</body>
</html>
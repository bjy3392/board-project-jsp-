<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2_main.jsp</title>
	<style>
		body{
			margin:0 auto;
			padding:0px;
		}
		#content{
			width:100%;
			height:400px;
			background-color:black
		}
	</style>
</head>
<body>
	<%@ include file="test2_h.jsp"%>
	<div id="content">
	<h2>이곳은 본문영역입니다.</h2>
	</div>
	<%@ include file="test2_f.jsp"%>

</body>
</html>
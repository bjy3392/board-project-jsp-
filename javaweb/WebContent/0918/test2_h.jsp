<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test2_h.jsp(header)</title>
	<style>
	.menu{
		width:100;
		height:180px;
		text-align:center;
		background-color:#eee;
		
		}
	a{ text-decoration:none;}
	a:hover{
		text-decoration:underline;
		color:red;
	}	
	</style>
</head>
<body>
<div class="menu">
<h3>이곳은 헤더영역입니다.</h3>
	<a href="test2.jsp">홈으로 |</a>
	<a href="test2_board.jsp">게시판 |</a>
	<a href="test2_guest.jsp">방명록 |</a>
	<a href="test2_pds.jsp">자료실 |</a>
	<a href="test2_sitemap.jsp">사이트맵</a>
</div>
</body>
</html>
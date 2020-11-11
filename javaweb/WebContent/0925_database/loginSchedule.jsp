<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/memberCheck.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<style>
    table {
      border-collapse: collapse;
    }
    table, td {
      margin: 0 auto;
      padding : 10px;
      border: 1px solid gray;
    }
    h2 {
      text-align: center;
    }
    #content {
    	text-align: center;
    }
  </style>
</head>
<body>
<p><br/><p>
<div id="content">
	<h2>일정관리</h2>
	<table>
		<tr>
			<td colspan="4" align="center"><%=session.getAttribute("sname") %>님 로그인 중입니다.</td>
		</tr>
		<tr>
			<td>고유번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성명</td>
		</tr>
	</table>
	<p><a href="loginMain.jsp">회원리스트</a></p>
	<p><a href="logOut.jsp">로그아웃</a></p>
</div>
</body>
</html>
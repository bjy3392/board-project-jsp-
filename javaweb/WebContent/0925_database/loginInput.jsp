<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginInput</title>
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
  </style>
</head>
<body>
<p><br/></p>
<div id="content">
<form name="myform" method="post" action="loginInputOk.jsp">
<h2 >회원가입</h2>
<table>
	<tr>
		<td>아이디</td>
		<td><Input type="text" name="mid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><Input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td>성명</td>
		<td><Input type="text" name="name"></td>
	</tr>
	<tr>
		<td colspan=2 align="center">
		<Input type="submit" value="회원가입">
		<Input type="reset" value="다시쓰기">
		<Input type="button" value="돌아가기" onclick="location.href='login.jsp';"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>
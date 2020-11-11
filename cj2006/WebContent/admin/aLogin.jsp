<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>login.jsp</title>
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
<h2>로그인</h2>
<form method="post" action="/cj2006/ALogin">
  <table>
    <tr>
      <td>아이디</td>
      <td><input type="text" name="mid"/></td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td><input type="password" name="pwd"/></td>
    </tr>
    <tr>
      <td colspan=2 align="center">
        <input type="submit" value="로그인" /> &nbsp; &nbsp; 
        <input type="reset" value="취소" /> &nbsp; &nbsp; 
        <input type="button" value="돌아가기" onclick="location.href='/cj2006/guest/gList.jsp';"/>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
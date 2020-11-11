<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  Cookie[] cookies = request.getCookies();
  String mid = "";

  for(int i=0; i<cookies.length; i++) {
    String str = cookies[i].getName();
    if(str.equals("mid")) {
      mid = cookies[i].getValue();
      break;
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test3_Login.jsp</title>
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
<form method="post" action="t4_LoginOk.jsp">
  <table>
    <tr>
      <td>아이디</td>
      <td><input type="text" name="mid" value="<%=mid%>"/></td>
    </tr>
    <tr>
      <td>비밀번호</td>
      <td><input type="password" name="pwd"/></td>
    </tr>
    <tr>
      <td colspan=2 align="center">
        <input type="submit" value="로그인" /> &nbsp; &nbsp; 
        <input type="reset" value="취소" /> &nbsp; &nbsp; &nbsp;
        <input type="checkbox" name="midCheck" value=""/>아이디저장
      </td>
    </tr>
  </table>
</form>
</body>
</html>
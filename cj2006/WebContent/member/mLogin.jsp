<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ include file="../include/bs.jsp" %>
 <%@ include file="../include/nav.jsp" %>
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
<br/>
<h2>로그인</h2>
<form method="post" action="<%=request.getContextPath()%>/member/mLogin">
  <table>
    <tr>
      <td align="center">아이디</td>
      <td align="center"><input type="text" name="mid" autofocus required/></td>
    </tr>
    <tr>
      <td align="center">비밀번호</td>
      <td align="center"><input type="password" name="pwd" required/></td>
    </tr>
    <tr>
      <td colspan=2 align="center">
        <input type="submit" value=" 로그인 " /> 
        <input type="reset" value="다시작성" /> 
        <input type="button" value="회원가입" onclick="location.href='mInput.jsp';"/>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
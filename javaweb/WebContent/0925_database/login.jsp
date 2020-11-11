<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String smid = (String)session.getAttribute("smid");
	
	if(smid != null){
		out.println("<script>");
		out.println("location.href='loginMain.jsp'");
		out.println("</script>");
	}
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
<form method="post" action="loginOk.jsp">
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
        <input type="button" value="회원가입" onclick="location.href='loginInput.jsp';"/>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
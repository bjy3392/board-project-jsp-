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
<form action="/javaweb/m2">
  <table>
    <tr>
      <td>아이디</td>
      <td><input type="text" name="mid"/></td>
    </tr>
    <tr>
      <td colspan=2 align="center">
        <input type="submit" value="검색" /> &nbsp; &nbsp; 
        <input type="reset" value="취소" /> &nbsp; &nbsp; 
      </td>
    </tr>
  </table>
</form>
</body>
</html>
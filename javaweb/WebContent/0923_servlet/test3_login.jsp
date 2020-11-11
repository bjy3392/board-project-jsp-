<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	for(int i=0; i<cookies.length; i++){
		String str = cookies[i].getName();
			if(str.equals("mid")){
				mid =cookies[i].getValue();
				break;
			}		
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test3_login</title>
</head>
<body>
<h2>로그인</h2>
<form method="post" action="test3_loginOk.jsp">
	<p>아이디  <input type="text" name="mid" value="<%= mid%>"/></p>
	<p>비밀번호  <input type="password" name="pwd"></p>
	<p><input type="submit" value="로그인"/></p>
	<p><a href="test3_loginDel.jsp">쿠키의 아이디정보삭제</a></p>
</form>
</body>
</html>
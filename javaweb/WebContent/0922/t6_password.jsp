<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t6_password.jsp</title>
</head>
<body>
<h2>로그인(암호화)</h2>
<p>비밀번호는 숫자로 입력하세요.</p>
<form name="myform" method="post" action="t6_passwordOk.jsp">
	<p>아이디: <input type="text" name="mid"/></p>
	<p>비밀번호: <input type="password" name="pwd"/></p>
	<p>
		<input type="submit" value="로그인"/>
		<input type="reset" value="취소"/>
	</p>
</form>
</body>
</html>
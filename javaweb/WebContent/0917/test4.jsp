<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test4(전송방식:get)</title>
</head>
<body>
	<h2>로그인</h2>
	<form name="myform" method="get" action="test4Ok.jsp">
		<p>
			<label for="pwd">아이디: </label> <input type="text" name="mid" />
		</p>
		<p>
			<label for="pwdre">비밀번호: </label> <input type="password" name="pwd" />
		</p>
		<p>
			<input type="submit" value="전송" /> 
			<input type="reset" value="다시입력" />
		</p>
	</form>
</body>
</html>
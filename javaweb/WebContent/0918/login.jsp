<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<h2>로그인</h2>
<form name="myform" method="post" action="login_2.jsp">
  <p>이름 : <input type="text" name="name" autofocus /></p>
  <p>국어 : <input type="text" name="kor"  /></p>
  <p>수학 : <input type="text" name="math"  /></p>
  <p>영어 : <input type="text" name="eng"  /></p>
  <p>
    <input type="submit" value="전송" />
    <input type="reset" value="다시입력"/>
  </p>
</form>
</body>
</html>
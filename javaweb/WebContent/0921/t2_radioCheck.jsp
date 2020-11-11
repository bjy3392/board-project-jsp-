<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>radioCheck</title>
</head>
<body>
	<h2>라디오버튼값 전송</h2>
    <form name="myform" method="POST" action="t2_radioCheckOk.jsp">
        <p>성별 : <input type="radio" name="gender" value="여자" checked/>여자
                  <input type="radio" name="gender" value="남자"/>남자
        </p>
        <p>비밀번호: <input type="password" name="pwd"/> </p>
        <p><input type="submit" value="전송"/></p>
    </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_application_main.jsp</title>
</head>
<body>
<h2>application 연습(jsp파일 호출)</h2>
<p><a href="t1_application_save.jsp">application정보 저장</a>(처음 1번만 수행해주세요.)</p>
<p><a href="t1_application_get.jsp">application 정보 확인</a>(서로다른 브라우져에서도 값은 값을 유지합니다.)</p>
<p><a href="t1_application_delete.jsp">application 정보 삭제</a></p>
<hr/>
<h2>application 연습(selvlet파일 호출)</h2>
<p><a href="/javaweb/0924/applicationSave">application정보 저장</a>(처음 1번만 수행해주세요.)</p> <!-- 실제file과 이름이 같지 않다. '@'(어노테이션으로 접속하기때문에) -->
<p><a href="/javaweb/0924/applicationGet">application 정보 확인</a>(서로다른 브라우져에서도 값은 값을 유지합니다.)</p>
<p><a href="/javaweb/0924/applicationDelete">application 정보 삭제</a></p>
</body>
</html>
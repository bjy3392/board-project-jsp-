<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("mid");
	int pwd = Integer.parseInt(request.getParameter("pwd"));
	
	int encPwd, decPwd;
	int key = 0x1234AB;
	
	encPwd = pwd^key; //암호화된 코드(인코딩) --> DB에 저장될 암호코드
	 
	decPwd = encPwd^key; //복호화된 코드(디코딩) -->현재코드와 접속사용자의 pwd를 비교처리
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<h2>암호화된 비밀번호 확인하기</h2>
<p>처음입력한 pwd: <%=pwd %></p>
<p>암호화 시킨 pwd: <%=encPwd %></p>
<p>복호화 시킨 pwd: <%=decPwd %></p>
</body>
</html>
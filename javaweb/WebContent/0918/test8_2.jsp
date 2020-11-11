<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String mid =request.getParameter("mid");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test8.jsp</title>
</head><br/>
<body>
<!-- 클래스 연동 -->
<jsp:useBean id="vo" class="T0918.Test8Vo"/>
<!-- vo에 값저장 -->
<%
	vo.setName(name);
	vo.setAge(age+1);
	vo.setMid(mid);
	vo.setPwd(pwd);
%>
<!-- 저장된 vo의 값을 읽어온다. -->
<p>이름 : <%= vo.getName() %> </p>
<p>나이: <%= vo.getAge() %> </p>
<p>아이디: <%= vo.getMid() %></p>
<p>비밀번호: </p><%= vo.getPwd() %></p> 
</body>
</html>
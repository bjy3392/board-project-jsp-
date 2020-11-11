<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name ="홍길동";
	int age = 25;
	String mid ="hkd1234";
	String pwd ="1234";
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
<jsp:setProperty property="name" name="vo" value="<%=name %>"/>
<jsp:setProperty property="age" name="vo" value="<%=age+1 %>"/>
<jsp:setProperty property="mid" name="vo" value="<%=mid %>"/>
<jsp:setProperty property="pwd" name="vo" value="<%=pwd %>"/>
<!-- 저장된 vo의 값을 읽어온다. -->
<jsp:getProperty property="name" name="vo" /><br/>
<jsp:getProperty property="age" name="vo" /><br/>
<jsp:getProperty property="mid" name="vo" /><br/>
<jsp:getProperty property="pwd" name="vo" /><br/>
</body>
</html>
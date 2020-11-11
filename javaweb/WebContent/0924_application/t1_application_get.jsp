<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(application.getAttribute("visitCnt") != null){
		int visitCnt = (int)application.getAttribute("visitCnt") +1;
		application.setAttribute("visitCnt", visitCnt);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t1_application_get.jsp</title>
</head>
<body>
<h2>application에 저장된 정보확인</h2>
<p>관리자 아이디 : <%= application.getAttribute("admin") %></p>
<p>방문자수 : <%= application.getAttribute("visitCnt") %></p>
<hr/>
<p><a href="t1_application_main.jsp">돌아가기</a></p>
<p>모든 application의 정보 보기</p>
<%
	Enumeration names= application.getAttributeNames();
	while(names.hasMoreElements()){
		out.println("name: " + names.nextElement() +"</br>");		
	}
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid= request.getParameter("mid")== null ? "" :  request.getParameter("mid");
	String pwd= request.getParameter("pwd")== null ? "" :  request.getParameter("pwd");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test5Check.jsp</title>
</head>
<body>
<h2>이곳은 test5Check.jsp</h2>
<% if(mid.equals("admin") || pwd.equals("1234")){ 
	if(mid.equals("admin")){%>
		<jsp:forward page="test5Ok.jsp">
			<jsp:param value="<%=mid %>" name="mid"/>
		</jsp:forward>
	<%} else{%>
		<jsp:forward page="test5Ok.jsp">
			<jsp:param value="<%=pwd %>" name="pwd"/>
		</jsp:forward>
	<%} %>	
<%} else{%>
	<script type="text/javascript">
		alert("아이디와 비밀번호를 확인하세요.");
		history.back();
	</script>
<%} %>
</body>
</html>
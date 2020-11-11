<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid= request.getParameter("mid");
%>

<script>
	alert("<%=mid%> 님 로그아웃 되었습니다.");
	location.href="test3_login.jsp";
</script>
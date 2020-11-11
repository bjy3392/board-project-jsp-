<!-- t1_sessionDelete.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("smid");
%>

<jsp:forward page="t1_sessionMain.jsp"></jsp:forward>
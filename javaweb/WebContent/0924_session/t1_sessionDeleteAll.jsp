<!-- t1_sessionDeleteAll.jsp 모든 세션삭제-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>

<jsp:forward page="t1_sessionMain.jsp"></jsp:forward>
<!-- t1_sessionSave.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.setAttribute("smid", "admin");
	session.setAttribute("sage", 29);
	session.setAttribute("svisitCnt", 0);
	
	application.setAttribute("avisitCnt", 0);
	
%>

<jsp:forward page="t1_sessionMain.jsp"></jsp:forward>
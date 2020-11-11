<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int svisitCnt = (Integer)session.getAttribute("svisitCnt")+1;
	int avisitCnt = (Integer)application.getAttribute("avisitCnt") +1;
	
	session.setAttribute("svisitCnt", svisitCnt);
	application.setAttribute("avisitCnt", avisitCnt);
%>

<h2>세션확인</h2>
<p>세션방문자수 : <%= session.getAttribute("svisitCnt") %></p>
<p>웹방문자수 : <%= application.getAttribute("avisitCnt") %></p>
<p><a href="t1_sessionMain.jsp">돌아가기</a></p>

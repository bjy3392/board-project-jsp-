<!-- t1_sessionGet.jsp -->
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String smid = (String)session.getAttribute("smid");
	int sage =(Integer)session.getAttribute("sage");
	int svisitCnt = (Integer)session.getAttribute("svisitCnt") +1;
	session.setAttribute("svisitCnt", svisitCnt);
%>
<h2>세션확인</h2>
<p>세션아이디 : <%= smid %></p>
<p>세션나이 : <%= sage %></p>
<p>세션방문자수 : <%= session.getAttribute("svisitCnt") %></p>
<p><a href="t1_sessionMain.jsp">돌아가기</a></p>
<hr/>
<%
	Enumeration names = session.getAttributeNames();
	while(names.hasMoreElements()){
		out.println("session-->" + names.nextElement()+"<br/>");
	}
%>
<p>세션ID : <%=session.getId() %></p>
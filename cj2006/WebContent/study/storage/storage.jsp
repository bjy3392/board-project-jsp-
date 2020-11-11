<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ include file="../../include/bs.jsp" %>
 	<%@ include file="../../include/nav.jsp" %>
 	<%@ include file="../../include/sCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<p></p>
<h2>JSP저장소</h2>
<p>1. Page</p>
<p>2. Request</p>
<p>3. Session</p>
<p>4. Application</p>
<hr/>
<h2>Page 객체 사용예</h2>
<p>하나의 페이지 안에서만 통용되는 변수 선언시 사용</p>
<div>
	<p>page객체에 값 저장 :pageContext.setAttribute("변수명","값/변수")</p>
<%
	int atom = 100;
	pageContext.setAttribute("pageVar", "안녕 Page");
%>
	<p>페이지 흐름 계속~~~</p>
	<p>page객체에 값 호출: pageContext.getAttribute("변수명")</p>
	<p>page객체에 저장된 값: <font color="blue"><%=pageContext.getAttribute("pageVar") %></font></p>
	<p>atom변수에 저장된 값: <font color="red"><%=atom %></font></p>
</div>

<hr/><h2>Request 객체 사용예</h2>
<p>직렬형 자료의 전달시에 통용되는 변수로 사용</p>
<div>
	<p>request객체에 값 저장 :request.setAttribute("변수명","값/변수")</p>
	<p><a href="<%=request.getContextPath()%>/study/storage/StorageRequest?imsi=atom">서블릿 호출</a></p></div>
<hr/>
<p><br/></p>
</body>
</html>
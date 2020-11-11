<%@page import="cj2006.webmessage.WebMessageVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.webmessage.WebMessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	WebMessageDao dao = new WebMessageDao();

	ArrayList<WebMessageVo> vos = dao.awmList();
	
	request.setAttribute("vos", vos);
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script>
		function delCheck(){
			var ans = confirm("모든메세지를 삭제처리하겠습니까?")
			if(ans) location.href = "${contextPath}/awmDeleteAll";
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<div style="text-align:right"><a href="javascript:delCheck()"><h5>전부 삭제</ion-icon></h5></a></div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>보낸사람</th>
				<th>받은사람</th>
				<th>메세지제목</th>
				<th>받은날짜</th>
				<th>보낸날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${vos }">
			<tr>
				<td>${vo.idx }</td>
				<td>${vo.sendId }</td>
				<td>${vo.receiveId }</td>
				<td>${vo.title }</td>
				<td>${vo.receiveDate }</td>
				<td>${vo.sendDate }</td>
			</tr>	
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>
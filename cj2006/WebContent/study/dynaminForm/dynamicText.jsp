<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>dynamicText</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="dynamicTextOk.jsp">
		<table>
			<tr>
				<td><h4>설문 주제 등록</h4></td>
			</tr>
			<tr>
				<td><input type="text" name="title" style="width:400px;height:25px;"/></td>
			</tr>
			<tr>
			<td><hr/></td>
			</tr>
			
		</table>
		
		<table>
			<tr>
				<td>
					<input type="button" value="설문항목추가">
				</td>
			</tr>
		
		</table>
		
</form>		
</div>
</body>
</html>

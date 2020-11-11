<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/bs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>wmSearchId</title>
	<script>
		function receiveIdCheck(mid){
			opener.window.document.myform.receiveId.value = mid;
			opener.window.document.myform.content.focus();
			window.close();
		}
	</script>
</head>
<body>
<div class="container">
<p><br/></p>
	<p>메일을 보낼 아이디를 더블클릭해주세요.</p>
	<table class="table table-bordered">
	<thead>
      <tr>
        <th>이름</th>
        <th>ID</th>
      </tr>
    </thead>
    <tbody>
	<c:forEach var="vo" items="${vos }">
		<tr ondblclick="receiveIdCheck('${vo.mid }')">
			<td>
				${vo.name }
			</td>
			<td>
				${vo.mid }
			</td>
		</tr>		
	</c:forEach>
	</tbody>
	</table>	
</div>
</body>
</html>
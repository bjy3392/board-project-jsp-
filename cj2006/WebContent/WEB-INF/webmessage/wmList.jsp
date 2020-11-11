<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>wmList.jsp</title>
	<script>
		function delTrashCheck(){
			var res = confirm("휴지통을 비우시겠습니까?");
			if(res){
				location.href = "${contextPath}/wmDeleteOk.wm";
			}						
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<c:if test="${msw == 5 }">
		<div style="text-align:right"><a href="javascript:delTrashCheck()"><h5>휴지통 비우기<ion-icon name="trash-outline"></ion-icon></h5></a></div>
	</c:if>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>
					<c:if test="${msw==1 || msw==2 || msw==5 }">보낸사람</c:if>
					<c:if test="${msw==3 }">받는사람</c:if>
				</th>
				<th>Title</th>
				<th>Date</th>
				<c:if test="${msw==3 }"><th>수신유무</th></c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos }">
				<tr onClick="location.href='${contextPath}/webMessageList.wm?msw=7&idx=${vo.idx }&premsw=${msw }'">
					<td>
						<c:if test="${msw==1 || msw==2 || msw==5 }">${vo.sendId }</c:if>
						<c:if test="${msw==3 || msw==4 }">${vo.receiveId }</c:if>
					</td>
					<td>${vo.title }
					<c:if test="${vo.receiveSw  == 'n' }">
						<img src="<%=request.getContextPath() %>/images/new.gif"/>
					</c:if>
					</td>
					<td>
						<c:if test="${msw==1 || msw==2 || msw==5 }">${vo.sendDate }</c:if>
						<c:if test="${msw==3 || msw==4 }">${vo.receiveDate }</c:if>
					</td>
					<c:if test="${msw==3 }">
						<td>
							<c:if test="${vo.receiveSw == 'n' }">읽지 않음</c:if>
							<c:if test="${vo.receiveSw != 'n' }">읽음</c:if>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>
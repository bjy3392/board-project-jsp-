<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>webMessage.jsp</title>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script>
		
	</script>
	<style>
		a{
			text-decoration :none;
			color : #646464
		}
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<div class="row">
		<div class="col-sm-2">
			<h2>메세지관리</h2>(현재접속자:<font color="red">${smid }</font>)
			<p><br/></p>
			<div class="list-group  list-group-flush">
			   <a href="webMessageList.wm?msw=0" class="list-group-item list-group-item-action"> 메세지작성</a>
			   <a href="webMessageList.wm?msw=1" class="list-group-item list-group-item-action"> 받은메세지</a>
			   <a href="webMessageList.wm?msw=2" class="list-group-item list-group-item-action"> 새메세지&nbsp;&nbsp;&nbsp;<span class="badge badge-primary badge-pill">${cnt }</span></a> 
			   <a href="webMessageList.wm?msw=3" class="list-group-item list-group-item-action"> 보낸메세지</a>
			   <a href="webMessageList.wm?msw=5" class="list-group-item list-group-item-action"> 휴지통</a><a href=""></a>
  			</div>
		</div>
		<div class="col-sm-10">
			<p><br/></p>
			<c:if test="${msw==0 }">
				<h2>메세지작성</h2>
				<jsp:include page="wmInput.jsp" />
			</c:if>
			<c:if test="${msw==1 }">
				<h2>받은 메세지</h2>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${msw==2 }">
				<h2>새 메세지</h2>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${msw==3 }">
				<h2>보낸 메세지</h2>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${msw==5 }">
				<h2>휴지통</h2>
				<jsp:include page="wmList.jsp" />
			</c:if>
			<c:if test="${msw==7 }">
				<jsp:include page="wmContent.jsp" />
			</c:if>
		</div>
	</div>	
</div>
<p><br/></p>
<p><br/></p>
<p><br/></p>
</body>
</html>
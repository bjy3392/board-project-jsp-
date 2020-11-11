<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>wmContent.jsp</title>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script>
		function delCheck(){
			var res = confirm("현재 게시글을 삭제하시겠습니까?");
			if(res){
				location.href = "${contextPath}/wmDelete.wm?idx=${vo.idx}&premsw=${premsw }";
			}						
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<div class="input-group mb-3">
		<div class="input-group-prepend"><span class="input-group-text" >Title</span></div>
		<div class="form-control" >${vo.title }</div>
  	</div>
  	<div class="input-group mb-3">
		<div class="input-group-prepend"><span class="input-group-text" >From</span></div>
		<div class="form-control" >${vo.sendId }</div>		
  	</div>
  	<div class="input-group mb-3">
		<div class="input-group-prepend"><span class="input-group-text" >Date</span></div>
		<div class="form-control" >${vo.sendDate }</div>		
  	</div>
  	<div class="form-control" style="height:auto;">${fn:replace(vo.content,newLine,"<br/>")}</div>
  	<p><br/></p>
  	<c:if test="${premsw== 1 || premsw== 2 }">
  		<input class="btn btn-outline-secondary"type="button" value="답장하기" onclick="location.href='${contextPath}/webMessageList.wm?msw=0&sendId=${vo.sendId }'"/>
  	</c:if>
	<input class="btn btn-outline-secondary" type="button" value="삭제하기" onclick="delCheck()"/> 	
	<input class="btn btn-outline-secondary" type="button" value="돌아가기" onclick="location.href='${contextPath}/webMessageList.wm?msw=${premsw }'"/>
<br/>
</div>
</body>
</html>
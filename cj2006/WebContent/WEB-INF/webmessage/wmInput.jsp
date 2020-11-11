<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>wmInput.jsp</title>
	<script>
		function fCheck(){
			if(myform.receiveId.value == ""){
				alert("받는사람 아이디를 입력하세요.")
				myform.receiveId.focus();
			}	
			else if(myform.title.value == ""){
				alert("메세지 제목를 입력하세요.")
				myform.title.focus();
			}
			else if(myform.content.value == ""){
				alert("내용을 입력하세요.")
				myform.content.focus();
			}
		}
		
		function searchId(){
			var url = "wmSearchId.wm";
			window.open(url,"nwin","width=400px, height=600px");
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="<%=request.getContextPath()%>/wmInputOk.wm">
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text" >Title</span></div>
				<input type="text" class="form-control" placeholder="Title" name="title">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">To.&nbsp;</span></div>
				<input type="text" class="form-control" name="receiveId" value="${receiveId }" readonly>
				<input type="button" class="btn btn-outline-secondary" value="주소록검색" onclick=searchId()>
			</div>
			<div class="form-group">
				<label for="comment">메세지내용:</label>
				<textarea class="form-control" rows="5" name="content"></textarea>
			</div>
			<input type="submit" class="btn btn-outline-secondary" value="보내기" onclick="fCheck()" /> 
			<input type="reset"  class="btn btn-outline-secondary" value="다시쓰기" /> 
			<input type="hidden" name="sendId" value="${smid }"/>
		</form>
</div>
</body>
</html>
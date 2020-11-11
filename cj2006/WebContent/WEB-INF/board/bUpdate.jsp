<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bInput.jsp</title>
<script>
    function fCheck() {
    	if(myform.name.value=="") {
    		alert("글쓴이를 입력하세요");
    		myform.name.focus();
    	}
    	else if(myform.title.value=="") {
    		alert("글제목을 입력하세요");
    		myform.title.focus();
    	}
    	else if(myform.content.value=="") {
    		alert("글내용을 입력하세요");
    		myform.content.focus();
    	}
    	else if(myform.pwd.value=="") {
    		alert("비밀번호를 입력하세요");
    		myform.pwd.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
<style>
.board_input {
	width: 80%;
	margin: 0 auto;
}


</style>
</head>
<body>
	<p><br/></p>
	<div class="board_input">
		<form name="myform" method="post" action="<%=request.getContextPath()%>/bUpdatetOk.bo?idx=${vo.idx }&pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}">
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text" >Title</span></div>
				<input type="text" class="form-control" name="title" value="${vo.title }">
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">Name</span></div>
				<input type="text" class="form-control" name="name" value="${vo.name }" readonly>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">E-mail</span></div>
				<input type="text" class="form-control" name="email" value="${vo.email }" readonly >
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">Home page</span></div>
				<input type="text" class="form-control" name="homepage" value="${vo.homepage }" readonly>						
			</div>

			<div class="form-group">
				<label for="comment">Content:</label>
				<textarea class="form-control" rows="5" name="content" >${vo.content }</textarea>
			</div>
			<div class="input-group mb-3" >
				<div class="input-group-prepend"><span class="input-group-text">비밀번호</span></div>
				<input type="password" class="form-control" name="pwd" value="${vo.pwd }"/>
			</div>
			
			<input type="button" class="btn btn-outline-secondary" value="수정하기" onclick="fCheck()" /> 
			<input type="button"  class="btn btn-outline-secondary" value="돌아가기" onclick="location.href='<%=request.getContextPath()%>/bContent.bo?idx=${vo.idx }&pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}';" />
			<input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
		</form>
	</div>
	<p><br/></p>
	<p><br/></p>
</body>
</html>
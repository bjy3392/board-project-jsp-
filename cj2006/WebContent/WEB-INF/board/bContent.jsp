<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%> 
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script>
		function delContCheck(idx,vopwd){
			var pwd= document.getElementById('pwd').value;
			if(vopwd != pwd){
				alert('비밀번호를 확인해주세요.')
			}
			else{
				var res = confirm("현재 게시글을 삭제하시겠습니까?");
				if(res){
					location.href = "<%=request.getContextPath()%>/bDelete.bo?idx="+idx+"&pwd="+pwd+"&pag=${pag}&pageSize=${pageSize}&search=${search}&searchStr=${searchStr}";
				}
			}							
		}
		
		function updCheck(idx,vopwd){
			var pwd= document.getElementById('pwd').value;
			if(vopwd != pwd){
				alert('비밀번호를 확인해주세요.')
			}
			else{
				var res = confirm("현재 게시글을 수정하시겠습니까?");
				if(res){
					location.href = "<%=request.getContextPath()%>/bUpdate.bo?idx="+idx+"&pwd="+pwd+"&pag=${pag}&pageSize=${pageSize}&search=${search}&searchStr=${searchStr}";
				}
			}							
		}
		
		function replyInput(board_idx,nickname) {
			var content = contForm.content.value;
			var hostip = contForm.hostip.value;
			var nickname = contForm.nickname.value;
			
			if(content == ""){
				alert("댓글을 입력하세요");
				contForm.content.focus();
				return false;
			}
			
	    	var query = {bidx : board_idx, nick :nickname, hostip :hostip, cont : content,};
	    	
	    	// aJax를 이용한 댓글 입력처리
	    	$.ajax({
	    		url : "${contextPath}/bReplyInput",
	    		type : "get",
	    		data : query,
	    		success : function(data) {
	    			if(data == '1') {
	    				location.reload();
	    			}
	    			else {
	    				alert("댓글이 등록되지 않았습니다.");
	    			}
	    		},
	    		error : function(data) {
	    			alert("error : 댓글이 등록되지 않았습니다.");
	    		}
	    	});
		}
		
		function replyDel(contIdx) {
	    	var query = {idx : contIdx};
	    	var ans = confirm("선택하신 댓글을 삭제 하시겠습니까?");
	    	if(!ans) return false;
	    	
	    	// aJax를 이용한 댓글 삭제처리
	    	$.ajax({
	    		url : "${contextPath}/bReplyDel",
	    		type : "get",
	    		data : query,
	    		success : function(data) {
	    			if(data == '1') {
	    				location.reload();
	    			}
	    			else {
	    				alert("댓글이 삭제되지 않았습니다.");
	    			}
	    		},
	    		error : function(data) {
	    			alert("댓글이 삭제되지 않았습니다.");
	    		}
	    	});
		}
	</script>
</head>
<body>
<p><br/><p>
<div class="container">
  <div class="input-group mb-3">
	<div class="input-group-prepend"><span class="input-group-text" >Title</span></div>
	<div class="form-control" >${vo.title }</div>
  </div>
  <div class="input-group mb-3">
	<div class="input-group-prepend"><span class="input-group-text" >Name</span></div>
	<div class="form-control" >${vo.name }</div>
	<div class="input-group-prepend"><span class="input-group-text" >Date</span></div>
	<div class="form-control" >${vo.wdate }</div>
	<div class="input-group-prepend"><span class="input-group-text" >E-mail</span></div>
	<div class="form-control" >${vo.email }</div>
  </div>
  <div class="input-group mb-3">
	<div class="input-group-prepend"><span class="input-group-text" >HomePage</span></div>
	<div class="form-control" >${vo.homepage }</div>
	<div class="input-group-prepend"><span class="input-group-text" >Hits</span></div>
	<div class="form-control" >${vo.readnum }</div>
	<div class="input-group-prepend"><span class="input-group-text" >HostIP</span></div>
	<div class="form-control" >${vo.hostip }</div>
  </div>
  <div class="form-control" style="height:auto;">${fn:replace(vo.content,newLine,"<br/>")}</div>
  <br/>
  <div align="center" class="input-group mb-3">
  <c:if test="${vo.name == snickname || snickname == '관리자'}">
         <div class="input-group-prepend"><span class="input-group-text" >Password</span></div>
		 <input type="password" class="form-control" name="pwd" id="pwd">
		  <input class="btn btn-outline-secondary" type="button" value="수정" onclick="updCheck(${vo.idx},'${vo.pwd}')"/>
          <input class="btn btn-outline-secondary"type="button" value="삭제" onclick="delContCheck(${vo.idx},'${vo.pwd}')"/>
  </c:if>
  </div>
  <div align="center"> 
  <c:if test="${vo.preIdx !=0 }">
  	<input class="btn btn-outline-secondary" type="button" value="이전글" onclick="location.href='<%=request.getContextPath()%>/bContent.bo?idx=${vo.preIdx }&pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}';"/>
  </c:if>
  <c:if test="${vo.preIdx ==0 }">
  	<input class="btn btn-outline-secondary" type="button" value="이전글" disabled/>
  </c:if>
   <input class="btn btn-outline-secondary" type="button" value="목록" onclick="location.href='<%=request.getContextPath()%>/bList.bo?pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}';"/>
  <c:if test="${vo.nextIdx !=0 }">
  	<input class="btn btn-outline-secondary" type="button" value="다음글" onclick="location.href='<%=request.getContextPath()%>/bContent.bo?idx=${vo.nextIdx }&pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}';"/>
  </c:if>
  <c:if test="${vo.nextIdx ==0 }">
  	<input class="btn btn-outline-secondary" type="button" value="다음글" disabled/>
  </c:if>   
  </div> 
</div>
<p><br/></p>
<!-- 댓글 보기 -->
<div class="container">
<table class="table">
    <thead>
      <tr>
        <th colspan=6>전체댓글</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="cvo" items="${cvos }">
      <tr>
        <td style="width:200px">${cvo.nickname }&nbsp;&nbsp;${cvo.hostip }</td>
        <td style="width:700px">${fn:replace(cvo.content,newLine,"<br/>")}</td>
        <td>${fn:substring(cvo.wdate ,0,19)}
        	<c:if test="${snickname == cvo.nickname }">
        		<%-- <a href="${contextPath}/bReplyDel.bo?idx=${cvo.idx}"><ion-icon name="close-outline"></ion-icon></a> --%>
        		<a href="javascript:replyDel(${cvo.idx })"><ion-icon name="trash-outline"></ion-icon></a>
        	</c:if>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<!-- 댓글 입력 -->
<div class="container">
<form name="contForm" method="post" action="${contextPath }/bContInput.bo">
	<div align="center" class="input-group mb-3">
         <div class="input-group-prepend"><span class="input-group-text" >comment</span></div>
		 <textarea class="form-control" rows="2" name="content"></textarea>
		<!--  <input type="button" value="등록" class="btn btn-outline-secondary" onclick="reCheck()"/> -->
		 <input type="button" value="등록" class="btn btn-outline-secondary" onclick="replyInput(${vo.idx })"/>
  	</div>
	<input type="hidden" name="nickname" value="${snickname }"/>
	<input type="hidden" name="board_idx" value="${vo.idx }"/>
	<input type="hidden" name="hostip" value="<%=request.getRemoteAddr()%>"/>
</form>
</div>
<p><br/></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pContent.jsp</title>
  <%@ include file="../../include/bs.jsp" %>
  <script>
  	function pwdCheck(){
  		var pwd = myform.pwd.value;
  		if(pwd == ""){
  			alert("비밀번호를 입력하세요.")
  			myform.pwd.focus();
  		}
  		else {
  			myform.submit();
  		}
  		
  	}
  </script>
</head>
<body>
<p><br/></p>
<!-- The Modal -->
<!-- <div class="modal fade" id="myModal"> -->
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">자료파일삭제</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <p>삭제할 파일의 비밀번호를 입력하세요</p>
          <hr/>
          <form name="myform" method="post" action="${contextPath }/pDelete.pd">
          	<input type="password" name="pwd" id="pwd" class="form-control" autofocus/>
          	<button type="button" onclick="pwdCheck()" class="btn btn-outline-secondary">전송</button>
          	<input type="hidden" name="idx" value="${param.idx }"/>
          	<input type="hidden" name="frname" value="${param.rfname }"/>
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.close()">Close</button>
        </div>
        
      </div>
    </div>
<!-- </div> -->
<p><br/></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>upLoadTest.jsp</title>
	<script>
		function fCheck(){
			var fname = myform.fname.value;
			var ext = fname.substring(fname.length - 3);
			var uExt = ext.toUpperCase();
			var maxSize = 1024*1024*10;
			if(fname == ""){
				alert("업로드할 파일을 선택하세요!!");
				return false;
			}
			var fileSize = document.getElementById("fname").files[0].size;
			
			if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
				alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.")
			}
			else if(fileSize > maxSize){
				alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.")
			}
			else if(fname.indexOf(" ") != -1){
				alert("파일명에는 공백을 포함 할 수 없습니다.")
			}
			else {
				alert("파일을 전송합니다.")
			}
		}
	</script>
</head>
<body>
<div class="container">
    <h2>파일 업로드 연습</h2>
    <br/>
    <form name="myform" method="post" action="${contextPath }/ptUpLoadOk1.pt" enctype="multipart/form-data">
    <div class="form-group" >
      	<input type="file" class="form-control-file border" id="fname" name="fname">
      	<button type="submit" class="btn btn-outline-secondary" onclick="fCheck()">Upload</button>
    </div>
  	<br/><br/>
  	<p><a href="${contextPath}/ptDownLoad1.pt"  class="btn btn-outline-secondary">Download</a></p>
  </form>
</div>
</body>
</html>
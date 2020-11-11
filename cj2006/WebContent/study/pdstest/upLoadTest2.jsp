<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>upLoadTest2.jsp</title>
	<script>
		function fCheck(){
			var fname = myform.fname1.value;
			var ext = fname.substring(fname.length - 3); 	//확장자 발췌
			var uExt = ext.toUpperCase();					
			var maxSize = 1024*1024*10;
			
			//첫번째 파일
			if(fname != ""){
				
				var fileSize = document.getElementById("fname1").files[0].size;
				
				if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
					alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.")
				}
				else if(fileSize > maxSize){
					alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.")
				}
				else if(fname.indexOf(" ") != -1){
					alert("파일명에는 공백을 포함 할 수 없습니다.")
				}
			}
			
			//두번째 파일
			var fname = myform.fname2.value;
			if(fname != ""){
				var fileSize = document.getElementById("fname2").files[0].size;
				ext = fname.substring(fname.length - 3); 	//확장자 발췌
				uExt = ext.toUpperCase();					
				maxSize = 1024*1024*10;
				
				if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
					alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.")
				}
				else if(fileSize > maxSize){
					alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.")
				}
				else if(fname.indexOf(" ") != -1){
					alert("파일명에는 공백을 포함 할 수 없습니다.")
				}
			}
			
			var fname = myform.fname3.value;
			if(fname != ""){
				var fileSize = document.getElementById("fname3").files[0].size;
				ext = fname.substring(fname.length - 3); 	//확장자 발췌
				uExt = ext.toUpperCase();					
				maxSize = 1024*1024*10;
				
				if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
					alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.")
				}
				else if(fileSize > maxSize){
					alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.")
				}
				else if(fname.indexOf(" ") != -1){
					alert("파일명에는 공백을 포함 할 수 없습니다.")
				}
			}
			
			myform.submit()
		}
	</script>
</head>
<body>
<div class="container">
    <h2>파일 업로드 연습</h2>
    <br/>
    <form name="myform" method="post" action="${contextPath }/ptUpLoadOk2.pt" enctype="multipart/form-data">
    <div class="form-group" >
      	<input type="file" class="form-control-file border" id="fname1" name="fname1">
      	<input type="file" class="form-control-file border" id="fname2" name="fname2">
      	<input type="file" class="form-control-file border" id="fname3" name="fname3">
      	<button type="submit" class="btn btn-outline-secondary" onclick="fCheck()">Upload</button>
    </div>
  	<br/><br/>
  	<p><a href="${contextPath}/ptDownLoad1.pt"  class="btn btn-outline-secondary">Download</a></p>
  </form>
</div>
</body>
</html>
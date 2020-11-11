<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script>
		function fCheck(){
			var fname = myform.fname.value; //
			var ext = fname.substring(fname.length - 3); //확장자 발췌
 			var uExt = ext.toUpperCase(); //확장자를 대문자로
			var maxSize = 1024*1024*10; //최대 10MByte
			
			var title = myform.title.value;  //파일의 제목
			var pwd = myform.pwd.value;  //파일의 제목
			
			if(fname == ""){
				alert("업로드할 파일을 선택하세요!!");
				return false;
			}
			else if(title == ""){
				alert("자료파일의 제목을 입력하세요!!");
				myform.title.focus();
				return false;
			}
			else if(pwd == ""){
				alert("비밀번호를 입력하세요!!");
				myform.pwd.focus();
				return false;
			}
			var fileSize = document.getElementById("fname").files[0].size;
			myform.fsize.value = fileSize;
			
			if(uExt != "ZIP" && uExt !="JPG" && uExt !="JPG" && uExt !="GIF" && uExt !="PNG"){
				alert("업로드 가능한 파일은 zip/jpg/gif/png 입니다.");
			}
			else if(fileSize > maxSize){
				alert("업로드 가능한 파일의 최대 용량은 10MByte입니다.");
			}
			else if(fname.indexOf(" ") != -1){
				alert("파일명에는 공백을 포함 할 수 없습니다.");
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="${contextPath }/pInputOk.pd" enctype="multipart/form-data">
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text" >Title</span></div>
				<input type="text" class="form-control" placeholder="Title" name="title">
				
				<div class="input-group-prepend"><span class="input-group-text" >Class</span></div>
				<select name="part" size=1 class="form-control">
	    			<option value="영화" selected>영화</option>
	    			<option value="여행">여행</option>
	    			<option value="도서">도서</option>
				</select>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend"><span class="input-group-text">Name</span></div>
				<input type="text" class="form-control" value="${snickname}" name="nickname">
			</div>
			<div class="custom-file mb-3">
    			<input type="file" id="fname" name="fname" accept=".zip,.jpg,.gif,.png,.jpeg">
    		</div>
			<div class="form-group">
				<label for="comment">Content:</label>
				<textarea class="form-control" rows="5" name="content"></textarea>
			</div>
			<div class="input-group mb-3">
				<div class="custom-control custom-radio custom-control-inline">
	      			<input type="radio" class="custom-control-input" id="customRadio1" name="opensw" value="공개" checked>
	      			<label class="custom-control-label" for="customRadio1" >공개</label>
	    		</div>
			    <div class="custom-control custom-radio custom-control-inline">
			      	<input type="radio" class="custom-control-input" id="customRadio2" name="opensw" value="비공개">
			      	<label class="custom-control-label" for="customRadio2">비공개</label>
			    </div>
		    </div>
			<div class="input-group mb-3" >
				<div class="input-group-prepend"><span class="input-group-text">비밀번호</span></div>
				<input type="password" class="form-control" name="pwd" />
			</div>
			<input type="button" class="btn btn-outline-secondary" value="자료올리기" onclick="fCheck()" /> 
			<input type="reset"  class="btn btn-outline-secondary" value="다시쓰기" /> 
			<input type="button"  class="btn btn-outline-secondary" value="돌아가기" onclick="location.href='${contextPath }/pList.pd';" />
			
			<input type="hidden" name="fsize" />
			
		</form>
	</div>
	<p><br/></p>
	<p><br/></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>title</title>
	<script>
		$(function(){
			$("#btnSubmit").click(function(){
				if($("#hakbun").val() == ""){
					alert("학번을 입력하세요");배지영
					$("#hakbun").focus();
				}
				else{
					myform.submit();
				}
				
			});
			
		});
	</script>
</head>
<body>
	<h2>성적등록</h2>
	<form name="myform" method="post" action="t1_sungjukOk.jsp">
		<p><label for="hakbun">학번 :</label> <input type="text" name="hakbun" id="hakbun"/></p>
		<p><label for="name">성명 :</label> <input type="text" name="name" id="name"/></p>
		<p><label for="kor">국어 :</label> <input type="text" name="kor" id="kor"/></p>
		<p><label for="eng">영어 :</label> <input type="text" name="eng" id="eng"/></p>
		<p><label for="mat">수학 :</label> <input type="text" name="mat" id="mat"/></p>
		<p>
			<input type="button" value="전송" id="btnSubmit"/>
			<input type="reset" value="다시입력"/>
		</p>
	</form>
	
</body>
</html>
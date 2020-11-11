<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전화번호 체크</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("#btnSubmit").click(function(){
    		if($("#tel1").val() == ""){
    			alert("지역을 선택해주세요.")
    		}
    		else if($("#tel2").val() == ""){
    			alert("번호를 입력해주세요.")
    			$("#tel2").focus();
    		}
    		else if($("#tel3").val() == ""){
    			alert("번호를 입력해주세요.")
    			$("#tel3").focus();
    		}
    		else{
    			$("form").submit();
    		}
    	});
    	
    	$("input:text[numberOnly]").on("keyup",function(){
    		$(this).val($(this).val().replace(/[^0-9]/g,""));
    	});
    	
    });
    </script>
</head>
<body>
<form name="myform" method="post" action="t6_TelCheckOk.jsp">
<p>
	<h2>전화번호 체크</h2>
	<select name="tel1" id="tel1" size=1>
		<option value="">선택</option>
		<option value="서울">서울</option>
		<option value="청주">청주</option>
		<option value="제주">제주</option>
		<option value="대전">대전</option>
	</select>
	<input type="text" name="tel2" id="tel2" size="4" maxlength="4" numberOnly/>
	<input type="text" name="tel3" id="tel3" size="4" maxlength="4" numberOnly/>
</p>
<p> 
	<input type="button" value="전송" id="btnSubmit"/>
	<input type="reset" value="취소" />
</p>		
</form>	
</body>
</html>
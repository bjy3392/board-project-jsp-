<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script type="text/javascript">
		function fCheck(){
			var sports = myform.sports.value;
			var orthersports = myform.orthersports.value;
			if(sports == ""){
				alert("좋아하는 운동을 선택하세여.");
			}
			else if(sports == "기타" && orthersports==""){
				alert("기타항목을 작성해주세요.");
				myform.orthersports.focus();
			}
			else{
				myform.submit();
			}
		}
	</script>
</head>
<body>
	<form name="myform" method="post" action="t4_comboCheckOk.jsp">
		<h2>콤보박스와 리스트박스 체크</h2>
		<p>좋아하는 운동은?
			<select name="sports" size=1>
				<option value="">선택	</option>
				<option value="축구">축구</option>
				<option value="야구">야구</option>
				<option value="배구">배구</option>
				<option value="농구">농구</option>
				<option value="족구">족구</option>
				<option value="탁구">탁구</option>
				<option value="기타">기타</option>
			</select>
		기타 : <input type="text" name="orthersports"/> 
		</p>
       		 <p><input type="button" value="전송" onclick="fCheck()"/>
            <input type="reset" value="취소"/></p>
		
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test5.jsp</title>
<script>
	function fCheck(){
		var mid = document.myform.mid.value;
		var pwd = document.myform.pwd.value;
		if(mid == ""){
			alert("아이디를 입력하세요.");
			myform.mid.focus();
		}
		else if(pwd == ""){
			alert("비밀번호를 입력하세요.");
			myform.mid.focus();
		}
		else{
			myform.submit();
		}
	}
</script>
</head>
<body>
	<h2>로그인</h2>
	<form name="myform" method="post" action="test5Check2.jsp">
		<p>
			<label for="mid">아이디: </label> <input type="text" name="mid" autofocus placeholder="아이디를 입력하세요."/>
		</p>
		<p>
			<label for="pwd">비밀번호: </label> <input type="password" name="pwd" />
		</p>
		<p>
			<input type="button" value="전송" onclick="fCheck()" /> 
			<input type="reset" value="다시입력" />
		</p>
	</form>
</body>
</html>
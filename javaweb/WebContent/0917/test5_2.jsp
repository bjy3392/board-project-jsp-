<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test5_2.jsp(전송방식:post방식)</title>
  <script>
    function fCheck() {
    	var mid = document.myform.mid.value;
    	var pwd = document.myform.pwd.value;
    	if(mid == "") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else if(pwd == "") {
    		alert("비밀번호를 입력하세요!");
        myform.pwd.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
</head>
<body>
<h2>로그인</h2>
<form name="myform" method="post" action="test5_2Ok.jsp">
  <p>아이디 : <input type="text" name="mid" autofocus placeholder="아이디를 입력하세요"/></p>
  <p>비밀번호 : <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"/></p>
  <p>
    <input type="button" value="전송" onclick="fCheck()"/>
    <input type="reset" value="다시입력"/>
  </p>
</form>
</body>
</html>
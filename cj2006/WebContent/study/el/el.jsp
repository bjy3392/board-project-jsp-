<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>el.jsp</title>
</head>
<body>
<h2>EL(Expression Language)</h2>
<div>
	<pre>
-용도 : 사용자가 값(객체/변수)을 전송 후 담을 (저장할) 용도로 사용한다.
-표기법 : \${변수/값/수식}
	</pre>
</div>
<div>
	<%
		String atom="seoul";
		int su1 = 100,  su2 = 200;
	%>
atom = <%=atom %><br/>
su1 = <%=su1 %><br/>
su2 = <%=su2 %>
<hr/>
- EL 표기범 <br/>
atom = ${param.atom}<br/>
su1= ${su1 }<br/>
su2 = ${10==11}	
<hr/>
<p>${(1>2)?1:2}</p>
<p>${"mbc"}</p>
</div>
<div>
	<form name="myform" method="post" action="el2.jsp">
		<p>아이디: <input type="text" name="mid"/></p>
		<p>비밀번호: <input type="password" name="pwd"/></p>
		<p>성명: <input type="text" name="name"/></p>
		<p>나이: <input type="number" name="age"/></p>
		<p><input type="submit" value="전송"/></p>
		<p><input type="hidden" name="atom" value="1234"/></p>
	</form>
</div>
</body>
</html>
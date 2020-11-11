<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	for(int i=0; i<cookies.length; i++){
			String str = cookies[i].getName();
				if(str.equals("mid")){
					mid = cookies[i].getValue();
					break;
				}		
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test3_loginMember</title>
</head>
<body>
<h2>회원관리화면</h2>
<%=mid %> 님 로그인 중입니다.

<p>
<a href="test3_loginOut.jsp?mid=<%=mid%>">로그아웃</a></p>
</p>

</body>
</html>
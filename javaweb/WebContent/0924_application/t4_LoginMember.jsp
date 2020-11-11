<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	String midCheck = request.getParameter("midCheck");
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
	<title>t4_LoginMember</title>
</head>
<body>
<h2>회원관리화면</h2>
<%=mid %> 님 로그인 중입니다.

<p>
<a href="t4_LoginOut.jsp?mid=<%=mid%>&midCheck=<%=midCheck%>">로그아웃</a></p>
</p>

</body>
</html>
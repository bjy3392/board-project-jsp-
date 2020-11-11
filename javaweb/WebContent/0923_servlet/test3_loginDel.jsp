<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid ="";
	for(int i=0; i<cookies.length; i++){
		String str = cookies[i].getName();
			if(str.equals("mid")){
				mid = cookies[i].getValue();
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				break;
			}		
	}
%>

<script>
	alert("<%=mid%> 님 쿠키삭제");
	location.href='test3_login.jsp';
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid= request.getParameter("mid");
	String midCheck = request.getParameter("midCheck");
	if(midCheck.equals("delete")){
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			String str = cookies[i].getName();
				if(str.equals("mid")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
					break;
				}		
		}
	}
	
%>

<script>
	alert("<%=mid%> 님 로그아웃 되었습니다.");
	location.href="t4_Login.jsp";
</script>
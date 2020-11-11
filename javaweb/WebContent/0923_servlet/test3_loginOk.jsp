<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	
	System.out.println("로그인화면");

	if(mid.equals("admin") && pwd.equals("1234")){
		Cookie cookie = new Cookie("mid",mid);  //쿠키생성
		cookie.setMaxAge(60*60);  //쿠키만료시간
		response.addCookie(cookie);  //쿠키저장
		out.println("<script>");
		out.println("location.href='test3_loginMember.jsp';");
		out.println("</script>");
	}
	else{
		
%>

<script type="text/javascript">
	alert("로그인 실패")  
	history.back();
</script>

<%}%>
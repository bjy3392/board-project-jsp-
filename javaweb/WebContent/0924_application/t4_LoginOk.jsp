<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String midCheck = request.getParameter("midCheck")==null ? "delete" : "save";
	
	

	if(mid.equals("admin") && pwd.equals("1234")){
		Cookie cookie = new Cookie("mid",mid);  //쿠키생성
		cookie.setMaxAge(60*60);  //쿠키만료시간
		response.addCookie(cookie);  //쿠키저장
%>
		<script>
		location.href='t4_LoginMember.jsp?midCheck=<%=midCheck%>';
		</script>
<%		
	}
	else{
		
%>

<script type="text/javascript">
	alert("로그인 실패")  
	history.back();
</script>

<%}%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	application.removeAttribute("admin");
	application.removeAttribute("visitCnt");
%>

<script>
	alert("application 변수가 삭제되었습니다.");
	history.back();
</script>
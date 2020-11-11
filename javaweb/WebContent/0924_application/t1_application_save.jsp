<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	application.setAttribute("admin", "atom"); //관리자의 ID를 'atom'으로 저장
	application.setAttribute("visitCnt", 0);  //방문카운트, 초기값 0으로 시작
%>
<script>
	alert("application 변수가 저장되었습니다.");
	history.back();
</script>
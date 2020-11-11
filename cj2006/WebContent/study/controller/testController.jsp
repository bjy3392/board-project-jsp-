<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>testController.jsp</title>
</head>
<body>
<h2>이곳은 컨트롤러 테스트페이지 입니다.</h2>
<p>아래메뉴를 클릭하세요</p>
<p><a href="<%=request.getContextPath()%>/mInput.do">회원가입</a></p>
<p><a href="http://localhost:9090/cj2006/mSearch.do">회원조회</a></p>
<p><a href="http://localhost:9090<%=request.getContextPath()%>/mUpdate.do">회원정보수정</a></p>
<p><a href="mDelete.do">회원탈퇴</a></p>
<p><a href="mBack.do">돌아가기</a></p>
</body>
</html>
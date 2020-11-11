<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>testController.jsp</title>
	<script>
		function studyDelCheck(mid){
			var ans = confirm("정말탈퇴하시겠습니까?");
			if(ans){
				location.href ="<%=request.getContextPath()%>/memberDelete.do?mid="+mid;
			}
		}
	</script>
</head>
<body>
<h2>Member 테스트페이지 입니다.</h2>
<p>아래메뉴를 클릭하세요</p>
<p><a href="<%=request.getContextPath()%>/memberList.do">회원리스트</a></p>
<p><a href="<%=request.getContextPath()%>/memberSearch.do">회원개별조회</a></p>
<p><a href="<%=request.getContextPath()%>/memberUpdate.do">회원정보수정</a></p>
<p><a href="javascript:studyDelCheck('${smid}')">회원탈퇴</a></p>
<p><a href="mBack.do">돌아가기</a></p>
</body>
</html>
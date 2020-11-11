<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script>
		function fCheck(){
			if(myform.title.value == ""){
				alert("일정 제목을 입력하세요!");
				myform.title.focus();
			}
			else if(myform.content.value == ""){
				alert("상세내역을 입력하세요!");
				myform.title.focus();
			}
			else{
				myform.submit();
			}		
		}
		
		function scheduleDel(){
			var ans = confirm("현재 일정을 삭제하시겠습니까?")
			if(ans) location.href = "${contextPath}/scDelete.sc?mid=${mid}&ymd=${ymd}"
		}
	</script>
	<style>
		
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>일 정 관 리</h2>
	<form name="myform" method="post" action="${contextPath }/scContentOk.sc">
		<table>
			<tr>
				<th>일정날짜</th>
				<td >${ymd }</td>
			</tr>	
			<tr>
				<th>분류</th>
				<td>
					<select name="memory">
						<option value="모임" ${vo.memory=="모임" ? "selected":"" }>모임</option>
						<option value="업무" ${vo.memory=="업무" ? "selected":"" }>업무</option>
						<option value="학습" ${vo.memory=="학습" ? "selected":"" }>학습</option>
						<option value="여행" ${vo.memory=="여행" ? "selected":"" }>여행</option>
						<option value="기타" ${vo.memory=="기타" ? "selected":"" }>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>일정제목</th>
				<td><input type="text" name="title" size="50" value="${vo.title }"/></td>
			</tr>
			<tr>
				<th>세부사항</th>
				<td><textarea rows="8" cols="50" name="content">${vo.content }</textarea></td>
			</tr>
			<tr>
				<td colspan=2 style="text-align:center" >
					<input type="button" value="일정올리기" onclick="fCheck()"/>
					<input type="reset" value="다시쓰기" />
					<c:if test="${!empty vo.title }">
						<input type="button" value="삭제" onclick="scheduleDel()"/>				
					</c:if>
					<input type="button" value="돌아가기" onclick="history.back()"/>
				</td>			
			</tr>
		</table>
		<input type="hidden" name="mid" value="${mid }"/>
		<input type="hidden" name="ymd" value="${ymd }"/>
	</form>
</div>
</body>
</html>
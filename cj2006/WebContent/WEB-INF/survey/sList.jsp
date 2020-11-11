<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sList.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<script>
		function sdateCheck(){
			var sdate = dateForm.sdate.value;
			if(sdate == ""){
				alert("과정 시작일을 선택하세요.")
			}
			else{
				location.href = "sList.su?sdate="+sdate
			}
		}
	</script>
</head>

<body>
<p><br/></p>
<div class="container">
	<h2>설문지 (${fn:substring(selectdate,0,10) })</h2>
	<div><p>안녕하세요. 설문에 응답해주세요. 오류 발견시 알려주세요. <br/> 게시판글과 닉네님이 연동되어 있어, 닉네임 변경시 기존글의 수정이 불가합니다.</p></div>
	<div align = "right">
		<c:if test="${slevel == '관리자' }">
			<input type="button" value="설문지등록" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/sInput.su'"/>
		</c:if>
		<form class="form-inline" name="dateForm" method="get" >
			<select name="sdate" class="custom-select mb-3" onchange="sdateCheck()">
				<option value="선택" ${sdate=='' ? 'selected' :'' }>선택</option>
				<c:forEach	var="sdate" items="${sdateArr }">
    				<option value="${sdate }"  ${sdate==selectdate ? 'selected' :'' } >${fn:substring(sdate,0,10) }</option>					
				</c:forEach>
    		</select> &nbsp;&nbsp;
		</form>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>과정명</th>
				<th>과목명</th>
				<th>능력단위명</th>
				<th>평가일시</th>
				<th>설문참여</th>
				<th>참여자수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos }">
				<tr >
					<td>${vo.idx }</td>
					<td>${vo.kwajung }</td>
					<td>${vo.kwamok }</td>
					<td><a href="${contextPath}/sContent.su?idx=${vo.idx}">${vo.danwi }</a></td>
					<td>${vo.wdate }</td>
					<td>
						<button type="button" class="btn btn-default" onClick="location.href='${contextPath}/sAnswerInput.su?idx=${vo.idx }'"><ion-icon name="newspaper-outline"></ion-icon></button>	
					</td>
					<td>
						<c:if test="${vo.answerCnt ==0 }">${vo.answerCnt }</c:if>
						<c:if test="${vo.answerCnt != 0 }">
							<c:if test="${slevel =='관리자' }"><a href="${contextPath }/sAList.su?idx=${vo.idx}">${vo.answerCnt }</a></c:if>
							<c:if test="${slevel !='관리자' }"><a href="${contextPath }/sResult.su?idx=${vo.idx}">${vo.answerCnt }</a></c:if>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input type="button" value="돌아가기" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/survey.su'"/>	
	<p><br/></p>
</div>
</body>
</html>
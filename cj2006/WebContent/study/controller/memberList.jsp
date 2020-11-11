<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cj2006.member.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<%
	//ArrayList<MemberVo> vos = (ArrayList<MemberVo>)request.getAttribute("vos"); 
			//이렇게 사용하면 <%= 이렇게 변수를 가져와야 해서, EL/JSTL을 이용하여 변수를 받아준다.%
	
	//int pag = request.getAttribute("pag"); 이렇
	//int totPage = request.getAttribute("totPage");
	//int curScrNo = Integer.parseInt(request.getAttribute("totRecCnt")) - Integer.parseInt(request.getAttribute("startNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mList.jsp</title>
<style>
table, h2 {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

th, td {
	text-align: center;
	padding: 15px;
	border: 1px solid #ccc;
}

th {
	background-color: gray;
}
</style>
</head>
<body>
	<p><br/></p>
	<h2>전 체 회 원 리 스 트</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
			<th>생일</th>
			<th>전자우편</th>
			<th>취미</th>
			<th>등급</th>
		</tr>
		<c:set var="indexNum" value="${curScrNo+1}"/>
		<c:forEach var="vo" items="${vos }">
			<c:if test="${empty vo.birth }">
				<c:set var="birth" value="비었음"/>
			</c:if>	
			<c:if test="${!empty vo.birth }">
				<c:set var="birth" value="${fn:substring(vo.birth ,0,10) }"/>
			</c:if>		
			<c:if test="${empty vo.hobby }">
				<c:set var="hobby" value="비었음"/>
			</c:if>	
			<c:if test="${!empty vo.hobby }">
				<c:set var="hobby" value="${vo.hobby }"/>
			</c:if>	
			<c:set var="userInfo" value="${vo.userinfo }"/>
			<tr>
				<td>${indexNum-1}???</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${vo.mid }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>	
				</td>
				<td>${vo.nickname }</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${vo.name }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>
				</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${vo.gender }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>
				</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${birth }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>
				</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${vo.email }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>
				</td>
				<td>
					<c:if test="${vo.userinfo eq 'OK' }">${hobby }</c:if>	
					<c:if test="${vo.userinfo ne 'OK' }">비공개</c:if>
				</td>
				<td>${vo.level }</td>
			</tr>
		</c:forEach>
	</table>
	<p></p>
	<p align="center">
		<c:forEach var="i" begin="1" end="${totPage }">
			<c:if test="${i eq pag }">${i }</c:if>
			<c:if test="${i ne pag }">
				<a href="memberList.do?pag=${i }">${i }</a>
			</c:if>
		</c:forEach>
	</p>
	<p><br/></p>
</body>
</html>
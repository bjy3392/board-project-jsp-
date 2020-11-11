<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>파일다운로드</h2>
	<p>(다운로드시의 경로는 '이클립스의 가상경로'로 설정한다. 실제 경로가 아니라...)</p>
	<hr/>
	<div>
		<c:forEach var="file" items="${files }" varStatus="st">
			<p>	
				${st.count } :
				<!-- 그림형식은 화면에 보여주고, zip파일은 다운로드된다. 이것을 모두 바이너리파일로 다운로드받기위해서는 아래 형식처럼 수행... -->
				<%--  <a href="${contextPath }/study/pdstest/data/${file }">${file }</a> : --%>
				<a href="${contextPath }/DownLoad?file=${file}">${file }</a>
				<c:set var="fname" value="${fn:split(file,'.') }"/>
				<c:set var="extName" value="${fname[fn:length(fname)-1]}"/>
				<c:if test ="${extName == 'jpg' || extName == 'gif' || extName == 'png' }">
					<img src="${contextPath }/study/pdstest/data/${file }" width="150px"/>
				</c:if>
				<c:if test ="${extName != 'jpg' && extName != 'gif' && extName == 'png' }">
					[문서파일]
				</c:if>
			</p>
		</c:forEach>
	</div>
	<p><a href="${contextPath}/ptUpLoad1.pt"  class="btn btn-outline-secondary">돌아가기</a></p>
</div>
</body>
</html>
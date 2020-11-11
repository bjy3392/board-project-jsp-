<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
<title>bList.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	/* var param = "pageSize="+pageSize+"&pag="+${pag }; */
	function sCheck(){
		if(serchform.searchStr.value == ""){
			alert("검색어를 입력하세요.");
			serchform.searchStr.fouce();
		}
		else{
			serchform.submit();
		}
	}
	
	<%-- 페이지 사이즈 수정시 --%>
	function pageCheck(){
		var pageSize = pageform.pageSize.value;
		location.href="${contextPath }/bList.bo?pag=${pag }&pageSize="+pageSize+"&search=${search}&searchStr=${searchStr}"; 
		<%-- location.href="<%=request.getContextPath()%>/bList.bo?pageSize="+pageSize+"&pag="+${pag }; --%>
		<%--location.href=${contextPath}/bList.bo?${param }; --%>
	}
	
</script>
</head>
<body>
	<p><br/><p>
	<div class="container">
		<h2>게시판</h2>
		<div><p>안녕하세요. 게시판에 글을 남겨 주세요. 오류 발견시 알려주세요.<br/> 게시판글과 닉네님이 연동되어 있어, 닉네임 변경시 기존글의 수정이 불가합니다.</p></div>
		<div align = "right">
			<input type="button" value="글 올리기" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/bInput.bo'"/>
			<form class="form-inline" name="pageform" method="get" >
				<select name="pageSize" class="custom-select mb-3" onchange="pageCheck()">
	    			<option value="5" ${pageSize==5 ? 'selected' :'' }>5건</option>
	    			<option value="10" ${pageSize==10 ? 'selected' :'' }>10건</option>
	    			<option value="15" ${pageSize==15 ? 'selected' :'' }>15건</option>
	    			<option value="20" ${pageSize==20 ? 'selected' :'' }>20건</option>
	    		</select> &nbsp;&nbsp;
			</form>
		</div>
		<!-- 검색리스트 출력시 시작-->
		<c:if test="${search != '' }">
			<div style="text-align:center">
		  		<c:choose>
		    		<c:when test="${search == 'title'}"><c:set var="sTitle" value="글제목"/></c:when>
		    		<c:when test="${search == 'name'}"><c:set var="sTitle" value="글쓴이"/></c:when>
		    		<c:otherwise><c:set var="sTitle" value="글내용"/></c:otherwise>
		  		</c:choose>
				  [<font color="brown">${search}</font>](으)로
				  [<font color="blue">${searchStr}</font>](를)을 검색한 결과
				  [<font color="red">${totRecCnt}</font>]건의 자료가 검색되었습니다.
				  <input type="button" value="전체보기" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/bList.bo'"/>
				  
			</div>
		</c:if>
		<!-- 검색리스트 출력시 끝-->
		<p><br/></p>
		<!-- 전체리스트 출력시 시작-->
		<table class="table table-hover">
			<thead>
				<tr>
					<th>idx</th>
					<th>Title</th>
					<th>Name</th>
					<th>Date</th>
					<th>Hits</th>
				</tr>
			</thead>
			<tbody>
			<%-- <c:set var="indexNum" value="${curScrNo+1 }"/> --%>
				<c:forEach var="vo" items="${vos }">
					<tr onClick="location.href='${contextPath}/bContent.bo?idx=${vo.idx }&pag=${pag }&pageSize=${pageSize }&search=${search}&searchStr=${searchStr}'">
						<td>${curScrNo }</td>
						<c:set var="curScrNo" value="${curScrNo-1 }"/>
						<td>${vo.title }&nbsp;[${vo.contCnt }]
							<c:if test="${vo.wNdate <= 24 }">
								<img src="<%=request.getContextPath() %>/images/new.gif"/>
							</c:if>
						</td>
						<td>${vo.name }</td>
						<td>
							<c:if test="${vo.wNdate <24 }">${fn:substring(vo.wCdate ,0,19)}</c:if>
							<c:if test="${vo.wNdate >=24 }">${vo.wdate }</c:if>
						</td>
						<td>${vo.readnum }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 전체리스트 출력시 끝-->
	<p><br/></p>
	<!-- 페이지처리 -->
	<div class="container">
		<ul class="pagination justify-content-center" >
			<c:if test="${pag != 1}">
    			<c:if test="${search != '' }">
					<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag-1}&pageSize=${pageSize}&search=${search}&searchStr=${searchStr}">Previous</a></li>
				</c:if>	
				<c:if test="${search == '' }">
					<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag-1}&pageSize=${pageSize}">Previous</a></li>
				</c:if>
    		</c:if>	
    		<c:set var="blockSize" value="${blockSize}"/>
  			<c:set var="startPageNum" value="${pag - (pag-1)%blockSize}"/> 	
			<c:forEach var="i" begin="0" end="${blockSize -1}" >
				<c:if test="${(startPageNum+i) <= totPage}">
      				<c:if test="${pag == (startPageNum+i)}">
						<li class="page-item"><a class="page-link" style="color:black" >${startPageNum+i}</a></li>
					</c:if>
					<c:if test="${pag != (startPageNum+i)}">
						<c:if test="${search != '' }">
							<li class="page-item"><a class="page-link" href="${contextPath}/bList.bo?pag=${startPageNum+i}&pageSize=${pageSize}&search=${search}&searchStr=${searchStr}">${startPageNum+i}</a></li>
						</c:if>	
						<c:if test="${search == '' }">
							<li class="page-item"><a class="page-link" href="${contextPath}/bList.bo?pag=${startPageNum+i}&pageSize=${pageSize}">${startPageNum+i}</a></li>
						</c:if>					
					</c:if>
   				</c:if>
			</c:forEach> 			
			<c:if test="${pag != totPage}"> 
				<c:if test="${search != '' }">
					<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag+1}&pageSize=${pageSize}&search=${search}&searchStr=${searchStr}">Next</a></li>
				</c:if>	
				<c:if test="${search == '' }">
					<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag+1}&pageSize=${pageSize}">Next</a></li>
				</c:if>
    		</c:if>
    	</ul>
    </div>
    <!-- 페이지처리 -->
    		
    <!-- 검색기 처리 시작 -->
    <div class="container" align="center">
		<form class="form-inline" name="serchform" method="get" action="${contextPath}/bList.bo">
			<select name="search" class="custom-select mb-3">
	    		<option value="title" selected>Title</option>
	    		<option value="name">Name</option>
	    		<option value="content">Content</option>
	    	</select> &nbsp;&nbsp;
			<input type="text" class="form-control mb-2 mr-sm-2" placeholder="검색어를 입력하세요." name="searchStr"> 
			<input type="button" value="검 색" onclick="sCheck()"/>
			 <input type="hidden" name="pageSize" value="${pageSize }"/>
		</form>
	</div>
	<p><br/></p>
</body>	
</html>

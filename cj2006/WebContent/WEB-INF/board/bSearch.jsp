<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>bList.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	function sCheck(){
		if(serchform.searchStr.value == ""){
			alert("검색어를 입력하세요.");
			serchform.searchStr.fouce();
		}
		else{
			serchform.submit();
		}
	}
	
	function pageCheck(){
		var pageSize = pageform.pageSize.value;
		location.href="<%=request.getContextPath()%>/bList.bo?pageSize="+pageSize;
	}
</script>
</head>
<body>
	<p><br/><p>
	<div class="container">
		<h2>게시판</h2>
		<p><div>안녕하세요. 게시판에 글을 남겨 주세요.</div></p>
		<div align = "right">
		<input type="button" value="글 올리기" class="btn btn-outline-secondary" onclick="location.href='<%=request.getContextPath()%>/bInput.bo'"/>
		<form class="form-inline" name="pageform" method="get" >
			<select name="pageSize" class="custom-select mb-3" onchange="pageCheck()">
    			<option value="5" ${pageSize==5 ? 'selected' :'' }>5건</option>
    			<option value="10" ${pageSize==10 ? 'selected' :'' }>10건</option>
    			<option value="15" ${pageSize==15 ? 'selected' :'' }>15건</option>
    			<option value="20" ${pageSize==20 ? 'selected' :'' }>20건</option>
    		</select> &nbsp;&nbsp;
		</form>
		</div>
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
					<tr onClick="location.href='<%=request.getContextPath()%>/bContent.bo?idx=${vo.idx }&pag=${pag }&pageSize=${pageSize }'">
						<td>${curScrNo }</td>
						<c:set var="curScrNo" value="${curScrNo-1 }"/>
						<td>${vo.title }</td>
						<td>${vo.name }</td>
						<td>${vo.wdate }</td>
						<td>${vo.readnum }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<p><br/></p>
	<!-- 페이지처리 -->
	<div class="container">
		<ul class="pagination justify-content-center" >
			<c:if test="${pag != 1}">
    			<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag-1}&pageSize=${pageSize}">Previous</a></li>
    		</c:if>
    		
    		<c:set var="blockSize" value="${blockSize}"/>
  			<c:set var="startPageNum" value="${pag - (pag-1)%blockSize}"/> 
  			
			<c:forEach var="i" begin="0" end="${blockSize -1}" >
				<c:if test="${(startPageNum+i) <= totPage}">
      				<c:if test="${pag == (startPageNum+i)}">
						<li class="page-item"><a class="page-link" style="color:black" >${startPageNum+i}</a></li>
					</c:if>
					<c:if test="${pag != (startPageNum+i)}">
						<li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/bList.bo?pag=${startPageNum+i}&pageSize=${pageSize}">${startPageNum+i}</a></li>
					</c:if>
   				</c:if>
			</c:forEach> 
			
			<c:if test="${pag != totPage}"> 
    		<li class="page-item"><a class="page-link" href="bList.bo?pag=${pag+1}&pageSize=${pageSize}">Next</a></li>
    		</c:if>
    	</ul>
    </div>
    		
    <!-- 검색기 처리 시작 -->
    <div class="container" align="center">
	<form class="form-inline" name="serchform" method="get" action="<%=request.getContextPath()%>/bSearch.bo">
		<select name="search" class="custom-select mb-3">
    		<option value="title" selected>Title</option>
    		<option value="name">Name</option>
    		<option value="content">Content</option>
    	</select> &nbsp;&nbsp;
		<input type="text" class="form-control mb-2 mr-sm-2" placeholder="검색어를 입력하세요." name="searchStr"> 
		<input type="button" value="검 색" onclick="sCheck()"/>
	</form>
	</div>
</body>	
</html>

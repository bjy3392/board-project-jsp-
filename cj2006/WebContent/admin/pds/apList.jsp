<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pList.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	
	<script >
		function partCheck(){
			var part = partForm.part.value;
			location.href = "aMenu.ad?sw=p&part="+part
		}
		function nWin(idx){
			var url = "pContent.pd?idx="+idx;
			var winX = 500;
			var winY = 400;
			var x = (window.screen.width)/2 - winX/2;
			var y = (window.screen.height)/2 - winY/2;
			
			modal.show(url,"pdsWindow","width="+winX+" ,height="+winY+" ,left="+x+" ,top="+y);
			
		}
		
		$('#myModal').on('show.bs.modal', function(e) {
			
			var tr = $(e.relatedTarget);
			var modal = $(this);
			
			modal.find('.modal-body').load(tr.data("remote"));
	
		});
		
		function delPwdCheck(idx,rfname){
			var ans = confirm("파일을 삭제하시겠습니까?");
			if(ans){
				//var pwd = prompt("비밀번호를 입력하세요.");
				var url = "pDelCheck.pd?idx="+idx+"&rfname="+rfname;
				var winX = 500;
				var winY = 400;
				var x = (window.screen.width)/2 - winX/2;
				var y = (window.screen.height)/2 - winY/2;
				
				window.open(url,"pdsWindow","width="+winX+" ,height="+winY+" ,left="+x+" ,top="+y);
			}
		}
		
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>자료실 (${part })</h2>
		<div><p>안녕하세요. 자료를 올려주세요. 오류 발견시 알려주세요. <br/> 게시판글과 닉네님이 연동되어 있어, 닉네임 변경시 기존글의 수정이 불가합니다.</p></div>
		<div align = "right">
			<input type="button" value="임시파일삭제" class="btn btn-outline-secondary" onclick="location.href='${contextPath}/apDeleteAll.ad'"/>
			<form class="form-inline" name="partForm" method="get" >
				<select name="part" class="custom-select mb-3" onchange="partCheck()">
	    			<option value="전체"  ${part=="전체" ? 'selected' :'' }>전체</option>
	    			<option value="영화" ${part=="영화" ? 'selected' :'' }>영화</option>
	    			<option value="여행" ${part=="여행" ? 'selected' :'' }>여행</option>
	    			<option value="도서" ${part=="도서" ? 'selected' :'' }>도서</option>
	    		</select> &nbsp;&nbsp;
			</form>
		</div>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Idx</th>
					<th>Title</th>
					<th>Name</th>
					<th>Date</th>
					<th>Class</th>
					<th>FileName(Size)</th>
					<th>Hits</th>
					<th>Download</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${vos }">
					<tr >
						<td>${curScrNo }</td>
						<td style="text-align:left"  data-toggle="modal" data-target="#myModal" data-remote="${contextPath}/pInput.pd?idx=${vo.idx }" >${vo.title }
							<c:if test="${vo.fNdate <= 24 }">
								<img src="<%=request.getContextPath() %>/images/new.gif"/>
							</c:if>						
						</td>
						<td>${vo.nickname }</td>
						<td>
							<c:if test="${vo.fNdate <=24 }">${fn:substring(vo.fdate ,11,19)}</c:if> <!-- 시간만 출력 -->
							<c:if test="${vo.fNdate >24 }">${fn:substring(vo.fdate ,0,10)}</c:if> <!-- 날짜만 출력 -->
						</td>
						<td>${vo.part }</td>
						<td>${vo.fname }(<fmt:formatNumber value="${vo.fsize/1024 }" pattern="#,###.0"/>KByte)</td>
						<td>${vo.downnum }</td>
						<td>
							<c:if test="${vo.opensw =='공개' }">
								<button type="button" class="btn btn-default" onClick="location.href='${contextPath}/pDownLoad.pd?idx=${vo.idx }'"><ion-icon name="download-outline"></ion-icon></button>
								
							</c:if>
							<c:if test="${vo.opensw =='비공개' }">
								<c:if test="${nickname != vo.nickname && slevel != '관리자' }">
									[비공개]
								</c:if>
								<c:if test="${nickname == vo.nickname || slevel == '관리자' }">
									<button type="button" class="btn btn-default" onClick="location.href='${contextPath}/pDownLoad.pd?idx=${vo.idx }'"><ion-icon name="download-outline"><ion-icon name="download-outline"></ion-icon></button>	
								</c:if>			
							</c:if>
							<c:if test="${nickname == vo.nickname || slevel == '관리자' }">
								<button type="button" class="btn btn-default" onClick="delPwdCheck(${vo.idx},'${vo.rfname }')"><ion-icon name="trash-outline"></ion-icon></button>	
							</c:if>
						</td>
						<c:set var="curScrNo" value="${curScrNo-1 }"/>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
		<!-- 리스트 끝 -->
		<p><br/></p>
		<!-- 페이징처리 시작 -->
		<ul class="pagination justify-content-center" >
			<c:if test="${pag != 1}">
    			<c:if test="${search != '' }">
					<li class="page-item"><a class="page-link" href="aMenu.ad?sw=p&pag=${pag-1}&part=${part }&search=${search}&searchStr=${searchStr}">Previous</a></li>
				</c:if>	
				<c:if test="${search == '' }">
					<li class="page-item"><a class="page-link" href="aMenu.ad?sw=p&pag=${pag-1}&part=${part }">Previous</a></li>
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
							<li class="page-item"><a class="page-link" href="${contextPath}/aMenu.ad?sw=p&pag=${startPageNum+i}&part=${part }&search=${search}&searchStr=${searchStr}">${startPageNum+i}</a></li>
						</c:if>	
						<c:if test="${search == '' }">
							<li class="page-item"><a class="page-link" href="${contextPath}/aMenu.ad?sw=p&pag=${startPageNum+i}&part=${part }">${startPageNum+i}</a></li>
						</c:if>					
					</c:if>
   				</c:if>
			</c:forEach> 			
			<c:if test="${pag != totPage}"> 
				<c:if test="${search != '' }">
					<li class="page-item"><a class="page-link" href="aMenu.ad?sw=p&pag=${pag+1}&part=${part }&search=${search}&searchStr=${searchStr}">Next</a></li>
				</c:if>	
				<c:if test="${search == '' }">
					<li class="page-item"><a class="page-link" href="aMenu.ad?sw=p&pag=${pag+1}&part=${part }">Next</a></li>
				</c:if>
    		</c:if>
    	</ul>	
<!-- <div class="modal fade" id="myModal"> -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">${vo.title }</h4>
          <button type="button" class="close" data-dismiss="modal" onClick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	${fn:replace(vo.content,newLine,"<br/>") }
        	<hr/>
        <c:if test="${vo.opensw == '공개' }"></c:if>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" >Close</button>
        </div>
      </div>
    </div>
  	</div>
  <!-- <div class="modal fade" id="myModal"> -->
  </div>
</body>
</html>
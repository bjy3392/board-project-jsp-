<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pContent.jsp</title>
  <%@ include file="../../include/bs.jsp" %>
</head>
<body>
<p><br/></p>
<!-- The Modal -->
<!-- <div class="modal fade" id="myModal"> -->
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">${vo.title}</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="window.close()">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          ${fn:replace(vo.content,newLine,"<br/>")}
          <hr/>
          <c:if test="${vo.opensw == '공개' || snickname == vo.nickname || slevel == '관리자'}">
            <c:set var="rfname" value="${vo.rfname}"/>
            <c:set var="rfnamelen" value="${fn:length(rfname)}"/>
            <c:set var="rfname" value="${fn:substring(rfname,(rfnamelen-3),rfnamelen)}"/>
            <c:if test="${fn:toUpperCase(rfname) == 'JPG' || fn:toUpperCase(rfname) == 'GIF' || fn:toUpperCase(rfname) == 'PNG'}">
              <img src="${contextPath}/data/pds/${vo.rfname}" width="350px"/>
            </c:if>
          </c:if>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="window.close()">Close</button>
        </div>
        
      </div>
    </div>
<!-- </div> -->
<p><br/></p>
</body>
</html>
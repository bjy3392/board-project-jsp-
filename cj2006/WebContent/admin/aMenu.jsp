<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>aMenu.jsp</title>
  <style>
    #adminMenu ul {
      list-style-type: none;
      margin : 0;
      padding:0;
      width:20%;
      position: fixed;
      height:100%;
    }
    #adminMenu ul li {
      text-align: center;
    }
    #adminMenu ul li a {
      display: block;
      width: 80px;
      background-color: #dddddd;
      padding: 8px 16px;
      text-decoration: none;
      /* border:1px solid gray; */
      border-style: solid;
      border-color: gray;
      border-width: 0 1px 1px;
    }
    #adminMenu ul li a:active {
      background-color: greenyellow;
      color : white;
    }
    #adminMenu ul li a:hover:not(:active) {
      background-color: #555555;
      color: white;
    }
    .aContent {
      margin-left: 20%;
      padding: 2px 10px;
      height: 1000px;
    }
  </style>
</head>
<body>
<%@ include file="../include/sCheck.jsp" %>
<%@ include file="../include/nav.jsp" %>
<div id="adminMenu">
  <ul>
    <li><a href="<%=request.getContextPath()%>/admin/aMenu.jsp?sw=m">회원리스트</a></li>
    <li><a href="<%=request.getContextPath()%>/admin/aMenu.jsp?sw=b">게시판리스트</a></li>
    <li><a href="<%=request.getContextPath()%>/aMenu.ad?sw=p">자료실리스트</a></li>
    <li><a href="<%=request.getContextPath()%>/aMenu.ad?sw=wm">삭제메세지</a></li>
  </ul>
</div>
<div class="container">
<%if(sw.equals("m")) { %>
    <%@ include file="./member/amList.jsp" %>
<%}
else if(sw.equals("p")) { %>
	<%@ include file="./pds/apList.jsp" %>
<%}
else if(sw.equals("wm")) { %>
	<%@ include file="./webmessage/awmList.jsp" %>
<%}else { %>
    - 관리자 메인 화면입니다.
<%} %>
</div>
</body>
</html>
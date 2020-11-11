<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/bs.jsp" %>
<%
  String smid = session.getAttribute("smid")==null ? "" : (String)session.getAttribute("smid");
%>
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>JSP 학습 Project</h1>
  <p>(본 사이트는 반응형으로 제작되었습니다.)</p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="/cj2006/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/cj2006/guest/gList.jsp">방명록</a>
      </li>
<%    if(smid.equals("")) { %>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/login.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/mInput.jsp">회원가입</a>
        </li>
<%    } else { %>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/board/BList">게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/pds/PList">자료실</a>
        </li>
        <!-- Dropdown -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">회원정보</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="#">정보수정</a>
            <a class="dropdown-item" href="#">회원검색</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mList.jsp">회원리스트</a>
            <a class="dropdown-item" href="#">회원탈퇴</a>
<%          if(smid.equals("admin")) { %>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/aMenu.jsp">관리자메뉴</a>
<%          } %>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/MLogOut">로그아웃</a>
        </li>
<%    } %>
    </ul>
  </div>  
</nav>
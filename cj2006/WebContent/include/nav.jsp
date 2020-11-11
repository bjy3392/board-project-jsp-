<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/bs.jsp" %>
<%
	String smid = session.getAttribute("smid") == null ? "" : (String)session.getAttribute("smid");
	String slevel = session.getAttribute("slevel")==null ? "": (String)session.getAttribute("slevel");
	String snickname = session.getAttribute("snickname")==null ? "": (String)session.getAttribute("snickname");
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
      <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/survey.su">설문조사</a>
       </li>
<%    if(smid.equals("")) { %>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/mLogin.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/mInput.jsp">회원가입</a>
        </li>
<%    } else { %>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/bList.bo">게시판</a>
        </li>
<%		if(!(slevel.equals("준회원") || slevel.equals(""))){	 %>        
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/pList.pd">자료실</a>
        </li>
<%      } %>  
        <!-- Dropdown -->  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">MyPage</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mUpdate.jsp">정보수정</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/scCalendar.sc">스케쥴관리</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/webMessageList.wm">메세지관리</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/chatting/chat.jsp">그룹채팅</a>
<%          if(!(slevel.equals("준회원") || slevel.equals(""))) { %>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mSearch.jsp">회원검색</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mList.jsp">회원리스트</a>
<%           } %>          
            <a class="dropdown-item" href="<%=request.getContextPath()%>/member/mDel.jsp">회원탈퇴</a>
          
<%          if(smid.equals("admin")) { %>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/aMenu.jsp">관리자메뉴</a>
<%          } %>
          </div>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Study</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/study/storage/storage.jsp">JSP저장소</a>
<%          if(!(slevel.equals("준회원") || slevel.equals(""))) { %>
            <a class="dropdown-item" href="#">test1</a>
            <a class="dropdown-item" href="#">test2</a>
<%            } %>          
            <a class="dropdown-item" href="#">test3</a>
<%          if(smid.equals("admin")) { %>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/aMenu.jsp">관리자메뉴</a>
<%          } %>
          </div>
        </li>
        
<%          if(!(slevel.equals("준회원") || slevel.equals(""))) { %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Study</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/study/storage/storage.jsp">JSP저장소</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/study/el/el.jsp">EL사용법</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/study/jstl/jstl.jsp">JSTL사용법</a>
        	<a class="dropdown-item" href="<%=request.getContextPath()%>/testController.do">Controller예제1</a> 
        	<a class="dropdown-item" href="<%=request.getContextPath()%>/memberController.do">Controller예제2</a> 
          </div>
        </li>
<%            } %>          
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Study2</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="<%=request.getContextPath()%>/ptUpLoad1.pt">싱글파일업로드</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/ptUpLoad2.pt">멀티파일업로드</a>
            <a class="dropdown-item" href="<%=request.getContextPath()%>/study/calendar/calendar.jsp">달력연습</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/member/MLogOut">로그아웃(<%=snickname %>)</a>
        </li>
<%    } %>
		
    </ul>
  </div>  
</nav>
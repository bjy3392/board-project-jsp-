<!-- nickCheck.jsp -->
<%@page import="cj2006.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  String nickname = request.getParameter("nickname")==null ? "" : request.getParameter("nickname");
  
  MemberDao dao = new MemberDao();
  
  boolean res = dao.nickCheck(nickname);
  
  if(res) {
    out.println("<p><br/></p>");
    out.println("<center>");
    out.println("<h3><font color='red'>"+nickname+"</font>는 이미 사용중인 닉네임 입니다.</h3>");
    out.println("<form name='myform' method='post' action='nickCheck.jsp'>");
    out.println("<input type='text' name='nickname'/>");
    out.println("<input type='button' value='닉네임검색' onclick='nickCheck()'/>");
    out.println("</form>");
    out.println("</center>");
  }
  else {
    out.println("<p><br/></p>");
    out.println("<center>");
    out.println("<h3><font color='red'>"+nickname+"</font>는 사용 가능한 닉네임 입니다.</h3>");
    out.println("<input type='button' value='창닫기' onclick='sendCheck()'>");
    out.println("</center>");

  }
%>
<script>
  function nickCheck() {
    var nickname = myform.nickname.value;
    if(nickname == "") {
      alert("닉네임을 입력하세요!");
      myform.nickname.focus();
    }
    else {
      myform.submit();
    }
  }
  function sendCheck() {
    opener.window.document.myform.nickname.value = '<%=nickname%>';
    opener.window.document.myform.name.focus();
    window.close();
  }
</script>
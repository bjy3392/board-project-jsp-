<!-- idCheck.jsp -->
<%@page import="cj2006.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
  
  MemberDao dao = new MemberDao();
  
  boolean res = dao.idCheck(mid);
  
  if(res) {
    out.println("<p><br/></p>");
    out.println("<center>");
    out.println("<h3><font color='red'>"+mid+"</font>는 이미 사용중인 아이디 입니다.</h3>");
    out.println("<form name='myform' method='post' action='idCheck.jsp'>");
    out.println("<input type='text' name='mid'/>");
    out.println("<input type='button' value='아이디검색' onclick='idCheck()'/>");
    out.println("</form>");
    out.println("</center>");
  }
  else {
    out.println("<p><br/></p>");
    out.println("<center>");
    out.println("<h3><font color='red'>"+mid+"</font>는 사용 가능한 아이디 입니다.</h3>");
    out.println("<input type='button' value='창닫기' onclick='sendCheck()'>");
    out.println("</center>");

  }
%>
<script>
  function idCheck() {
	  var mid = myform.mid.value;
	  if(mid == "") {
		  alert("아이디를 입력하세요!");
		  myform.mid.focus();
	  }
	  else {
		  myform.submit();
	  }
  }
  function sendCheck() {
	  opener.window.document.myform.mid.value = '<%=mid%>';
	  opener.window.document.myform.pwd.focus();
	  window.close();
  }
</script>

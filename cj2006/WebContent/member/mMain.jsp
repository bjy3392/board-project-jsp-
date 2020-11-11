<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mMain.jsp</title>
</head>
<body>
<%@ include file="../include/sCheck.jsp" %>
  <%@ include file="../include/bs.jsp" %>
<%@ include file="../include/nav.jsp" %>
<p><br/></p>
<div style="text-align:center">
  <h2>정회원(<font color="red"><%=session.getAttribute("snickname") %></font> - <%=session.getAttribute("slevel") %>) 방</h2>
</div>
</body>
</html>
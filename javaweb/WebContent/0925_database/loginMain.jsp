<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/memberCheck.jsp"%>
<%@ page import="T0925.*" %>
<%@ page import="java.util.ArrayList"  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<style>
    table {
      border-collapse: collapse;
    }
    table, td {
      margin: 0 auto;
      padding : 10px;
      border: 1px solid gray;
    }
    h2 {
      text-align: center;
    }
    #content {
    	text-align: center;
    }
  </style>
</head>
<body>
<p><br/><p>
<div id="content">
	<h2>전체회원 리스트</h2>
	<table>
		<tr>
			<td colspan="4" align="center"><%=session.getAttribute("sname") %>님 로그인 중입니다.</td>
		</tr>
		<tr>
			<td>고유번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>성명</td>
		</tr>
<%
	LoginDao dao = new LoginDao();
	ArrayList<LoginVo> vos = dao.loginList();
	for(int i =0; i<vos.size(); i++){
%>		
		<tr>
			<td><%=vos.get(i).getIdx() %></td>
			<td><%=vos.get(i).getMid() %></td>
			<td><%=vos.get(i).getPwd() %></td>
			<td><%=vos.get(i).getName() %></td>
		</tr>
<%} %>		

	</table>
	<p><a href="loginSchedule.jsp">일정관리</a></p>
	<p><a href="logOut.jsp">로그아웃</a></p>
</div>
</body>
</html>
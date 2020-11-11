<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test3.jsp</title>
</head>
<body>
	<%--'지시자(Directive)'는 '@' 로 시작 --%>
	<%-- '선언문(Declaration)'은 '<%!    %>'  변수나 메소드를 선언한다.--%>
	<%-- '스클립틀릿(scriptlet)'은 '<%    %>'  --%>
	<%-- '표현식(Expression)'은 '<%=    %>'  --%>
	<h2>선언문</h2>
	<%! 
		int su = 3;
		public String strLower(String str){
			String res = null;
			res = str.toLowerCase();
			return res;
		}
	%>
	<p>이곳은 본문</p>
	<%
		for(int i=0; i<su; i++){
			out.print("<font color = 'red'>"+ i + "</font><br/>");
		}
	%>
	<p>이곳은 본문(표현식)</p>
	<%= "안녕 jsp<br/>" %>
	<%= strLower("HELLooooo JSP") %>
	<p>여기까지가 본문</p>
</body>
</html>
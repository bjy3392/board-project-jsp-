<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int math = Integer.parseInt(request.getParameter("math"));
	int eng = Integer.parseInt(request.getParameter("eng"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
<jsp:useBean id="vo" class="T0918.LoginVo"/>
<%
	vo.setName(name);
	vo.setKor(kor);
	vo.setMath(math);
	vo.setEng(eng);
	vo.setTot();
	vo.setAvg();
%>


<p>이름 : <%= vo.getName() %> </p>
<p>국어: <%= vo.getKor() %> </p>
<p>수학: <%= vo.getMath() %></p>
<p>영어: <%= vo.getEng() %></p> 
<p>총점: <%= vo.getTot() %></p> 
<p>평균: <%= vo.getAvg() %></p> 


</body>
</html>
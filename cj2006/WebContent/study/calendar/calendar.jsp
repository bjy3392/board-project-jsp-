<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Calendar calToday = Calendar.getInstance();  //오늘날짜를 저장(claToday변수)
	Calendar cal = Calendar.getInstance(); //화면에 표시할 날짜
	
	int yy = request.getParameter("yy")==null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
	int mm = request.getParameter("mm")==null ? cal.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
	
	cal.set(yy,mm,1);
	
	int startWeek = cal.get(Calendar.DAY_OF_WEEK); //해당 년/월의 1일의 요일값을 받아온다.
	
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>scCalendar.jsp</title>
	<style>
		table{
			margin:0px auto;
			width:400px;
			height:400px;
			border:1px solid #ccc;
		}
		th, td{
			text-align: center;
			border:1px solid #ccc;
		}
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>달력연습</h2>
	<table>
		<tr>
			<th><font color="#f00">일</font></th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th><font color="#00f">토</font></th>
		</tr>
<%
		//시작요일만큼 공백을 추가
		for(int i=1; i<startWeek ; i++){
			out.println("<td>&nbsp;</td>");
		}
		
		while(cal.get(Calendar.MONTH) == mm){  //해당월의 '마지막일'까지 반복수행
			
			if(cal.get(Calendar.YEAR) == calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH) == calToday.get(Calendar.MONTH)  && cal.get(Calendar.DATE) == calToday.get(Calendar.DATE) ){				
				out.println("<td style='background-color:pink'>"+cal.get(Calendar.DATE)+"</td>");
			}
			
			else if(cal.get(Calendar.DAY_OF_WEEK) == 1 ){  //일요일인 경우
				out.println("<td><font color='#f00'>"+cal.get(Calendar.DATE)+"</font></td>");
			}
			else if(cal.get(Calendar.DAY_OF_WEEK) == 7 ){  //토요일인 경우
				out.println("<td><font color='#00f'>"+cal.get(Calendar.DATE)+"</font></td>");
			}
			else{
				out.println("<td>"+cal.get(Calendar.DATE)+"</td>");				
			}
	
		
			if(cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
				out.println("</tr><tr>");
			}
		
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
			
		}
		
		if(cal.get(Calendar.DAY_OF_WEEK) <= 7) {
			for(int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++){
				out.println("<td>&nbsp;</td>");
			}
		}
%>				
	
	</table>
</div>
</body>
</html>
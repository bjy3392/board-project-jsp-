<%@page import="cj2006.schedule.ScheduleVo"%>
<%@page import="cj2006.schedule.ScheduleDao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//String mid = session.getAttribute("smid")==null? "": (String)session.getAttribute("smid");	
	ScheduleDao dao = new ScheduleDao();
	

	Calendar calToday = Calendar.getInstance();  //오늘날짜를 저장(claToday변수)
	Calendar cal = Calendar.getInstance(); //화면에 표시할 날짜
	
	int yy = request.getParameter("yy")==null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy"));
	int mm = request.getParameter("mm")==null ? cal.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm"));
	
	//일정을 등록 수정 삭제  처리 후 돌아올때 기존의 월로 돌아오고자 할 처리
	
	String ymdNow = request.getParameter("ymd");
	
	if(ymdNow != null){
		String[] ymdArr = ymdNow.split("-");
		yy = Integer.parseInt(ymdArr[0]);
		mm = Integer.parseInt(ymdArr[1])-1;
	}
	
	cal.set(yy,mm,1);
	
	int startWeek = cal.get(Calendar.DAY_OF_WEEK); //해당 년/월의 1일의 요일값을 받아온다.
	
	int prevYear = yy;  //이전년도
	int prevMonth= (mm) -1 ;//이전 월
	int nextYear = yy;  //다음년도
	int nextMonth= (mm) +1 ;//다음 월
	
	if(prevMonth < 0){  //1월에서 '전 월'로 이동시 
		prevYear--;
		prevMonth = 11;
	}
	if(nextMonth > 11){  //12월에서 '다음 월'로 이동 시
		nextYear++;
		nextMonth = 0;
	}
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<style>
		table {
	      margin:0px auto;
	      width:400px;
	      height:400px;
	      border:1px solid #ccc;
	    }
	    th, td {
	      text-align: center;
	      border:1px solid #ccc;
	    }
		a{
			text-decoration :none;
			color : #646464
		}
	</style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>달력연습</h2>
	<table>
		<tr>
			<th colspan=7 style="text-align:center">
				<a href="${contextPath}/scCalendar.sc?yy=<%=prevYear-1 %>&mm=<%=mm %>" title="전년도">◀◀</a>
				<a href="${contextPath}/scCalendar.sc?yy=<%=prevYear%>&mm=<%=prevMonth %>" title="전달">◁</a>
				<%=yy %>년 <%=mm+1 %>월
				<a href="${contextPath}/scCalendar.sc?yy=<%=nextYear%>&mm=<%=nextMonth %>" title="다음달">▷</a>
				<a href="${contextPath}/scCalendar.sc?yy=<%=nextYear + 1%>&mm=<%=mm%>" title="다음년도">▶▶</a>
				<a href="${contextPath}/scCalendar.sc">Home</a>
			</th>
		</tr>
		
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
		
		String ymd ="";	
		String memory = "";

		while(cal.get(Calendar.MONTH) == mm){  //해당월의 '마지막일'까지 반복수행
			ymd = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1) +"-"+ cal.get(Calendar.DATE);
		
			ScheduleVo vo = dao.scContent(ymd, smid);	
			memory = vo.getMemory() == null ? "" : vo.getMemory();
		
			if(cal.get(Calendar.YEAR) == calToday.get(Calendar.YEAR) && cal.get(Calendar.MONTH) == calToday.get(Calendar.MONTH)  && cal.get(Calendar.DATE) == calToday.get(Calendar.DATE) ){				
				out.println("<td style='background-color:pink'><a href='scContent.sc?ymd="+ymd+"&mid="+smid+"'>"+cal.get(Calendar.DATE)+"<br/>"+memory+"</a></td>");
			}
			
			else if(cal.get(Calendar.DAY_OF_WEEK) == 1 ){  //일요일인 경우
				out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+smid+"'><font color='#f00'>"+cal.get(Calendar.DATE)+"<br/>"+memory+"</font></a></td>");
			}
			else if(cal.get(Calendar.DAY_OF_WEEK) == 7 ){  //토요일인 경우
				out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+smid+"'><font color='#00f'>"+cal.get(Calendar.DATE)+"<br/>"+memory+"</font></a></td>");
			}
			else{
				out.println("<td><a href='scContent.sc?ymd="+ymd+"&mid="+smid+"'>"+cal.get(Calendar.DATE)+"<br/>"+memory+"</a></td>");				
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
	<p><br/></p>
	<p><br/></p>
	<p><br/></p>
</div>
</body>
</html>
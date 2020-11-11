<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.member.MemberVo"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ include file="../../include/bs.jsp" %>
 	<%@ include file="../../include/nav.jsp" %>
 	<%@ include file="../../include/sCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>storageRes.jps</title>
</head>
<body>
<h2>Request객체를 통해서 전송되어온 값의 출력</h2>
<p>
	1. dispatcher.forword() 객체를 통해서의 값 전달 (서블릿에서의 값 전송되어온 값 출력)
	<font color="blue"><%= request.getAttribute("requestVar") %></font>
</p>
<p>
	2. dispatcher.forword() 객체를 통해서의 값 전달 (jsp에서의 값 전송되어온 값 출력)
	<font color="blue"><%= request.getAttribute("imsi") %></font>
</p>
<p>
	3. dispatcher.forword() 객체를 통해서의 값 전달 ((jsp에서의)배열값 값 전송되어온 값 출력)
<%
	String[] hobbys = (String[])request.getAttribute("hobbys");
	for(int i =0;i<hobbys.length; i++){
		out.println("<font color='blue'>"+hobbys[i]+"</font>");
	}
%>
</p>
<p>
	4. dispatcher.forword() 객체를 통해서의 값 전달 ((jsp에서의)Map객체 전송되어온 값 출력)
<%
	Map<String, Object> member = (Map<String, Object>)request.getAttribute("member");
	out.println("<br/>"+"name:" + member.get("name")+"<br/>");
	out.println("age:" + member.get("age")+"<br/>");
	out.println("address:" + member.get("address")+"<br/>");
	out.println("job:" + member.get("job")+"<br/>");
	out.println("ipsail:" + member.get("ipsail")+"<br/>");
%>
</p>
<p>
	5. dispatcher.forword() 객체를 통해서의 값 전달 ((jsp에서의)Vo객체 전송되어온 값 출력)
<%
	MemberVo vo = (MemberVo)request.getAttribute("vo");
	out.println("<br/>"+"idx:" + vo.getIdx() +"<br/>");
	out.println("name:" + vo.getName() +"<br/>");
	out.println("address:" + vo.getAddress() +"<br/>");
	out.println("hobby:" + vo.getHobby() +"<br/>");
%>
</p>
<p>
	6. dispatcher.forword() 객체를 통해서의 값 전달 ((jsp에서의)vos객체 전송되어온 값 출력)
<%
	ArrayList<MemberVo> vos = (ArrayList<MemberVo>)request.getAttribute("vos");
	for(int i =0;i<vos.size(); i++){
		out.println("<br/><font color='blue'>"+vos.get(i).getIdx()+"</font><br/>");
		out.println("<font color='blue'>"+vos.get(i).getName()+"</font><br/>");
		out.println("<font color='blue'>"+vos.get(i).getAddress()+"</font><br/>");
		out.println("<font color='blue'>"+vos.get(i).getHobby()+"</font><br/>");
	}
%>
</p>
<p><a href="<%=request.getContextPath()%>/study/storage/storage.jsp">돌아가기</a></p>
</body>
</html>
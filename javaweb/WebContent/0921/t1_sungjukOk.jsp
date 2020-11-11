<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
/* 
	String hakbun = request.getParameter("hakbun");
	String name= request.getParameter("name");
	int kor= Integer.parseInt(request.getParameter("kor"));
	int eng= Integer.parseInt(request.getParameter("eng"));
	int mat= Integer.parseInt(request.getParameter("mat"));
*/
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
</head>
<body>
	<h2>성적결과 조회</h2>
	<jsp:useBean id="vo" class="T0921.T1_sungjukVo"/>
	<jsp:setProperty name="vo" property="*" />
<%-- 	
	<jsp:setProperty name="vo" property="hakbun" value="<%=hakbun%>" />
	<jsp:setProperty name="vo" property="name" value="<%=name%>" />
	<jsp:setProperty name="vo" property="kor" value="<%=kor%>" />
	<jsp:setProperty name="vo" property="eng" value="<%=eng%>" />
	<jsp:setProperty name="vo" property="mat" value="<%=mat%>" />
 --%>	
<%-- 	
	<%
		vo.setHakbun(hakbun);
		vo.setName(name);
		vo.setKor(kor);
		vo.setEng(eng);
		vo.setMat(mat);
	%>
 --%>
<p>학번 : <jsp:getProperty name="vo" property="hakbun" /></p> 
<%-- <p>학번 : <%= vo.getHakbun() %></p> --%>
<p>이름 : <%= vo.getName() %></p>
<p>국어 : <%= vo.getKor() %></p>
<p>영어 : <%= vo.getEng() %></p>
<p>수학 : <%= vo.getMat() %></p>
<p>총점 : <%= vo.getTot() %></p>
<p>평균 : <%= vo.getAvg() %></p>
<p>학점 : <%= vo.getGrade() %></p>
<hr/>
<p><a href="t1_sungjuk.jsp">돌아가기</a></p>
	
</body>
</html>
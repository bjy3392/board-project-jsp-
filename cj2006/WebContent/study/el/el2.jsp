<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<%
request.setCharacterEncoding("utf-8");
/* 
String mid = request.getParameter("mid");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("mid");
String atom = request.getParameter("atom");
*/
 %>
<jsp:useBean id="vo" class="cj2006.study.el.ElVo"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>el2.jsp</title>
</head>
<body>
<p>mid = ${param.mid}</p>
<p>pwd = ${param.pwd}</p>
<p>name = ${param.name}</p>
<p>age = ${param.age}</p>
<p>atom = ${param.atom}</p>
<hr/>
<h2>jsp표기법</h2>
<p><jsp:getProperty name="vo" property="mid"/>
<p><jsp:getProperty name="vo" property="pwd"/>
<p><jsp:getProperty name="vo" property="name"/>
<p><jsp:getProperty name="vo" property="age"/>
<p><jsp:getProperty name="vo" property="atom"/>
<hr/>
<h2>EL표기법</h2>
<p>아이디 : ${vo.mid}</p>
<p>비밀번호 : ${vo.pwd}</p>
<p>이름 : ${vo.name}</p>
<p>나이 : ${vo.age}</p>
<p>atom : ${vo.atom}</p>
<hr/>
<%
	pageContext.setAttribute("mbc" ,"방송국");
	//session.setAttribute("mbc" ,"qqqq");
	//request.setAttribute("mbc" ,"방송국2211");
%>
<p>mbc : ${mbc}</p>
<hr/>
<%
	pageContext.setAttribute("var1", new int[]{100,200,300});
%>
<p>var1 : ${var1[0]} </p>
<p>var1 : ${var1[1]} </p>
<p>var1 : ${var1[2]} </p>
<hr/>
<%
	List<String> list = new LinkedList<>();
	list.add("홍길동");
	list.add("길말숙");
	list.add("강점찬");
	list.add("오하늘");
	pageContext.setAttribute("list", list);
%>
<p>list : ${list[0]} </p>
<p>list : ${list[1]} </p>
<p>list : ${list[2]} </p>
<p>list : ${list[3]} </p>
<hr/>
<%
	Map<String, String> map = new HashMap<>();
	map.put("1","aa");
	map.put("2","bb");
	map.put("3","cc");
	pageContext.setAttribute("map", map);
%>
<p>map : ${map["1"]} </p>
<p>map : ${map["2"]} </p>
<p>map : ${map["3"]} </p>
<hr/>
<p>10>20 : 10 gt 20 : ${10 gt 20} </p>
<p>10==20 : 10 eq 20 : ${10 eq 20} </p>
<%-- <p>10!=20 : 10 ne 20 : ${10 ne 20} </p> --%>
<p>10>=20 : 10 ge 20 : ${10 ge 20} </p>
<p>10<20 : 10 lt 20 : ${10 lt 20} </p>
<p>10<=20 : 10 le 20 : ${10 le 20} </p>
<hr/>
<%
	pageContext.setAttribute("sbs1", "hihi");
pageContext.setAttribute("sbs2", "");
pageContext.setAttribute("sbs3", null);
%>
<p>sbs1 : ${sbs1 }</p>
<p>sbs2 : ${sbs2 }</p>
<p>sbs3 : ${sbs3 }</p>
<p>sbs4 : ${sbs4 }</p>
<p>연산자(==) : ${sbs1 =="" || sbs1 == null}</p>
<p>연산자(empty) : ${empty sbs1}</p>
<p>연산자(empty) : ${empty sbs2}</p>
<p>연산자(empty) : ${not empty sbs3}</p>
<p>연산자(empty) : ${!empty sbs4}</p>
<p>sbs1 == null ? "" : sbs1 <----> ${empty sbs1 ? "1" : sbs1}</p>
<p>sbs2 == null ? "" : sbs2 <----> ${empty sbs2 ? "2" : sbs2}</p>
<p>sbs3 == null ? "" : sbs3 <----> ${empty sbs3 ? "3" : sbs3}</p>
</body>
</html>








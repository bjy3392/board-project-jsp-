<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String[][] telArr= {
			{"서울","02"},
			{"청주","043"},
			{"제주","064"},
			{"대전","042"},
	};
	
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	for(int i=0; i<telArr.length; i++){
		if(telArr[i][0].equals(tel1)) tel1 = telArr[i][1];
	}
	
	out.println("전화번호:" + tel1 +"-"+tel2+"-"+tel3);
%>

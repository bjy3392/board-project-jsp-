<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name") ==  null ? "" : request.getParameter("name");
	String[] language= request.getParameterValues("language");
	String otherlang = request.getParameter("otherlang")== null ? "" : request.getParameter("otherlang"); 

	//성명처리
	if(name.trim().length() == 0){
		out.println("<script>")	;
		out.println("alert('성명을 입력하세요');")	;
		out.println("history.back()");
		out.println("</script>")	;
		return;
	}
	else if(language ==  null){
		out.println("<script>")	;
		out.println("alert('언어를 선택하세요');")	;
		out.println("history.back()");
		out.println("</script>")	;
		return;
		
	}
	else{
		out.println("<p>성명: " + name + "</p>");
		String lang = "";
		for(String str : language){
			lang += str+" ";
		}
		lang += otherlang;
		out.println("<p>사용가능한언어: " + lang + "</p>" );
	}
	out.println("<p><a href='t3_checkbox.jsp'>돌아가기</a></p>");
%>
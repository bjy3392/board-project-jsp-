<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String[] sports = request.getParameterValues("sports");
	String orthersports = request.getParameter("orthersports")==null ? "" : request.getParameter("orthersports");
	
	out.println("<p>좋아하는 스포츠는 : " );
	String txtSport="";
	if(sports !=null){
		for(String sport : sports){
			txtSport += sport + " ";
		
			if(sport.equals("기타")){
				if(orthersports.trim().length() == 0){
					out.println("<script>")	;
					out.println("alert('기타 입력란을 채워주세요');")	;
					out.println("history.back()");
					out.println("</script>")	;
					return;			
				}
				else{
					txtSport += "- "+ orthersports;
				}
			}
		}
	}
	out.println(txtSport + "</p>");
	out.println("<p><a href='t5_listCheck.jsp'>돌아가기</a></p>");
%>

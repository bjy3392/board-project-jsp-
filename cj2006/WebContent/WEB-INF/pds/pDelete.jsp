<%@page import="java.io.File"%>
<%@page import="cj2006.pds.PdsVo"%>
<%@page import="cj2006.pds.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	String rfname = request.getParameter("rfname");
	
	String pwd = request.getParameter("pwd");
	
	//비밀번호 확인
	PdsDao dao = new PdsDao();
	boolean ans = dao.pwdCheck(idx, pwd);
	
	if(!ans){
		out.println("<script>");
		out.println("alert('비밀번호가 틀립니다. 확인하세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}
	
	//서버에서 실제 파일 삭제하기(/data/pds 폴더의 rfname 파일을 삭제처리한다.)
	String dir = application.getRealPath("/data/pds/");
	File file = new File(dir+rfname);
	
	if(file.exists()) file.delete(); //파일의 존재유무 확인 후 삭제
	
	//DB에서 자료 정보를 삭제
	ans = dao.pDel(idx);
	if(ans){
		out.println("<script>");
		out.println("alert('자료가 성공적으로 삭제되었습니다.');");
		out.println("opener.location.reload();");
		out.println("window.close();");
		out.println("</script>");
		return;
	}
	else{
		out.println("<script>");
		out.println("alert('비밀번호가 틀립니다. 확인하세요.');");
		out.println("history.back();");
		out.println("</script>");
		return;
	}
%>
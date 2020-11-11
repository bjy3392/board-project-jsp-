<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="cj2006.pds.PdsVo"%>
<%@page import="cj2006.pds.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	//DB처리
	PdsDao dao = new PdsDao();
	PdsVo vo = dao.pDownCount(idx); //다운로드 count 증가
	
	//파일처리(/data/pds/'rfname'을 /data/pds/imsi 폴더로 복사한다.)
	//복사작업시 rfname을 fname으로 복사처리한다.(그 후 fname으로 다운로드 시켜준다.)
	
	String fileName = vo.getFname();
	String rfname = vo.getRfname();
	
	if(rfname!=""){
		String dir = application.getRealPath("/data/pds/");//getRealPath("/")cj2006의 context path
		
		FileInputStream fis = new FileInputStream(dir+rfname); //파일을 읽어온다
		FileOutputStream fos = new FileOutputStream(dir+"imsi/"+fileName); //서버공간의 출력 위치
		
		byte[] b = new byte[1024]; //1KByte 단위로 보낸다.
		int cnt = 0;
		 while((cnt = fis.read(b)) != -1) {
		      fos.write(b, 0, cnt);
		    }
		    fos.flush(); //1024로 딱 떨어지지 않은 경우 , 찌꺼기 부분을 처리한다.
		    
		    fos.close();
		    fis.close();
		    
		   	//실제적으로 다운로드를 해주는 부분
		    response.sendRedirect(request.getContextPath()+"/DownAction?file="+URLEncoder.encode(fileName, "UTF-8"));
		 }
%>
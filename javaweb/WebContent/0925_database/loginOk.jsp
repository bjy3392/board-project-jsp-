<!-- loginOk.jsp -->
<%@page import="T0925.LoginVo"%>
<%@page import="T0925.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");  //requset(서버요청에 대한) client로부터 받은 데이터에 대한 한글처리
	
	String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
	/* LoginVo vo = new LoginVo();
	vo.setMid(request.getParameter("mid") == null ? "" : request.getParameter("mid"));
	vo.setPwd(request.getParameter("pwd") == null ? "" : request.getParameter("pwd"));
	 */
	
	LoginDao dao= new LoginDao();
	
	String name = dao.loginOk(mid,pwd);
	//String name = dao.loginCheck(vo);
	
	if(!name.equals("")){
		session.setAttribute("smid", mid);
		session.setAttribute("sname", name);
		out.println("<script>");
		out.println("alert('"+name+"님 로그인 되었습니다.');");
		out.println("location.href='loginMain.jsp';");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('로그인실패');");
		out.println("history.back();;");
		out.println("</script>");
	}
%>


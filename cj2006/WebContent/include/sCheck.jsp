<!-- sCheck.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String smid2 = session.getAttribute("smid")==null ? "" : (String)session.getAttribute("smid");
  if(smid2.equals("")) {
    //response.sendRedirect(request.getContextPath()+"/");
    out.println("<script>");
    out.println("//alert('로그인후 사용하세요.');");
    out.println("location.href='"+request.getContextPath()+"/member/mLogin.jsp';");
    out.println("</script>");
  }
%>
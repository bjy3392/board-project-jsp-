<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%="<h2>Get 방식으로 전송되어 온 결과?</h2>" %>
<%="<p>아이디 : <font color='blue'>" %>
<%=request.getParameter("mid") %>
<%="</font></p>" %>
<%="<p>비밀번호 : <font color='blue'>"%> 
<%=request.getParameter("pwd") %> 
<%="</font></p>" %>
<%="<p><a href='test4.jsp'>돌아가기</a></p>" %>

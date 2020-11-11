<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf8");
	//String mid = request.getParameter("mid")==null ? "":request.getParameter("mid");
	String mid = "hkd1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql ="";
	
	String url = "jdbc:mysql://localhost:3306/javadb";
	String user = "root";
	String password = "1234";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (ClassNotFoundException e) {
		System.out.println("드라이버 검색 실패" + e.getMessage());
	} catch (Exception e) {
		System.out.println("DB 연동 실패" + e.getMessage());
	}
	
	//회원자료 검색 후 출력퍼리 부분
	int idx = 0;
	String pwd = "";
	String name = "";
	try{
		sql = "select * from login where mid =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mid);
		rs = pstmt.executeQuery();
		if(rs.next()){	
			idx =  rs.getInt("idx");
			mid = rs.getString("mid");
			pwd = rs.getString("pwd");
			name = rs.getString("name");
		}
		else{
			out.println("찾고자하는 자료가 없습니다.");
		}
	}catch (SQLException e) {
		System.out.println(sql);
		System.out.println("SQL Error : " + e.getMessage());
	}
	
	//사용된 객체 반납
	if(conn != null) {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mvc.jsp</title>
</head>
<body>
<h2>친구 회원 보기</h2>
	<p>고유번호 : <%= idx %><p/>
	<p>아이디 : <%= mid %><p/>
	<p>비밀번호 : <%= pwd %><p/>
	<p>이름 : <%= name %><p/>			
	<p><a href="#">다시검색</a></p>
</body>
</html>

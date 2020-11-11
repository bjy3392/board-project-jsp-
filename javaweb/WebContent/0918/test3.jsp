<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>test3.jsp(main)</title>
	<style>
	.content{
		text-aligh:center;
		height:500px;
	}
	</style>
</head>
<body>
<%@ include file="test3_h.jsp" %>
<div class="content">
<%  if(sw.equals("h") || sw.equals("")){ %>
		<h2>이곳은 홈입니다.</h2>	
		<hr/>
		<img src="../images/pu.jpg"  />
<%	}else if(sw.equals("b")){  %>
		<h2>이곳은 게시판입니다.</h2>	
		<hr/>
		<img src="../images/zero.jpg"/>
<%	}else if(sw.equals("g")){  %>
		<h2>이곳은 갤러리입니다.</h2>	
		<hr/>
		<img src="../images/zero.jpg"/>
<%	}else if(sw.equals("p")){  %>
		<h2>이곳은 자료실입니다.</h2>	
		<hr/>
		<img src="../images/zero.jpg"/>
<%	}else if(sw.equals("s")){  %>
		<h2>이곳은 사이트맵입니다.</h2>	
		<hr/>
		<img src="../images/zero.jpg"/>
<%   } %>			
</div>

<%@ include file="test3_f.jsp" %>
</body>
</html>
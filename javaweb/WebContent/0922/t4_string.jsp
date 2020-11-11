<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>t4_string.jsp(문자열 함수)</title>
</head>
<body>
<h2>문자열 처리 함수 예제</h2>
<div>
	<%!
		String str1 = "Java Programming";
		String str2 = "자바 프로그래밍";
		String str3 = "JSP 웹 프로그래밍";
	%>
	<hr/>
	<p>str1.length : <%= str1.length() %></p>
	<p>str2.length : <%= str2.length() %></p>
	<p>str3.length : <%= str3.length() %></p>
	<hr/>
	<p>str1.charAt(5) : <%= str1.charAt(5) %></p>
	<p>str2.charAt(5) : <%= str2.charAt(5) %></p>
	<p>str3.charAt(6) : <%= str3.charAt(6) %></p>
	<hr/>
	<p>str1.indexOf("Pro"): <%= str1.indexOf("Pro") %></p>
	<p>str2.indexOf("프로"): <%= str2.indexOf("프로") %></p>
	<p>str3.indexOf("Java"): <%= str3.indexOf("Java") %></p>
	<hr/>
	<p>str1.substring(6) : <%= str1.substring(6) %></p>
	<p>str2.substring(6) : <%= str2.substring(6) %></p>
	<p>str3.substring(6) : <%= str3.substring(6) %></p>
	<hr/>
	<p>str1.substring(6,8) : <%= str1.substring(6,8) %></p>
	<p>str2.substring(6,8) : <%= str2.substring(6,8) %></p>
	<p>str3.substring(6,8) : <%= str3.substring(6,8) %></p>
	<hr/>
	<p> 
		<%
			String[] strArr = str1.split(" ");
			String temp = "";
			for(String str: strArr){
				temp +=str + "/";
			}
			out.println(temp);
		%>
	</p>
	<hr/>
	<p> 
		<%
			String[] strArr2 = str2.split(" ");
			String temp2 = "";
			for(String str: strArr2){
				temp2 +=str + "/";
			}
			out.println(temp2);
		%>
	</p>
	<hr/>
	<p> 
		<%
			String[] strArr3 = str3.split(" ");
			String temp3 = "";
			for(String str: strArr3){
				temp3 +=str + "/";
			}
			out.println(temp3);
		%>
	</p>
	<hr/>
	<%
		String str4 = "2020/09/22";
		StringTokenizer st = new StringTokenizer(str4,"/");
		out.println(st.countTokens());
	%>
	<p><%= st.countTokens() %></p>
	<p>
	<% while(st.hasMoreTokens()){
		out.println(st.nextToken()+ " ");
	}
	%>
	</p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	<p></p>
	
</div>
</body>
</html>
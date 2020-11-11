<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.guest.GuestVo"%>
<%@page import="cj2006.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	GuestDao dao = new GuestDao();
	GuestVo vo = new GuestVo();
	
	ArrayList<GuestVo> vos = dao.gList(5,5);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gList.jsp(방명록 리스트)</title>
	<script type="text/javascript">
		function delCheck(idx){
			var ans = confirm("정말 삭제하시겠습니까?");
			if(ans){
				location.href="/cj2006/GDel?idx="+idx;
			}
		}
	</script>
	<style>
    table {
      width : 80%;
      margin : 0 auto;
      border-collapse : collapse;
    }
    th, td {
      padding: 20px;
      border: 1px solid gray;
    }
    .tblTitle td {
      border : 0px;
    }
  </style>
</head>
<body>
<p><br/></p>
<table>
	<tr>
		<td colspan=2 align ="center"><h2>방명록 리스트 </h2></td>
	</tr>
	<tr>
    	<td align="right">
    	<% String smid = session.getAttribute("smid") == null ? "" : (String)session.getAttribute("smid");
    		if(smid.equals("admin")){
		%>
				[<a href="/cj2006/ALogout">관리자 로그아웃</a>]
    	<%
    		}
    		else{
    	%>
    			[<a href="/cj2006/admin/aLogin.jsp">관리자</a>]
    	<% 		
    		}
    	%>
    	[<a href="/cj2006/guest/gInput.jsp">글올리기</a>]</td>
  	</tr>
</table>
<%
  for(int i=0; i<vos.size(); i++) {
    vo = vos.get(i);
%>
   <br/>
    <table>
       <tr>
        <td colspan= 2 align="left">방문번호 : <%=vo.getIdx() %>
        <% if(smid.equals("admin")){
		%>
				<%-- [<a href="/cj2006/GDel?idx=<%=vo.getIdx() %>">삭제</a>] --%>
				[<a href="javascript:delCheck(<%= vo.getIdx() %>)">삭제</a>]
    	<%
    		}
    	%>        
        </td>
        <td colspan=2 align="right">방문자 IP : <%=vo.getHostip() %>
        <% if(smid.equals("admin")){
		%>
				[<a href="http://<%=vo.getHostip() %>:9090/cj2006/guest/gList.jsp" target="_blank">방문하기</a>]
    	<%
    		}
    	%>
    		
        </td>
       </tr>
       <tr>
        <th>성명</th>
        <td><%=vo.getName() %></td>
        <th>날짜</th>
        <td><%=vo.getVdate().substring(0,11) %></td>
      </tr>
      <tr>
        <th>E-mail</th>
        <td colspan=3><%=vo.getEmail() %></td>
      </tr>
      <tr>
        <th>Homepage</th>
        <td colspan=3><a href="<%=vo.getHomepage() %>" target="_blank"><%=vo.getHomepage() %></a></td>
      </tr>
      <tr>
        <th>방문소감</th>
        <td colspan=3><%=vo.getContent() %></td>
      </tr>
    </table>
<%
  }
%>
</body>
</html>
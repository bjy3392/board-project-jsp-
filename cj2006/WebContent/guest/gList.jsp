<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.guest.GuestVo"%>
<%@page import="cj2006.guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String smid = session.getAttribute("smid") == null ? "" : (String)session.getAttribute("smid");
	GuestDao dao = new GuestDao();
	GuestVo vo = new GuestVo();
	
	//페이징처리부분(이전/다음)
	//한페이지의 분량? 5건
	int pageSize =5;
	int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
	int totRecCnt = dao.totGecCnt();  //총 레코드 건수 계산하기
	int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
	int startNo = (pag -1) * pageSize;
	int curScrNo = totRecCnt - startNo;
	
	ArrayList<GuestVo> vos = dao.gList(startNo,pageSize);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gList.jsp(방명록 리스트)</title>
    <%@ include file="../include/bs.jsp" %>
 	<%@ include file="../include/nav.jsp" %>
	<script type="text/javascript">
		function delCheck(idx,pag){
			var ans = confirm("정말 삭제하시겠습니까?");
			if(ans){
				location.href="/cj2006/GDel?idx="+idx+"&pag="+pag;
			}
		}
	</script>
	<style>
    table {
      width : 80%;
      margin : 0 auto;
      border-collapse : collapse;
    }
    .col-sm-8{
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
      padding: 10px;
    }
  </style>
</head>
<body>
<table class="tblTitle">
	<tr>
    	<td align="right">
    	[<a href="/cj2006/guest/gInput.jsp">글올리기</a>]</td>
  	</tr>
  	<tr>
  	 	<td align="right">
  		<%
		for(int i=1; i<=totPage; i++){
			if(i == pag){ 
		%>
				<%=i%>&nbsp;&nbsp;
		<%		
			}else{
				%>		
			<a href="/cj2006/guest/gList.jsp?pag=<%= i %>"><%=i%></a>&nbsp;&nbsp;
		<%		
			}
		}
		%>
		</td>	
	</tr>
</table>

<%
  for(int i=0; i<vos.size(); i++) {
    vo = vos.get(i);
    String content = vo.getContent().replace("\n", "<br/>");
    //content = vo.getContent().replace("<", "&lt;");
    //content = content.replace(">", "&gt;");
%>
	<div class="col-sm-8" >
     <!--  <h2><%=content %></h2> -->
      <h5><%=vo.getName() %>, <%=vo.getVdate().substring(0,11) %> </h5>
      <p><%=vo.getHostip() %>
        <% if(smid.equals("admin")){
		%>
				[<a href="http://<%=vo.getHostip() %>:9090/cj2006/guest/gList.jsp" target="_blank">방문하기</a>]
    	<%
    		}
    	%>
    	<br/>
      	Index : <%=vo.getIdx() %>
        <% if(smid.equals("admin")){
		%>
				<%-- [<a href="/cj2006/GDel?idx=<%=vo.getIdx() %>">삭제</a>] --%>
				[<a href="javascript:delCheck(<%= vo.getIdx() %>, <%= pag %>)">삭제</a>]
    	<%
    		}
    	%>        
    	<br/>
    	E-<%= vo.getEmail() %>
    	<br/>
    	<a href="<%=vo.getHomepage() %>" target="_blank"><%=vo.getHomepage() %></a>
    	<br/>
    	</p>
      <%=content %>
      <hr/>
    </div>
    
     <!-- 
    <table>
       <tr>
         <td><h5><%=vo.getName() %>, <%=vo.getVdate().substring(0,11) %></h5></td>
         <td rowspan=5><%=content %></td>
       </tr>
       <tr>
        <td>Index <%=vo.getIdx() %>
        <% if(smid.equals("admin")){
		%>
				<%-- [<a href="/cj2006/GDel?idx=<%=vo.getIdx() %>">삭제</a>] --%>
				[<a href="javascript:delCheck(<%= vo.getIdx() %>)">삭제</a>]
    	<%
    		}
    	%>        
        </td>
       </tr>
       <tr>
        <td><%=vo.getHostip() %>
        <% if(smid.equals("admin")){
		%>
				[<a href="http://<%=vo.getHostip() %>:9090/cj2006/guest/gList.jsp" target="_blank">방문하기</a>]
    	<%
    		}
    	%>
        </td>
       </tr>
       <tr>
       	<td></td>
       </tr>
       </tr>
       <tr>
       	<td><a href="<%=vo.getHomepage() %>" target="_blank"><%=vo.getHomepage() %></a></td>
       </tr>
       <tr>
        
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
        <td colspan=3><%=content %></td>
      </tr>
       
    </table>
    <br/>
     
      -->
<%
  }
%>
	<!-- 아래로 페이징 처리 -->
     <p></p>
     <p align="center">
		<%
		for(int i=1; i<=totPage; i++){
			if(i == pag){ 
		%>
				<%=i%>&nbsp;&nbsp;
		<%		
			}else{
				%>		
			<a href="/cj2006/guest/gList.jsp?pag=<%= i %>"><%=i%></a>&nbsp;&nbsp;
		<%		
			}
		}
		%>
		</p>
 <p><br/></p>
</body>
</html>
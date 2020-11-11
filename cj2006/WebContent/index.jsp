<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./include/bs.jsp" %>
<%@ include file="./include/nav.jsp" %>
<%@page import="cj2006.guest.GuestDao"%>
<%@page import="cj2006.guest.GuestVo"%>
<%@page import="cj2006.board.BoardDao"%>
<%@page import="cj2006.board.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.pds.PdsVo"%>
<%@page import="cj2006.pds.PdsDao"%>
<%
GuestDao dao = new GuestDao();
GuestVo vo = new GuestVo();
ArrayList<GuestVo> vos = dao.gListNew(0,10);
BoardDao bdao = new BoardDao();
ArrayList<BoardVo> bvos = bdao.getBoardList(0, 10);
PdsDao pdao = new PdsDao();
ArrayList<PdsVo> pvos = pdao.pList(0,"전체");
ArrayList<PdsVo> pvosCont = new ArrayList<PdsVo>();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>jsp학습(배지영)</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
	 
  </script>
  
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>
<div class="" style="margin-top:30px" >
	<div class="row">
			<div class="col-sm-1">
			</div>
			<div class="col-sm-3">
		      	<h2>방명록을 작성해주세요</h2>
				<h5 style="float:left">최신 방명록:</h5>&nbsp; 글남기러 가기&nbsp;<a href="/cj2006/guest/gList.jsp">Click</a>
				<table class="table">
					<thead>
					   	<tr>
					        <th>Name</th>
					        <th>Content</th>
						</tr>
					</thead>
		<%			for(int i=0; i<vos.size(); i++) {
				    	vo = vos.get(i);
				    	String content = vo.getContent().replace("\n", "<br/>");
		 %>			<tbody>
						<tr>
					        <td><%= vo.getName()%></td>
					        <td><%=content %></td>
					     </tr>
					</tbody>
		<%			}%>
				</table>
				<br/>
		      	<h3>설문조사</h3>
		      	<h5>날짜별구분:</h5>
		      	<ul class="nav nav-pills flex-column">
		        	<li class="nav-item">
		          		<a class="nav-link active" href="#">Active</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="#">Link</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link" href="#">Link</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link disabled" href="#">Disabled</a>
		        	</li>
		      	</ul>
		     <hr class="d-sm-none">
		</div>
		<div class="col-sm-6">
		      	<div class="container">  
		    		<h2>게시글</h2>
		      		<h5>최신게시글:</h5> 
		<%			String smid2 = session.getAttribute("smid")==null ? "" : (String)session.getAttribute("smid");
					if(smid2.equals("")){ %>
						<p>안녕하세요.<br/>로그인 후 게시글을 열람하거나 작성할 수 있습니다. 로그인해주세요.</p>
		<%			}else{ %>	
						<p>안녕하세요.<br/>게시글을 열람하거나 새로운 글은 작성해주세요. </p>
		<%			}%>      		  		
				  	<div class="child" id="icon">
		       		</div>        
				  	<table class="table table-hover">
				   		<thead>
					    	<tr>
					        	<th>Name</th>
					        	<th>Title</th>
					        	<th>Date</th>
					      </tr>
				    	</thead>
		<%			for(BoardVo bvo :bvos) {
		 %>			<tbody>
						<tr  onClick="location.href='<%= request.getContextPath()%>/bContent.bo?idx=<%= bvo.getIdx() %>'">
					        <td><%= bvo.getName()%></td>
					        <td><%= bvo.getTitle() %>&nbsp;[<%= bvo.getContCnt() %>]</td>
					        <td><%= bvo.getwCdate().substring(0, 19) %></td>
					     </tr>
					</tbody>
		<%			}%>	
				  </table>
				</div>
		      <br>
		      <h2>자료실</h2>
		      <h5 style="float:left">최신 자료:</h5>&nbsp;<a href="<%= request.getContextPath()%>/pList.pd">다운받기Click</a>  
		      <table class="table table-bordered">
		 			<tbody>
						<tr>
		<%			for(PdsVo pvo:pvos) {
						String rfname = pvo.getRfname();
						rfname= rfname.substring(rfname.length()-3,rfname.length());
						if(pvo.getOpensw().equals("공개")){
							if(rfname.toUpperCase().equals("JPG") || rfname.toUpperCase().equals("GIF") || rfname.toUpperCase().equals("PNG")){
		%>						<td width="120px" height="100px" ><img src="<%= request.getContextPath()%>/data/pds/<%=pvo.getRfname() %>" width="120px" height="120px"/></td>
		<%
							}
						}
						else if(pvo.getOpensw().equals("비공개")){%>
							<td width="140px" height="100px" style="text-align:center">[비공개]</td>				
		<%				}
		}
		%>				</tr>
					</tbody>
				  </table>
		    </div>
		<div class="col-sm-2" >
			<jsp:include page="./WEB-INF/schedule/scCalendarHome.jsp"/>
		</div>
	</div>
</div>

<%--  <jsp:include page="./WEB-INF/schedule/scCalendarHome.jsp"/> --%>
<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>

</body>
</html>

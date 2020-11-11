<%@page import="cj2006.member.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  
  MemberDao dao =new MemberDao();
  
  //ArrayList<MemberVo> vos = dao.mList();
  
	//페이징처리부분(이전/다음)
	//한페이지의 분량? 5건
	int pageSize =3;
	int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
	int totRecCnt = dao.totGecCnt();  //총 레코드 건수 계산하기
	int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
	int startNo = (pag -1) * pageSize;
	int curScrNo = totRecCnt - startNo;
	
	ArrayList<MemberVo> vos = dao.mList(startNo,pageSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mList.jsp</title>
<style>
table, h2 {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

th, td {
	text-align: center;
	padding: 15px;
	border: 1px solid #ccc;
}

th {
	background-color: gray;
}
</style>
</head>
<body>
	<%@ include file="../include/sCheck.jsp"%>
	<%@ include file="../include/nav.jsp"%>
	<p>
		<br />
	</p>
	<h2>전 체 회 원 리 스 트</h2>
	<table>
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
			<th>생일</th>
			<th>전자우편</th>
			<th>취미</th>
			<th>등급</th>
		</tr>
		<%
  MemberVo vo = new MemberVo();
  int indexNum = curScrNo+1;
  String birth, hobby, userInfor;
  for(int i=0; i<vos.size(); i++) {
    vo = vos.get(i);
    indexNum -= 1;
    
    if(vo.getBirth()==null)
      birth = "비었음";
    else
      birth = vo.getBirth().substring(0,11);
    
    if(vo.getHobby()==null || vo.getHobby().equals(""))
      hobby = "없음";
    else
      hobby = vo.getHobby();
    
    userInfor = vo.getUserinfo();
%>
		<tr>
			<td><%=indexNum%></td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=vo.getMid() %> <%} else { %> -비공개 <%} %>
			</td>
			<td><%=vo.getNickname()%></td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=vo.getName() %> <%} else { %> -비공개
				<%} %>
			</td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=vo.getGender() %> <%} else { %>
				-비공개 <%} %>
			</td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=birth %> <%} else { %> -비공개 <%} %>
			</td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=vo.getEmail() %> <%} else { %> -비공개
				<%} %>
			</td>
			<td>
				<%if(userInfor.equals("OK")) { %> <%=hobby %> <%} else { %> -비공개 <%} %>
			</td>
			<td><%=vo.getLevel()%></td>
		</tr>
		<%} %>
	</table>
	<p></p>
	<p align="center">
		<%
			for (int i = 1; i <= totPage; i++) {
				if (i == pag) {
		%>
		<%=i%>&nbsp;&nbsp;
		<%
			} else {
		%>
		<a href="/cj2006/member/mList.jsp?pag=<%=i%>"><%=i%></a>&nbsp;&nbsp;
		<%
			}
			}
		%>
	</p>
	<p>
		<br />
	</p>
</body>
</html>
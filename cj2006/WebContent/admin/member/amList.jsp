<%@page import="cj2006.admin.AdminDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	AdminDao dao = new AdminDao();

	//한페이지 분량 : 3건
	int pageSize = 3;
	int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
	int totRecCnt = dao.totRecCnt(); //총 레코드 건수 계산하기
	int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;//총페이지 수
	int startNo = (pag - 1) * pageSize;
	int curScrNo = totRecCnt - startNo;

	ArrayList<MemberVo> vos = dao.amList(startNo, pageSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mList.jsp</title>
<script>
	function levelCheck() {
		alert("회원정보를 변경하시려면 '정보변경'버튼을 클릭하세요!");
	}
	function nWin(idx) {
		var url = "./member/amSearch.jsp?idx=" + idx;
		window.open(url, "nwin", "width=650,height=700");
	}
</script>
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
			<th>탈퇴여부</th>
		</tr>
		<%
			MemberVo vo = new MemberVo();
			int indexNum = curScrNo+1;
			String birth, hobby, userInfor, userDel;
			for (int i = 0; i < vos.size(); i++) {
				vo = vos.get(i);
				indexNum -= 1;
				if (vo.getBirth() == null)
					birth = "비었음";
				else
					birth = vo.getBirth().substring(0, 11);

				if (vo.getHobby() == null || vo.getHobby().equals(""))
					hobby = "없음";
				else
					hobby = vo.getHobby();

				userInfor = vo.getUserinfo();

				if (vo.getUserdel().equals("OK")) {
					userDel = "탈퇴신청중";
				} else {
					userDel = "정상가입중";
				}
		%>
		<tr>
			<td><%=indexNum%></td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=vo.getMid()%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td><a href="javascript:nWin(<%=vo.getIdx()%>)"><%=vo.getNickname()%></a></td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=vo.getName()%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=vo.getGender()%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=birth%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=vo.getEmail()%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td>
				<%
					if (userInfor.equals("OK")) {
				%> <%=hobby%> <%
 	} else {
 %> -비공개 <%
 	}
 %>
			</td>
			<td>
				<form name="myform" method="get"
					action="<%=request.getContextPath()%>/admin/LevelCheck">
					<select name="level" onchange="levelCheck()">
						<option value="준회원" <%if (vo.getLevel().equals("준회원")) {%>
							selected <%}%>>준회원</option>
						<option value="정회원" <%if (vo.getLevel().equals("정회원")) {%>
							selected <%}%>>정회원</option>
						<option value="우수회원" <%if (vo.getLevel().equals("우수회원")) {%>
							selected <%}%>>우수회원</option>
						<option value="관리자" <%if (vo.getLevel().equals("관리자")) {%>
							selected <%}%>>관리자</option>
					</select> <input type="submit" value="정보변경" /> <input type="hidden"
						name="idx" value="<%=vo.getIdx()%>" />
				</form>
			</td>
			<%if(userDel.equals("탈퇴신청중")) {%>
			<td><font color="red"><a href="<%=request.getContextPath()%>/member/DelOk?idx=<%=vo.getIdx()%>"><%=userDel%></a></font></td>
			<%}	else {%>
				<td><%=userDel%></td>
			<%} %>
			
		</tr>
		<%
			}
		%>
	</table>
	<p>
		<br />
	</p>
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
		<a href="aMenu.jsp?sw=m&pag=<%=i%>"><%=i%></a>&nbsp;&nbsp;
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
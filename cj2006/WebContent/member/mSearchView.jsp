<%@page import="cj2006.admin.AdminDao"%>
<%@page import="cj2006.member.MemberVo"%>
<%@ include file="../include/sCheck.jsp"%>
<%@ include file="../include/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  MemberVo vo = (MemberVo)request.getAttribute("vo");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mSearchView.jsp</title>
  <script>
    
  </script>
  <style>
    /* body {
      margin : 0 auto;
      width : 80%;
    } */
    h2 {
      text-align: center;
    }
    table {
      margin : 0px auto;
      width : 600px;
      border-collapse : collapse;
    }
    table, th, td {
      border: 1px solid gray;
      padding : 8px;
      /* text-align : left; */
    }
    th {
      width : 90px;
      text-align : center;
    }
    .tbl {
      text-align : left;
    }
    .tblfooter {
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<form>
  <h2>회 원 개 별 조 회</h2>
  <%if(vo.getUserinfo().equals("OK")){ %> 
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <input type="text" name="mid" value="<%=vo.getMid()%>"/>
      </td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td>
        <input type="text" name="nickname" value="<%=vo.getNickname()%>"/>
        (등급 : <font color="red"><%=vo.getLevel() %></font>)
      </td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name"  value="<%=vo.getName()%>"/></td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
        <input type="radio" name="gender" value="남자" <% if(vo.getGender().equals("남자")) { %>checked<% } %>/>남자
        <input type="radio" name="gender" value="여자" <% if(vo.getGender().equals("여자")) { %>checked<% } %>/>여자
      </td>
    </tr>
    <tr>
      <th>생일</th>
      <td>
        <%=vo.getBirth() %>
      </td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td>
        <%=vo.getTel() %>
      </td>
    </tr>
    <tr>
      <th>주소</th>
      <td>
        <%=vo.getAddress() %>
      </td>
    </tr>
    <tr>
      <th>전자우편</th>
      <td>
        <%=vo.getEmail() %>
      </td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td><%=vo.getHomepage() %></td>
    </tr>
    <tr>
      <th>직업</th>
      <td>
        <%=vo.getJob() %>
      </td>
    </tr>
    <tr>
      <th>취미</th>
      <td>
        <%=vo.getHobby() %>
      </td>
    </tr>
    <tr>
      <td>정보공개</td>
      <td>
 <%
 			if(vo.getUserinfo().equals("OK")){ %> 정보공개
 <%			}else {%>정보 비공개<%} %>
       </td>
    </tr>
     <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="다시검색" onclick="location.href='<%=request.getContextPath()%>/member/mSearch.jsp'" />
      </td>
    </tr>
  </table>
 <%	}else {%>
 - <%=vo.getNickname() %>님 정보 비공개
  <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="다시검색" onclick="location.href='<%=request.getContextPath()%>/member/mSearch.jsp'" />
      </td>
    </tr>
 <%} %> 
</form>
<p><br/></p>
</body>
</html>
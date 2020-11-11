<%@page import="cj2006.admin.AdminDao"%>
<%@page import="cj2006.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  int idx = Integer.parseInt(request.getParameter("idx"));

  AdminDao dao = new AdminDao();
  //MemberDao dao = new MemberDao();
  
  MemberVo vo = dao.amSearch(idx);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>amSearch.jsp</title>
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
  <h2>회 원 상 세 조 회</h2>
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
        <input type="radio" name="userinfor" value="OK" <% if(vo.getUserinfo().equals("OK")) { %>checked<% } %>/>공개&nbsp;&nbsp;
        <input type="radio" name="userinfor" value="NO" <% if(vo.getUserinfo().equals("NO")) { %>checked<% } %>/>비공개
      </td>
    </tr>
    <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="창닫기" onclick="window.close()"/>
      </td>
    </tr>
  </table>
</form>
<p><br/></p>
</body>
</html>
<%@page import="cj2006.member.MemberVo"%>
<%@page import="cj2006.member.MemberDao"%>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	//String smid3 = (String)session.getAttribute("smid");

	MemberDao dao = new MemberDao();
	
	if( smid.equals("admin")){
	      out.println("<script>");
	      out.println("alert('탈퇴할 수 없습니다.');");
	      out.println("location.href='"+request.getContextPath()+"/member/mMain.jsp';");
	      out.println("</script>");
	    }
	
	MemberVo vo = dao.mSearch("mid",smid);
	
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mInput.jsp</title>
    <%@ include file="../../include/bs.jsp" %>
  <script>
    
    function fCheck() {
      var pwd1 = myform.pwd.value;
      var pwd2 = <%=vo.getPwd()%>
      // 기타 나머지 체크
      if(pwd1 != pwd2) {
    	  alert("비밀번호를 확인하세요.");
    	  myform.pwd.focus();
    	  
      }
      else {
    	  var sel = confirm("정말에 탈퇴하시겠습니까?(같은 ID로는 1개월간 새로 가입할 수 없습니다.)");
  			if(sel){
  				myform.submit();
  			}
      	}
    }
    
  </script>
  <style>
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
<form name="myform" method="post" action="<%=request.getContextPath()%>/member/MDel">
  <h2>회 원 탈 퇴</h2>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <%=vo.getMid() %>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pwd" value="" /></td>
    </tr>
    
    <tr>
      <th>닉네임</th>
      <td>
        <%=vo.getNickname() %>
      </td>
    </tr>
    <tr>
      <th>성명</th>
      <td><%=vo.getName() %></td>
    </tr>
    <tr>
      <th>탈퇴이유</th>
      <td><textarea name="cause" row="5" cols="30" required/></textarea></td>
    </tr>
    <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="탈퇴하기" onclick="fCheck()"/>
      </td>
    </tr>
  </table>
</form>
<p><br/></p>
</body>
</html>
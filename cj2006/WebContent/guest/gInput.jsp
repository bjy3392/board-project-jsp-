<%@page import="cj2006.member.MemberDao"%>
<%@page import="cj2006.member.MemberVo"%>
<%@ include file="../include/bs.jsp" %>
<%@ include file="../include/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//String snickname = session.getAttribute("snickname")==null ? "": (String)session.getAttribute("snickname");
	MemberVo vo = new MemberVo();
	MemberDao dao = new MemberDao();
	vo = dao.mSearch("mid",smid);
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>gInput.jsp(방문소감 등록)</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script>
//정규표현식을 정의합니다.
  function email_check( email ) {
      var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
      return (email != '' && email != 'undefined' && regex.test(email));
  }
  $(function() {
	  	/* 
		var res = confirm("비회원입니다. 로그인 하시겠습니까?");
        if(res){
        	location.href='../member/mLogin.jsp';
        }
        else{
        	alert('비회원으로 진행합니다.');
        }
         */
	    // name 속성이 'email'인 input 이 focus를 잃었을때 처리한다.
	    $("input[name='email']").blur(function(){

	        var email = $(this).val();

	        // 값을 입력안한경우는 아예 체크를 하지 않는다.
	        if( email == '' || email == 'undefined') return;

	        // 이메일 유효성 검사
	        if(! email_check(email) ) {
	            alert('잘못된 형식의 이메일 주소입니다.');
	            setTimeout(function(){
	            	 $("input[name='email']").focus();
	              }, 10)
	            return ;
	        }
	    });
	});
  
  
	</script>
  <style>
    table {
      width : 80%;
      margin: 0 auto;
      border-collapse: collapse;
    }
    th {
      background-color: orange;
    }
    th, td {
      padding: 15px;
      border: 1px solid gray;
    }
    h2 {
      text-align: center;
    }
  </style>
</head>
<body>
<p><br/></p>
<form name="myform" method="post" action="/cj2006/GInput">
  <table>
    <h2 >방명록 글쓰기</h2><br/>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name" value="<%=snickname%>"  required/></td>
    </tr>
    <tr>
      <th>이메일</th>
      <td><input type="text" name="email" <%if(vo==null){%> value="" <%}else{%> value="<%=vo.getEmail()%>" <% }%>  size="57"/></td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td><input type="text" name="homepage" <%if(vo==null){%> value="http://" <%}else{%> value="<%= vo.getHomepage() %>" <% }%> size="57"/></td>
    </tr>
    <tr>
      <th>방문소감</th>
      <td><textarea rows="5" cols="60" name="content" required autofocus></textarea></td>
    </tr>
    <tr>
      <td colspan=2 align="center">
        <!-- <input type="button" value="방명록 등록" onclick="fCheck()"/> &nbsp; -->
        <input type="submit" value="방명록 등록"/> &nbsp;
        <input type="reset" value="다시입력"/> &nbsp;
        <input type="button" value="돌아가기" onclick="location.href='/cj2006/guest/gList.jsp';"/>
      </td>
    </tr>
  </table>
  <br/><br/><br/>
  <input type="hidden" name="hostip" value="<%=request.getRemoteAddr() %>"/>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mSearch.jsp</title>
  <script>
    function nickCheck() {
    	var nickname = myform.nickname.value;
    	if(nickname=="") {
    		alert("닉네임을 입력하세요");
    		myform.nickname.focus();
    	}
    	else {
    		myform.submit();
    	}
    }
  </script>
  <style type="text/css">
  	#content {
  		width :500px ;
  		margin : 0 auto;
  	}
  </style>
</head>
<body>
<%@ include file="../include/nav.jsp" %>
<p><br/></p>
<form name="myform" method="get" action="<%=request.getContextPath()%>/member/MSearch">
<div id="content">
  <h2>회 원 개 별 조 회</h2>
  <table>
    <tr>
      <th>닉네임</th>
      <td>
        <input type="text" name="nickname" placeholder="별명을 입력하세요"/>
        <input type="button" value="별명 검색" onClick="nickCheck()"/>
      </td>
    </tr>
    
  </table>
 </div>
</form>
<p><br/></p>
</body>
</html>
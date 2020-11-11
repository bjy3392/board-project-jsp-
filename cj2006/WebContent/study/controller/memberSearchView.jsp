<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberSearchView.jsp</title>
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
	<c:if test="${vo.userinfo == 'OK' }">
		<table>
	    <tr>
	      <th>아이디</th>
	      <td>${vo.mid }</td>
	    </tr>
	    <tr>
	      <th>닉네임</th>
	      <td>${vo.nickname }(등급 : <font color="red">${vo.level }</font>)</td>
	    </tr>
	    <tr>
	      <th>성명</th>
	      <td>${vo.name }</td>
	    </tr>
	    <tr>
	      <th>성별</th>
	      <td>${vo.gender } </td>
	    </tr>
	    <tr>
	      <th>생일</th>
	      <td>${vo.birth }</td>
	    </tr>
	    <tr>
	      <th>전화번호</th>
	      <td>${vo.tel }</td>
	    </tr>
	    <tr>
	      <th>주소</th>
	      <td>${vo.address } </td>
	    </tr>
	    <tr>
	      <th>전자우편</th>
	      <td>${vo.email } </td>
	    </tr>
	    <tr>
	      <th>홈페이지</th>
	      <td>${vo.homepage }</td>
	    </tr>
	    <tr>
	      <th>직업</th>
	      <td>${vo.job }</td>
	    </tr>
	    <tr>
	      <th>취미</th>
	      <td>${vo.hobby }</td>
	    </tr>
	    <tr>
	      <td>정보공개</td>
	      <td>
	      	<c:if test="${vo.userinfo == 'OK'}">정보공개</c:if>
	      	<c:if test="${vo.userinfo != 'OK'}">정보 비공개</c:if>
		  </td>
	    </tr>
	     <tr>
	      <td colspan=2 class="tblfooter">
	          <input type="button" value="다시검색" onclick="location.href='<%=request.getContextPath()%>/memberSearch.do'" />
	      </td>
	    </tr>
	  </table>
	</c:if>
	<c:if test="${vo.userinfo != 'OK' }">
		 - ${vo.nickname } 님 정보 비공개
		 <tr>
      		<td colspan=2 class="tblfooter">
          	<input type="button" value="다시검색" onclick="location.href='<%=request.getContextPath()%>/memberSearch.do'" />
      		</td>
    	</tr>
	</c:if>
</form>
<p><br/></p>
</body>
</html>
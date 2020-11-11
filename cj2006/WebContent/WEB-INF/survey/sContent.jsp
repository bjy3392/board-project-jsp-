<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="../../include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sInput.jsp</title>
  <script>
  	function sDelCheck(){
  		var ans=confirm("삭제 하시겠습니까?");
  		if(ans) location.href="sDelete.su?idx=${vo.idx}"
  	}
  </script>
  <style>
   
    table, h2 {
      width : 100%;
      border-collapse : collapse;
      text-align: center;
    }
    th, td {
      border : 1px solid #ccc;
      padding: 15px;
    }
    th {
      width : 20%;
      background-color: LightGray ;
    }
    td {
      width : 80%;
    }
  </style>
</head>
<body>
<div class = "container" style="text-align:center">
  <p><br/></p>
  <form name="myform" method="post" action="${contextPath }/sUpdateOk.su">
    <h2>설문지 과정별 문항 등록</h2>
    <p></p>
    <table>
      <tr>
        <th>과정시작일자</th>
        <td><input type="date" name="sdate" size=70 class="form-control" value=${vo.sdate } required readonly/></td>
      </tr>
      <tr>
        <th>과 정 명</th>
        <td><input type="text" name="kwajung" size=70 class="form-control" value="${vo.kwajung }" required readonly/></td>
      </tr>
      <tr>
        <th>과 목 명</th>
        <td><input type="text" name="kwamok" size=70 class="form-control" value="${vo.kwamok }" autofocus required/></td>
      </tr>
      <tr>
        <th>능력단위코드</th>
        <td><input type="text" name="kcode" size=70 class="form-control" value="${vo.kcode }" required/></td>
      </tr>
      <tr>
        <th>능력단위명</th>
        <td><input type="text" name="danwi" size=70 class="form-control" value="${vo.danwi }" required/></td>
      </tr>
      <tr>
        <th>평가일시</th>
        <td><input type="text" name="wdate" size=70 class="form-control" value="${vo.wdate }" required/></td>
      </tr>
    </table>
    <br/>
    <table>
      <tr>
        <th>문항1</th>
        <td><input type="text" name="question1" size=70 class="form-control" value="${vo.question1 }"/></td>
      </tr>
      <tr>
        <th>문항2</th>
        <td><input type="text" name="question2" size=70 class="form-control" value="${vo.question2 }"/></td>
      </tr>
      <tr>
        <th>문항3</th>
        <td><input type="text" name="question3" size=70 class="form-control" value="${vo.question3 }"/></td>
      </tr>
      <tr>
        <th>문항4</th>
        <td><input type="text" name="question4" size=70 class="form-control" value="${vo.question4 }"/></td>
      </tr>
      <tr>
        <th>문항5</th>
        <td><input type="text" name="question5" size=70 class="form-control" value="${vo.question5 }"/></td>
      </tr>
      <tr>
        <th>문항6</th>
        <td><input type="text" name="question6" size=70 class="form-control" value="${vo.question6 }"/></td>
      </tr>
      <tr>
        <th>문항7</th>
        <td><input type="text" name="question7" size=70 class="form-control" value="${vo.question7 }"/></td>
      </tr>
      <tr class="active">
        <th>문항8</th>
        <td><input type="text" name="question8" size=70 class="form-control"  value="${vo.question8 }"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <c:if test="${slevel == '관리자' }">
          	<input type="submit" class="btn btn-outline-secondary" value="수정" /> &nbsp;
          	<input type="button" class="btn btn-outline-secondary" value="삭제" onclick="sDelCheck()" /> &nbsp;
          	<input type="reset" class="btn btn-outline-secondary" value="초기화" /> &nbsp;
          </c:if>
          <input type="button" class="btn btn-outline-secondary" value="설문참여" onclick="location.href='sAnswerInput.su?idx=${vo.idx }'"/>
          <input type="button" class="btn btn-outline-secondary" value="메뉴로 이동" onclick="location.href='sList.su?sdate=${vo.sdate}'"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="idx" value="${vo.idx }"/>
  </form>
</div>
</body>
</html>
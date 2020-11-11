<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sAList.jsp</title>
  <script>
  	function answerDelCheck(idx){
  		var ans = confirm("현재 답변내역을 삭제하시겠습니까?");
  		if(ans) location.href = "sAnswerDelete.su?idx=${vo.idx}&sdate=${vo.sdate}";
  	}
  </script>
  <style>
   body {
      width : 100%;
      margin : 0px auto;
    }
    table, h2 {
      margin : 0px auto;
      width: 800px;
      border-collapse: collapse;
      text-align: center;
    }
    th, td {
      margin : 0px auto;
      border: 1px solid #ccc;
      padding: 15px;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${contextPath}/sAnswerInputOk.su?sdate=${vo.sdate}">
    <h2>능력단위 종료 및  평가만족도 설문 결과</h2>
    <p></p>
    <table>
      <tr>
      <tr>
        <th>과 정 명</th>
        <td>${vo.kwajung}</td>
      </tr>
      <tr>
        <th>과 목 명</th>
        <td>${vo.kwamok}</td>
      </tr>
      <tr>
        <th>능력단위명</th>
        <td>${vo.kcode} ${vo.danwi}</td>
      </tr>
      <tr>
        <th>평가일시</th>
        <td>${vo.wdate}</td>
      </tr>
    </table>
    <br/>
    <table>
      <tr>
        <td rowspan=2>문항</td>
        <td colspan=6>점수배점</td>
      </tr>
      <tr>
        <td>매우만족(5)</td>
        <td>만족(4)</td>
        <td>보통(3)</td>
        <td>불만(2)</td>
        <td>매우불만(1)</td>
        <td>만족도</td>
      </tr>
      
      	<c:set var="cnt" value="0"/>
      	<c:forEach var="sAnswerArr" items="${vo.surveyAnswer }">
      	<tr>
      		<c:forEach var="question" items="${vo.question }" begin="${cnt }" end="${cnt }">
      			<td>${question }</td>
 				<c:set var="cnt" value="${cnt+1 }"/>
      		</c:forEach>
      		<c:set var="totBiyul" value ="0"/>
      		<c:forEach var="sAnswer" items="${sAnswerArr }" varStatus="st">
      			<td>${sAnswer }명<br/>(<fmt:formatNumber value="${sAnswer/vo.answerCnt }" type="percent" pattern="0.0%" />)</td>
      			<c:set var="totBiyul" value="${totBiyul + ((5-st.index)*sAnswer)}"/>
      		</c:forEach>
      		<td>
      			<c:set var="result" value="${totBiyul / (5*vo.answerCnt)*100 }"/>
      			<fmt:formatNumber value="${result }" type="percent" pattern="0.0점"/>
      		</td>
      	</tr>
      	</c:forEach>

      
      <tr>
        <td>${vo.question8}</td>
        <td colspan=6><textarea rows=8 cols=60 name="answer8" class="form-control">${vo.answer8 }</textarea></td>
      </tr>
      <tr>
        <td colspan=7>
          <input type="button" class="btn btn-outline-secondary" value="메뉴로이동" onclick="location.href='${contextPath}/sList.su?sdate=${vo.sdate}';"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="survey_idx" value=${vo.idx }>
  </form>
</div>
</body>
</html>
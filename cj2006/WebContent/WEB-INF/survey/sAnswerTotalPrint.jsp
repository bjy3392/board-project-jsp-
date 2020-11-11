<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/bs.jsp" %>
<%@ include file="../../include/sCheck.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sAList.jsp</title>
  <script>
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
    form p{
      margin : 0px auto;
      width: 800px;
    }
  </style>
</head>
<body>
<p><br/></p>
<c:set var="curNo" value="0"/>
<div class="container">
  <input type="button" class="btn btn-outline-secondary" value="전체출력" onclick="window.print();"/>
   <c:forEach var="vo" items="${vos }">
  	<p><br/></p>
    <h2>능력단위 종료 및  평가만족도 설문</h2>
    <c:set var="curNo" value="${curNo +1 }"/>
  <form name="myform" >
    <p><br/>총 ${vo.answerCnt }건 중에서 ${curNo }번째<br/></p>
    <table>
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
        <td colspan=5>점수배점</td>
      </tr>
      <tr>
        <td>매우만족(5)</td>
        <td>만족(4)</td>
        <td>보통(3)</td>
        <td>불만(2)</td>
        <td>매우불만(1)</td>
      </tr>
      <tr>
        <td>${vo.question1}</td>
        <td>${vo.answer1=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer1=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer1=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer1=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer1=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question2}</td>
        <td>${vo.answer2=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer2=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer2=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer2=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer2=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question3}</td>
        <td>${vo.answer3=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer3=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer3=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer3=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer3=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question4}</td>
        <td>${vo.answer4=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer4=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer4=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer4=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer4=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question5}</td>
        <td>${vo.answer5=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer5=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer5=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer5=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer5=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question6}</td>
        <td>${vo.answer6=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer6=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer6=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer6=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer6=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question7}</td>
        <td>${vo.answer7=='5' ? 'ㅇ' : '' }</td>
        <td>${vo.answer7=='4' ? 'ㅇ' : '' }</td>
        <td>${vo.answer7=='3' ? 'ㅇ' : '' }</td>
        <td>${vo.answer7=='2' ? 'ㅇ' : '' }</td>
        <td>${vo.answer7=='1' ? 'ㅇ' : '' }</td>
      </tr>
      <tr>
        <td>${vo.question8}</td>
        <td colspan=5><textarea rows=8 cols=100 name="answer8" class="form-control">${vo.answer8 }</textarea></td>
      </tr>
     <tr>
        <td colspan=6>
  		  <input type="button" class="btn btn-outline-secondary" value="이전화면" onclick="location.href='${contextPath}/sAResult.su?idx=${vo.survey_idx }&sdate=${sdate}';"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="survey_idx" value=${vo.idx }>
  </form>
  <p><br/></p>
  <p><br/></p>
  <p><br/></p>
  <p><br/></p>
  <p><br/></p>
  </c:forEach>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/nav.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sAnswerInput.jsp</title>
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
    <h2>능력단위 종료 및 평가 만족도 설문</h2>
    <br/>
    <table>
      <tr>
        <th>과정 시작일</th>
        <td>${fn:substring(vo.sdate,0,10) }</td>
      </tr>
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
        <td><input type="radio" name="answer1" value="5" /></td>
        <td><input type="radio" name="answer1" value="4" checked/></td>
        <td><input type="radio" name="answer1" value="3"/></td>
        <td><input type="radio" name="answer1" value="2"/></td>
        <td><input type="radio" name="answer1" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question2}</td>
        <td><input type="radio" name="answer2" value="5"/></td>
        <td><input type="radio" name="answer2" value="4" checked/></td>
        <td><input type="radio" name="answer2" value="3"/></td>
        <td><input type="radio" name="answer2" value="2"/></td>
        <td><input type="radio" name="answer2" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question3}</td>
        <td><input type="radio" name="answer3" value="5"/></td>
        <td><input type="radio" name="answer3" value="4" checked/></td>
        <td><input type="radio" name="answer3" value="3"/></td>
        <td><input type="radio" name="answer3" value="2"/></td>
        <td><input type="radio" name="answer3" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question4}</td>
        <td><input type="radio" name="answer4" value="5"/></td>
        <td><input type="radio" name="answer4" value="4" checked/></td>
        <td><input type="radio" name="answer4" value="3"/></td>
        <td><input type="radio" name="answer4" value="2"/></td>
        <td><input type="radio" name="answer4" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question5}</td>
        <td><input type="radio" name="answer5" value="5"/></td>
        <td><input type="radio" name="answer5" value="4" checked/></td>
        <td><input type="radio" name="answer5" value="3"/></td>
        <td><input type="radio" name="answer5" value="2"/></td>
        <td><input type="radio" name="answer5" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question6}</td>
        <td><input type="radio" name="answer6" value="5"/></td>
        <td><input type="radio" name="answer6" value="4" checked/></td>
        <td><input type="radio" name="answer6" value="3"/></td>
        <td><input type="radio" name="answer6" value="2"/></td>
        <td><input type="radio" name="answer6" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question7}</td>
        <td><input type="radio" name="answer7" value="5"/></td>
        <td><input type="radio" name="answer7" value="4" checked/></td>
        <td><input type="radio" name="answer7" value="3"/></td>
        <td><input type="radio" name="answer7" value="2"/></td>
        <td><input type="radio" name="answer7" value="1"/></td>
      </tr>
      <tr>
        <td>${vo.question8}</td>
        <td colspan=5><textarea rows=8 cols=60 name="answer8" class="form-control"></textarea></td>
      </tr>
      <tr>
        <td colspan=6>
          <input type="submit" class="btn btn-outline-secondary" value="설문참여" /> &nbsp;
          <input type="reset" class="btn btn-outline-secondary" value="다시작성" /> &nbsp;
          <input type="button" class="btn btn-outline-secondary" value="메뉴로이동" onclick="location.href='${contextPath}/sList.su?sdate=${vo.sdate}';"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="survey_idx" value=${vo.idx }>
  </form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/bs.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
  	
  	function totalPrint(){
  		var ans = confirm("현재 능력단위를 전체페이지로 인쇄 하시겠습니까?");
  		if(ans) location.href = "sAnswerTotalPrint.su?idx=${vo.survey_idx}&sdate=${vo.sdate}"
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
    form #btn{
      margin : 0px auto;
      width: 800px;
    }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${contextPath}/sAnswerInputOk.su?sdate=${vo.sdate}">
    <h2>능력단위 종료 및  평가만족도 설문</h2>
    <p><br/></p>
    <p id="btn">
    <c:if test="${vo.curNo > 1}">
   		<input type="button" class="btn btn-outline-secondary" value="이전" onclick="location.href='sAList.su?idx=${vo.survey_idx}&curNo=${vo.curNo - 1 }'"/>
    </c:if>
    <c:if test="${vo.curNo < vo.answerCnt}">
   		<input type="button" class="btn btn-outline-secondary" value="다음" onclick="location.href='sAList.su?idx=${vo.survey_idx}&curNo=${vo.curNo + 1 }'"/>
    </c:if>
    : 총 ${vo.answerCnt }건 중에서 ${vo.curNo }번째
    <input type="button" class="btn btn-outline-secondary" value="삭제" onclick="answerDelCheck()"/>
    <input type="button" class="btn btn-outline-secondary" value="결과보기" onclick="location.href='sAResult.su?idx=${vo.survey_idx}'"/>
    <br/></p>
    <p><br/></p>
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
        <td><input type="radio" name="answer1" value="5" ${vo.answer1=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer1" value="4" ${vo.answer1=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer1" value="3" ${vo.answer1=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer1" value="2" ${vo.answer1=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer1" value="1" ${vo.answer1=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question2}</td>
        <td><input type="radio" name="answer2" value="5" ${vo.answer2=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer2" value="4" ${vo.answer2=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer2" value="3" ${vo.answer2=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer2" value="2" ${vo.answer2=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer2" value="1" ${vo.answer2=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question3}</td>
        <td><input type="radio" name="answer3" value="5" ${vo.answer3=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer3" value="4" ${vo.answer3=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer3" value="3" ${vo.answer3=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer3" value="2" ${vo.answer3=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer3" value="1" ${vo.answer3=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question4}</td>
        <td><input type="radio" name="answer4" value="5" ${vo.answer4=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer4" value="4" ${vo.answer4=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer4" value="3" ${vo.answer4=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer4" value="2" ${vo.answer4=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer4" value="1" ${vo.answer4=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question5}</td>
        <td><input type="radio" name="answer5" value="5" ${vo.answer5=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer5" value="4" ${vo.answer5=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer5" value="3" ${vo.answer5=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer5" value="2" ${vo.answer5=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer5" value="1" ${vo.answer5=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question6}</td>
        <td><input type="radio" name="answer6" value="5" ${vo.answer6=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer6" value="4" ${vo.answer6=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer6" value="3" ${vo.answer6=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer6" value="2" ${vo.answer6=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer6" value="1" ${vo.answer6=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question7}</td>
        <td><input type="radio" name="answer7" value="5" ${vo.answer7=='5' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer7" value="4" ${vo.answer7=='4' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer7" value="3" ${vo.answer7=='3' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer7" value="2" ${vo.answer7=='2' ? 'checked' : '' }/></td>
        <td><input type="radio" name="answer7" value="1" ${vo.answer7=='1' ? 'checked' : '' }/></td>
      </tr>
      <tr>
        <td>${vo.question8}</td>
        <td colspan=5><textarea rows=8 cols=100 name="answer8" class="form-control">${vo.answer8 }</textarea></td>
      </tr>
      <tr>
        <td colspan=6>
          <input type="button" class="btn btn-outline-secondary" value="메뉴로이동" onclick="location.href='${contextPath}/sList.su?sdate=${vo.sdate}';"/>
          <input type="button" class="btn btn-outline-secondary" value="개별출력" onclick="window.print();"/>
          <input type="button" class="btn btn-outline-secondary" value="전체출력" onclick="totalPrint()"/>
        </td>
      </tr>
    </table>
    <input type="hidden" name="survey_idx" value=${vo.idx }>
  </form>
</div>
</body>
</html>
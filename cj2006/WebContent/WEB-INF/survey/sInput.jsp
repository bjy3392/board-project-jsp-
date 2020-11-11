<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="../../include/sCheck.jsp"%>
<%@ include file="../../include/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sInput.jsp</title>
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
  <form name="myform" method="post" action="${contextPath }/sInputOk.su">
    <h2>설문지 과정별 문항 등록</h2>
    <p></p>
    <table>
      <tr>
        <th>과정시작일자</th>
        <td><input type="date" name="sdate" size=70 class="form-control" value="2020-06-22" required/></td>
      </tr>
      <tr>
        <th>과 정 명</th>
        <td><input type="text" name="kwajung" size=70 class="form-control" value="자바(JAVA) & 스프링프레임워크 응용SW엔지니어링 양성과정" required/></td>
      </tr>
      <tr>
        <th>과 목 명</th>
        <td><input type="text" name="kwamok" size=70 class="form-control" autofocus required/></td>
      </tr>
      <tr>
        <th>능력단위코드</th>
        <td><input type="text" name="kcode" size=70 class="form-control" required/></td>
      </tr>
      <tr>
        <th>능력단위명</th>
        <td><input type="text" name="danwi" size=70 class="form-control" required/></td>
      </tr>
      <tr>
        <th>평가일시</th>
        <td><input type="text" name="wdate" size=70 class="form-control" required/></td>
      </tr>
    </table>
    <br/>
    <table>
      <tr>
        <th>문항1</th>
        <td><input type="text" name="question1" size=70 class="form-control" value="1. 능력단위 편성시간은 적절하십니까?"/></td>
      </tr>
      <tr>
        <th>문항2</th>
        <td><input type="text" name="question2" size=70 class="form-control" value="2. 능력단위 종료시 산출결과물에 만족하십니까?"/></td>
      </tr>
      <tr>
        <th>문항3</th>
        <td><input type="text" name="question3" size=70 class="form-control" value="3. 능력단위 평가시 평가시간은 적절하였습니까?"/></td>
      </tr>
      <tr>
        <th>문항4</th>
        <td><input type="text" name="question4" size=70 class="form-control" value="4. 능력단위 평가시 평가문항의 난이도는 적절하였습니까?"/></td>
      </tr>
      <tr>
        <th>문항5</th>
        <td><input type="text" name="question5" size=70 class="form-control" value="5. 능력단위 평가시 평가방법(서술형 평가 및 포트폴리오)은 적절하였습니까?"/></td>
      </tr>
      <tr>
        <th>문항6</th>
        <td><input type="text" name="question6" size=70 class="form-control" value="6. 능력단위 평가시 평가횟수는 적절하였습니까?"/></td>
      </tr>
      <tr>
        <th>문항7</th>
        <td><input type="text" name="question7" size=70 class="form-control" value="7. 능력단위 훈련교사에 대해 만족하십니까?"/></td>
      </tr>
      <tr class="active">
        <th>문항8</th>
        <td><input type="text" name="question8" size=70 class="form-control" value="8. 기타 및 건의사항"/></td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="submit" class="btn btn-outline-secondary" value="등록" /> &nbsp;
          <input type="reset" class="btn btn-outline-secondary" value="다시입력" /> &nbsp;
          <input type="button" class="btn btn-outline-secondary" value="메뉴로 이동" onclick="location.href='sList.su'"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
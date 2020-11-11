<%@page import="java.util.ArrayList"%>
<%@page import="cj2006.member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../../include/sCheck.jsp" %>
<%@ include file="../../include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl.jsp</title>
</head>
<body>
<p><br/></p>
<div style="text-align:center">
  <h2>JSTL 사용법</h2>
  <table border align="center" cellpadding=10>
    <tr>
      <th>라이브러리</th>
      <th>주소(URI)</th>
      <th>접두어(prefix)</th>
      <th>사용예</th>
    </tr>
    <tr>
      <td>Core</td>
      <td>http://java.sun.com/jsp.jstl/core</td>
      <td>c</td>
      <td>< c :태그...</td>
    </tr>
    <tr>
      <td>function</td>
      <td>http://java.sun.com/jsp.jstl/functions</td>
      <td>f n</td>
      <td>< f n:태그...</td>
    </tr>
    <tr>
      <td>formatting</td>
      <td>http://java.sun.com/jsp.jstl/fmt</td>
      <td>fmt</td>
      <td>< fm  t:태그...</td>
    </tr>
    <tr>
      <td>SQL</td>
      <td>http://java.sun.com/jsp.jstl/sql</td>
      <td>sql</td>
      <td>< sq  l:태그...</td>
    </tr>
  </table> 
</div>
<hr/>
<p>변수 선언하기</p>
<p><c:set var="su1" value="100"/></p>
<p>su1변수의 값을 출력 : <c:out value="${su1}"/> / ${su1}</p>
<hr/>
<%
	MemberVo vo = new MemberVo();
	vo.setName("홍깅돌이");
	vo.setIdx(200);
	request.setAttribute("vo", vo);
%>
<p>vo객체의 name>>: ${ vo.name }</p>
<c:set var="irum" value="${vo.name}"/>
<p>c:set 에 설정된 변수 irum : <c:out value="${irum }"></c:out></p>
<p>
	<c:set target="${vo }" property="name" value="강점찬"/> 
	-c:set에서 변경된 name : ${vo.name }
</p>
<hr/>
<p>if태그 : 조건식에서 사용</p>
<c:if test="${su1>50}">
	su1이 50보다 큽니다.
</c:if>	
<c:if test="${su1<=50}">
	su1이 50보다 크지 않습니다.
</c:if>
<hr/>
<c:if test="${su1 > vo.idx }">
	su1이 크다.
</c:if>
<c:if test="${su1 <= vo.idx }">
	idx가 크다.<br/>
</c:if>
<c:set var="vIdx" value="${vo.idx}"/>
<c:if test="${su1 <= vIdx }">
	vIdx가 크다.
</c:if>
<hr/>
<h3>다중조건비교(choose~~when~~otherwise)</h3>
<c:set var="su1" value="200"/>
<c:set var="su2" value="200"/>
<c:choose>
	<c:when test="${su1 > su2 }">
		su1이 su2보다 크다.
	</c:when>
	<c:when test="${su1 < su2 }">
		su1이 su2보다 크지않다.
	</c:when>
	<c:otherwise>
		su1과 su2는 같다.
	</c:otherwise>
</c:choose>
<br/>
<c:set var="jumsu" value="85"/>
내 점수는 ${jumsu} /
<c:choose>
	<c:when test="${jumsu >= 90 }">
		A학점
	</c:when>
	<c:when test="${jumsu >= 80 }">
		B학점
	</c:when>
	<c:when test="${jumsu >= 70 }">
		C학점
	</c:when>
	<c:when test="${jumsu >= 60 }">
		D학점
	</c:when>
	<c:otherwise>
		F학점
	</c:otherwise>
</c:choose>
<hr/>
<h3>반복문(forEach)</h3>
<div>
	<c:forEach begin="1" end="10" step="1" varStatus="num">
		- ${num.count}안녕<br/>		
	</c:forEach>
</div>
<hr/>
<div>
	<c:forEach var="no" begin="1" end="10" >
		- ${no}안녕<br/>		
	</c:forEach>
</div>
<hr/>
<h3>열거형 값(일종의 배열)을 출력한다.</h3>
<%
	pageContext.setAttribute("names", "홍길도,이기자,김말숙,이순식,오하능,강자찬");
%>
	<c:forEach var="name" begin="1" items="${names}" varStatus="num" >
		- ${num.count}::${name}<br/>		
	</c:forEach>
<hr/>
	<c:forEach var="name" begin="0" items="${names}" end="3" varStatus="num">
		- ${num.count}::${name}<br/>		
	</c:forEach>
<hr/>
<h3>배열로 전송된 자료의 출력</h3>
<%
	request.setAttribute("nos", new int[]{1,3,5,7,9});
%>
	<c:forEach var="no" items="${nos}" varStatus="num">
		- ${num.count}::${no}<br/>		
	</c:forEach>	
<hr/>
<%
	ArrayList<String> fruits = new ArrayList<>();
	fruits.add("사과");
	fruits.add("딸기");
	fruits.add("바나나");
	fruits.add("수박");
	request.setAttribute("fruits", fruits);
%>
<ul>
	<c:forEach var="fruit" items="${fruits}">
		<li>${fruit}</li>		
	</c:forEach>	
</ul>
<hr/>
<%
	ArrayList<MemberVo> vos = new ArrayList<>();	

	vo = new MemberVo();
	vo.setIdx(1);
	vo.setName("홍길동1");
	vo.setAddress("서울1");
	vo.setGender("남자1");
	vos.add(vo);
	
	vo = new MemberVo();
	vo.setIdx(2);
	vo.setName("홍길동2");
	vo.setAddress("서울2");
	vo.setGender("남자2");
	vos.add(vo);
	
	vo = new MemberVo();
	vo.setIdx(3);
	vo.setName("홍길동3");
	vo.setAddress("서울3");
	vo.setGender("남자3");
	vos.add(vo);
	
	request.setAttribute("vos", vos);
%>
	<c:forEach var="vo" items="${vos}" varStatus="st">
		<c:if test="${st.first }">
			시작자료
		</c:if>
		${vo.idx}<br/>	
		${vo.name}<br/>
		${vo.address}<br/>
		${vo.gender}<br/>
	</c:forEach>
<hr/>
<h3>특정기호로 분리하여 출력(forTokens)</h3>	
<%
	pageContext.setAttribute("hobbys", "등산/낚시/바둑/음악감상/영화감상/");
%>
<c:forTokens var="hobby" items="${hobbys}" delims="/">
	-취미 : ${hobby }<br/>
</c:forTokens>

<%
	
	pageContext.setAttribute("mauntains", new String[]{"백두산","한라산"});
	String mbc = "aDunDaiD";
	request.setAttribute("mbc", mbc);
	request.setAttribute("kbs", "kbs");
	request.setAttribute("sbs", "sbs");
%>
<c:set var="mauntains" value="${mauntains }"/>
<p>전달된자료의 길이: ${fn:length(mauntains) } </p>
<p>전달된 문자열의 길이: ${fn:length(mbc) }</p>
<p>전달된 문자열의 길이: ${fn:toUpperCase(mbc) }</p>
<p>전달된 문자열의 길이: ${fn:toLowerCase(mbc) }</p>
<p>지정된 문자열 추출(substring(문자열,시작문자위치,끝문자위치전까지)) : ${fn:substring(mbc,0,2) }</p>
<p><h2>문자열공백 무시(trim)</h2></p>
<p>
	- mbc+kbs+sbs 결합 : ${mbc }${kbs }${sbs }<br/>
	- 공백을 무시한 결합 : ${fn:trim(kbs) }
</p>
<p>
	<h2>특정문자열로 결합 : join(문자열, 문자열)</h2>
		-mountains배열에 저장된 문자열을 '@'기호로 결합해서 출력하라 :
		 	${fn:join(mauntains,'@') }
		 	<br/>
</p>
<p>
<h2>날짜변환</h2>
<c:set var="now" value="<%=new java.util.Date() %>"/>
-오늘날짜는 ? ${now }<br/>
<fmt:formatDate value="${now }"/><br/>
<fmt:formatDate value="${now }" pattern="yyyy년mm월dd일 hh시mm분ss초"/><br/>
</p>
</body>
</html>









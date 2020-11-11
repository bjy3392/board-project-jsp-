<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
  String[] jiyuk = {"010","02","031","032","033","041","042","043","051","052","053","061","062","063","064"};
  String[] addr = {"서울","경기도","강원도","충청남도","충청북도","전라남도","전라북도","경상남도","경상북도","제주도"};
  String[] email2 = {"없음","naver.com","hanmail.net","daum.net","gmail.com","nate.com","hotmail.com"};
  String[] job = {"학생","회사원","공무원","군인","가사","의사","변호사","검사","판사","자영업","경찰","기타"};
  String[] hobby = {"등산","낚시","싸이클","영화감상","음악감상","독서","수영","게임","꽃꽂이","요가","기타"};
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>mInput.jsp</title>
    <%@ include file="../include/bs.jsp" %>
  <script>
    function idCheck() {
    	var mid = myform.mid.value;
    	var url = "idCheck.jsp?mid="+mid;
    	
    	if(mid=="") {
    		alert("아이디를 입력하세요!");
    		myform.mid.focus();
    	}
    	else {
    		window.open(url,"nwin","width=400px, height=200px");
    	}
    }
    function nickCheck() {
    	var nickname = myform.nickname.value;
    	var url = "nickCheck.jsp?nickname="+nickname;
    	
    	if(nickname=="") {
    		alert("별명을 입력하세요!");
    		myform.nickname.focus();
    	}
    	else {
    		window.open(url,"nwin","width=400px, height=200px");
    	}
    }
    function fCheck() {
      var mid = myform.mid.value;
      var pwd1 = myform.pwd.value;
      var pwd2 = myform.pwd2.value;
      var nickname = myform.nickname.value;
      var name = myform.name.value;
      var tel1 = myform.tel1.value;
      var tel2 = myform.tel2.value;
      var tel3 = myform.tel3.value;
      myform.birth.value = myform.yy.value+"-"+myform.mm.value+"-"+myform.dd.value;
      myform.tel.value = tel1+"-"+tel2+"-"+tel3;
      myform.address.value = myform.address1.value+" "+myform.address2.value;
      myform.email.value = myform.email1.value+"@"+myform.email2.value;
      
      var hobbyImsi = document.getElementsByName("hobbyImsi");
      var hobbyLen = hobbyImsi.length;
      var hobbyRes = "";
      for(i=0; i<hobbyLen; i++) {
    	  if(hobbyImsi[i].checked == true) {
    		  hobbyRes += hobbyImsi[i].value + "/";
    	  }
      }
      myform.hobby.value = hobbyRes;
      
      // 아이디 체크
      if(mid == "" || mid.length > 20) {
    	  alert("아이디는 공백이 올수 없으며, 영문자와 숫자만 가능하고, 20자 이하를 사용하세요.");
    	  myform.mid.focus();
    	  return false;
      }
      else {
    	  for(i=0; i<mid.length; i++) {
    		  var ch = mid.charAt(i);
    		  if(!((ch>='a' && ch<='z') || (ch>='A' && ch<='Z') || (ch>='0' && ch<='9'))) {
    			  alert("아이디는 영문자와 숫자만 가능합니다.");
    			  myform.mid.focus();
    	    	return false;
    		  }
    	  }
      }
      
      // 기타 나머지 체크
      if(pwd1=="" || pwd1.length>20) {
    	  alert("비밀번호는 공백이 올수 없으며, 20자 이하만 가능합니다.");
  		  myform.pwd.focus();
      	return false;
      }
      else if(pwd1 != pwd2) {
    	  alert("비밀번호를 확인하세요.");
    	  myform.pwd.focus();
      }
      else if(nickname == "" || nickname.length > 20) {
    	  alert("닉네임은 공백이 올수 없으며, 20자 이하만 가능합니다.");
  		  myform.nickname.focus();
      	return false;
      }
      else if(name == "" || name.length > 20) {
    	  alert("성명은 공백이 올수 없으며, 20자 이하만 가능합니다.");
  		  myform.name.focus();
      	return false;
      }
      else if(tel2=="" || tel3=="" || isNaN(tel2) || isNaN(tel3)) {
    	  alert("전화번호는 숫자만 가능합니다.");
  		  myform.tel2.focus();
      	return false;
      }
      else {
    	  myform.submit();
      }
    }
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
<%@ include file="../include/nav.jsp" %>
<p><br/></p>
<form name="myform" method="post" action="<%=request.getContextPath()%>/member/MInput">
  <h2>회 원 가 입</h2>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <input type="text" name="mid" autofocus placeholder="아이디를 입력하세요"/>
        <input type="button" value="아이디중복확인" onClick="idCheck()"/>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pwd" /></td>
    </tr>
    <tr>
      <th>비밀번호확인</th>
      <td><input type="password" name="pwd2" /></td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td>
        <input type="text" name="nickname" placeholder="별명을 입력하세요"/>
        <input type="button" value="별명중복확인" onClick="nickCheck()"/>
      </td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name" placeholder="성명을 입력하세요"/></td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
        <input type="radio" name="gender" value="남자" checked/>남자
        <input type="radio" name="gender" value="여자"/>여자
      </td>
    </tr>
    <tr>
      <th>생일</th>
      <td>
        <select name="yy" size=1>
        <%for(int i=2020; i>=1960; i--) { %>
            <option value="<%=i%>"><%=i%></option>
        <%} %>
        </select>년&nbsp;
        <select name="mm" size=1>
        <%for(int i=1; i<=12; i++) { %>
            <option value="<%=i%>"><%=i%></option>
        <%} %>
        </select>월&nbsp;
        <select name="dd" size=1>
        <%for(int i=1; i<=31; i++) { %>
            <option value="<%=i%>"><%=i%></option>
        <%} %>
        </select>일
      </td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td>
        <select name="tel1" size=1>
        <%for(int i=0; i<jiyuk.length; i++) { %>
            <option value="<%=jiyuk[i]%>"><%=jiyuk[i]%></option>
        <%} %>
        </select>-
        <input type="text" name="tel2" size=8 maxlength=4/>-
        <input type="text" name="tel3" size=8 maxlength=4/>
      </td>
    </tr>
    <tr>
      <th>주소</th>
      <td>
        <select name="address1" size=1>
        <%for(int i=0; i<addr.length; i++) { %>
            <option value="<%=addr[i]%>"><%=addr[i]%></option>
        <%} %>
        </select>
        <input type="text" name="address2"/>
      </td>
    </tr>
    <tr>
      <th>전자우편</th>
      <td>
        <input type="text" name="email1" size="10"/>@
        <select name="email2" size=1>
        <%for(int i=0; i<email2.length; i++) { %>
            <option value="<%=email2[i]%>"><%=email2[i]%></option>
        <%} %>
        </select>
      </td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td><input type="text" name="homepage" value="http://" size="50"/></td>
    </tr>
    <tr>
      <th>직업</th>
      <td>
        <select name="job" size=1>
        <%for(int i=0; i<job.length; i++) { %>
            <option value="<%=job[i]%>"><%=job[i]%></option>
        <%} %>
        </select>
      </td>
    </tr>
    <tr>
      <th>취미</th>
      <td>
        <%for(int i=0; i<hobby.length; i++) { %>
            <input type="checkbox" name="hobbyImsi" value="<%=hobby[i]%>"><%=hobby[i]%>&nbsp;
        <%} %>
      </td>
    </tr>
    <tr>
      <td>정보공개</td>
      <td>
        <input type="radio" name="userinfor" value="OK" checked/>공개&nbsp;&nbsp;
        <input type="radio" name="userinfor" value="NO"/>비공개
      </td>
    </tr>
    <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="회원가입" onclick="fCheck()"/>
          <input type="reset" value="다시입력"/>
          <input type="button" value="돌아가기" onclick="location.href='<%=request.getContextPath() %>/member/login.jsp';"/>
      </td>
    </tr>
  </table>
  <input type="hidden" name="birth"/>
  <input type="hidden" name="tel"/>
  <input type="hidden" name="address"/>
  <input type="hidden" name="email"/>
  <input type="hidden" name="hobby"/>
</form>
<p><br/></p>
</body>
</html>
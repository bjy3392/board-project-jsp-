<%@page import="cj2006.member.MemberVo"%>
<%@page import="cj2006.member.MemberDao"%>
<%@ include file="../include/sCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
  String[] jiyuk = {"010","02","031","032","033","041","042","043","051","052","053","061","062","063","064"};
  String[] addr = {"서울","경기도","강원도","충청남도","충청북도","전라남도","전라북도","경상남도","경상북도","제주도"};
  String[] email2 = {"없음","naver.com","hanmail.net","daum.net","gmail.com","nate.com","hotmail.com"};
  String[] job = {"학생","회사원","공무원","군인","가사","의사","변호사","검사","판사","자영업","경찰","기타"};
  String[] hobby = {"등산","낚시","싸이클","영화감상","음악감상","독서","수영","게임","꽃꽂이","요가","기타"};
%>
<%
	request.setCharacterEncoding("utf-8");
	
	String smid3 = (String)session.getAttribute("smid");

	MemberDao dao = new MemberDao();
	
	MemberVo vo = dao.mSearch("mid",smid3);
	
	//생년월일 분리작업
	String temp = vo.getBirth();
	int yy = Integer.parseInt(temp.substring(0, 4));
	int mm = Integer.parseInt(temp.substring(5, 7));
	int dd = Integer.parseInt(temp.substring(8, 10));
	
	//전화번호 분리작업
	temp = vo.getTel();
	String[] tel = temp.split("-");
	
	//주소분리작업
	temp = vo.getAddress() ==null ? " " : vo.getAddress();
	String address1 = temp.substring(0,temp.indexOf(" "));
	String address2 = temp.substring(temp.indexOf(" ")+1);
	
	//메일 분리
	temp = vo.getEmail();
	String email1 = temp.substring(0,temp.indexOf("@"));
	String emailaddr = temp.substring(temp.indexOf("@")+1);
	
	//취미분리작업
	temp = vo.getHobby();
	String[] hobbys = temp.split("/");
	if(hobbys== null && hobbys.length == 0){
		hobbys[0] = "";
	}
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
<form name="myform" method="post" action="<%=request.getContextPath()%>/member/MUpd">
  <h2>회 원 정 보 수 정</h2>
  <table>
    <tr>
      <th>아이디</th>
      <td>
        <%=vo.getMid() %>
      </td>
    </tr>
    <tr>
      <th>비밀번호</th>
      <td><input type="password" name="pwd" value="<%=vo.getPwd() %>" /></td>
    </tr>
    <tr>
      <th>비밀번호확인</th>
      <td><input type="password" name="pwd2" value="<%=vo.getPwd() %>"/></td>
    </tr>
    <tr>
      <th>닉네임</th>
      <td>
        <input type="text" name="nickname" value="<%=vo.getNickname() %>"/>
        <input type="button" value="별명중복확인" onClick="nickCheck()"/>
      </td>
    </tr>
    <tr>
      <th>성명</th>
      <td><input type="text" name="name" value="<%=vo.getName() %>"/></td>
    </tr>
    <tr>
      <th>성별</th>
      <td>
        <input type="radio" name="gender" value="남자" <%if(vo.getGender().equals("남자")) { %> checked <%} %>/>남자
        <input type="radio" name="gender" value="여자" <%if(vo.getGender().equals("여자")) { %> checked <%} %>/>여자
      </td>
    </tr>
    <tr>
      <th>생일</th>
      <td>
        <select name="yy" size=1>
        <%for(int i=2020; i>=1960; i--) { %>
            <option value="<%=i%>" <%if(yy==i){%> selected <%}%> ><%=i%></option>
        <%} %>
        </select>년&nbsp;
        <select name="mm" size=1>
        <%for(int i=1; i<=12; i++) { %>
            <option value="<%=i%>" <%if(mm==i){%> selected <%}%>><%=i%></option>
        <%} %>
        </select>월&nbsp;
        <select name="dd" size=1>
        <%for(int i=1; i<=31; i++) { %>
            <option value="<%=i%>" <%if(dd==i){%> selected <%}%>><%=i%></option>
        <%} %>
        </select>일
      </td>
    </tr>
    <tr>
      <th>전화번호</th>
      <td>
        <select name="tel1" size=1>
        <%for(int i=0; i<jiyuk.length; i++) { %>
            <option value="<%=jiyuk[i]%>" <%if(tel[0].equals(jiyuk[i])){%> selected <%}%> ><%=jiyuk[i]%></option>
        <%} %>
        </select>-
        <input type="text" name="tel2" size=8 maxlength=4 value="<%=tel[1] %>"/>-
        <input type="text" name="tel3" size=8 maxlength=4 value="<%=tel[2] %>"/>
      </td>
    </tr>
    <tr>
      <th>주소</th>
      <td>
        <select name="address1" size=1>
        <%for(int i=0; i<addr.length; i++) { %>
            <option value="<%=addr[i]%>" <%if(address1.equals(addr[i])){%> selected <%}%> ><%=addr[i]%></option>
        <%} %>
        </select>
        <input type="text" name="address2" value="<%=address2%>"/>
      </td>
    </tr>
    <tr>
      <th>전자우편</th>
      <td>
        <input type="text" name="email1" value="<%=email1%>"  size="10"/>@
        <select name="email2" size=1>
        <%for(int i=0; i<email2.length; i++) { %>
            <option value="<%=email2[i]%>"  <%if(emailaddr.equals(email2[i])){%> selected <%}%> ><%=email2[i]%></option>
        <%} %>
        </select>
      </td>
    </tr>
    <tr>
      <th>홈페이지</th>
      <td><input type="text" name="homepage" value="<%=vo.getHomepage()%>" size="50"/></td>
    </tr>
    <tr>
      <th>직업</th>
      <td>
        <select name="job" size=1>
        <%for(int i=0; i<job.length; i++) { %>
            <option value="<%=job[i]%>" <%if(vo.getJob().equals(job[i])){%> selected <%}%> ><%=job[i]%></option>
        <%} %>
        </select>
      </td>
    </tr>
    <tr>
      <th>취미</th>
      <td>
        <%for(int i=0; i<hobby.length; i++) { 
        	int sw = 0 ;
        	for(int j=0; j<hobbys.length; j++){
        		if(hobbys[j].equals(hobby[i])){
        			sw=1;
        			break;
        		}
        	}
        %>
            <input type="checkbox" name="hobbyImsi" value="<%=hobby[i]%>"  <%if(sw==1){%> checked <%}%>><%=hobby[i]%> &nbsp;
        <%} %>
      </td>
    </tr>
    <tr>
      <td>정보공개</td>
      <td>
        <input type="radio" name="userinfor" value="OK" <%if(vo.getUserinfo().equals("OK")){%> checked <%}%>/>공개&nbsp;&nbsp;
        <input type="radio" name="userinfor" value="NO" <%if(vo.getUserinfo().equals("NO")){%> checked <%}%>/>비공개
      </td>
    </tr>
    <tr>
      <td colspan=2 class="tblfooter">
          <input type="button" value="회원정보수정" onclick="fCheck()"/>
          <input type="reset" value="다시입력"/>
      </td>
    </tr>
  </table>
  <input type="hidden" name="mid" value="<%= vo.getMid()%>"/>
  <input type="hidden" name="birth"/>
  <input type="hidden" name="tel"/>
  <input type="hidden" name="address"/>
  <input type="hidden" name="email"/>
  <input type="hidden" name="hobby"/>
</form>
<p><br/></p>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>checkbox</title>
</head>
<body>
	<h2>라디오버튼값 전송</h2>
    <form name="myform" method="get" action="t3_checkboxOk.jsp">
        <p>이름 <input type="text" name="name"/></p>
        <p>사용가능한 컴퓨터 언어<br/>
            <input type="checkbox" name="language" value="Java"/>Java
            <input type="checkbox" name="language" value="SQL"/>SQL
            <input type="checkbox" name="language" value="HTML5"/>HTML5
            <input type="checkbox" name="language" value="CSS3"/>CSS3
            <input type="checkbox" name="language" value="JAvaScript"/>JAvaScript
            <input type="checkbox" name="language" value="jQuery"/>jQuery
            <input type="checkbox" name="language" value="aJax"/>aJax
            <input type="checkbox" name="language" value="JSP"/>JSP
            <input type="checkbox" name="language" value="SpringFramework"/>SpringFramework
            <input type="checkbox" name="language" value="Python"/>Python
          </p>
          <p>기타 가능언어 : <input type="text" name="otherlang"></p>
        <p><input type="submit" value="전송"/>
            <input type="reset" value="취소"/></p>
    </form>
</body>
</html>
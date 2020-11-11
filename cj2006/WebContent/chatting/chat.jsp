<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ include file="../include/sCheck.jsp" %>
<%@ include file="../include/nav.jsp" %>
<% String nickname = (String) session.getAttribute("snickname"); %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="vieport" content="width=device-width, initial-scale=1">
  <title>chatting</title>
  <link rel="stylesheet" type="text/css" href="./css/chat.css">
  <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="./js/bootstrap.js"></script>
  <script>
  		var lastIdx = 0; //마지막 접속자의 채팅 고유번호를 받기위한 변수를 전역변수로 선언
  		
  		$(document).ready(function(){
  			chatListFunction("ten");
  			
  			getInfiniteChat();
  		});
  		
  		//페이지가 로딩된후 다시 2초에 한번씯 새로운 메세지가 있는지 서버에서 읽어온다.
  		function getInfiniteChat() {
	    	setInterval(function() {
	    		chatListFunction(lastIdx);
	    	}, 2000);
    	}
  
		function submitFunction(){
			var name = $("#name").val();
			var content = $("#content").val();
			var avatar = document.myform.avatar.value;
			
			$.ajax({
				url : "${contextPath}/chatinput",
				type : "post",
				data : {
					name : encodeURIComponent(name),
					content: encodeURIComponent(content),
					avatar : avatar					
				}
			});
			$("#content").val("");
			$("#content").focus();
		}
		
		// chatlist컨트롤러를 호출하여 데이터를 json형태로 가져와서 출력시켜준다.
		function chatListFunction(typeIdx) {
			$.ajax({
				url : "${contextPath}/chatlist",
				type:"post",
				data: {
					listType : typeIdx
				},
				success: function(data) {
					if(data == "") return;
					var parsed = JSON.parse(data);
					var res = parsed.res;
					for(var i=0; i<res.length; i++) {
						addChat(res[i][1].value,res[i][2].value,res[i][3].value,res[i][4].value);
					}
					lastIdx = Number(parsed.last)
				}
			});
		}
		
		function addChat(name, content, cdate, avatar) {
		      $("#chatList").append("<div class='row'" + 
		          "<div class='col-lg-12'>" +
		          "<div class='media'>" +
		          "<a class='pull-left' href='#'>" +
		          "<img class='media-object img-circle' src='./images/avatar"+avatar+".png' width='50px' alt=''>" +
		          "</a>" +
		          "<div class='media-body'>" +
		          "<h4 class='media-heading'>" +
		          name +
		          "<span class='small pull-right'>" +
		          cdate +
		          "&nbsp; </span>" +
		          "</h4>" +
		          "<p>" +
		          content +
		          "</p>" +
		          "</div>" +
		          "</div>" +
		          "</div>" +
		          "</div>" +
		          "<hr>");
		      	$("#chatList").scrollTop($("#chatList")[0].scrollHeight);
		    }

		$(function() {
			$("textarea").on("keydown", function(event) {
				if(event.keyCode == 13){
					if(!event.shiftKey){
						event.preventDefault();					
						submitFunction();
					}
				}
			});			
		});
		
  </script>
</head>
<body onLoad="document.myform.content.focus()">
                    
<div class="container bootstrap snippet">
    <div class="row">
        <!-- <div class="col-md-4 col-md-offset-4"> -->
          <div class="col-xs-12">
            <div class="portlet portlet-default">
                <div class="portlet-heading">
                    <div class="portlet-title">
                        <h4><i class="fa fa-circle text-green"></i>채팅방</h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="chat" class="panel-collapse collapse in">
					<!-- id가 chatList인 아래 두둘에 실제 채팅으로 주고 받는 대화가 삽입된다. -->
                    <div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
                    
                    </div>
                    <div class="portlet-footer">
                        <form role="form" name="myform" id="myform" onSubmit="return false;">
                            <div class="row">
                              <div class="form-group col-xs-12">
                                <input type="text" style="height:30px;" id="name" value="<%=nickname%>" readonly />
                                
                                &nbsp;&nbsp;&nbsp;
                                <input type="radio" id="avatar" name="avatar" value="1" checked /><img src="./images/avatar1.png" width="22px" alt="" class="img-circle" /> &nbsp;
                                <input type="radio" id="avatar" name="avatar" value="2" /><img src="./images/avatar2.png" width="22px" alt="" class="img-circle" /> &nbsp;
                                <input type="radio" id="avatar" name="avatar" value="3" /><img src="./images/avatar3.png" width="22px" alt="" class="img-circle" /> &nbsp;
                                <input type="radio" id="avatar" name="avatar" value="4" /><img src="./images/avatar4.png" width="22px" alt="" class="img-circle" /> &nbsp;
                                <input type="radio" id="avatar" name="avatar" value="5" /><img src="./images/avatar5.png" width="22px" alt="" class="img-circle" />
                              </div>
                            </div>
                            <div class="row" style="height:90px;">
                              <div class="form-group col-xs-10">
                                  <textarea style="height:80px;" id="content" class="form-control" placeholder="Enter message..." maxlength="200"></textarea>
                              </div>
                              <div class="form-group col-xs-2">
                                  <button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
                                  <div class="clearfix"></div>
                              </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

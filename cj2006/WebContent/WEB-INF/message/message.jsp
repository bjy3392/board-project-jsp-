<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>message.jsp</title>
	<script>
		var msg = "${msg}";
		var url = "${url}";
		if(msg == "boardInputOk"){
			var msg = "게시글이 등록되었습니다.";
		}
		else if(msg == "boardDeleteOk"){
			msg = "게시글이 삭제 되었습니다.";
		}
		else if(msg == "boardDeleteNo"){
			msg = "게시글이 삭제 되지 않았습니다.";
		}
		else if(msg == "boardUpdateOk"){
			msg = "게시글이 수정되었습니다.";
		}
		else if(msg == "upLoadOk"){
			msg = "파일이 업로드 되었습니다.";
		}
		else if(msg == "upLoadNo"){
			msg = "파일이 업로드 실패.";
		}
		else if(msg == "APDeleteAllOk"){
			msg = "임시파일의 모든 파일 삭제";
		}
		else if(msg == "surveyInputOk"){
			msg = "설문항목 등록이 완료되었습니다.";
		}
		else if(msg == "answerInputOk"){
			msg = "설문제출이 완료되었습니다.";
		}
		else if(msg == "surveyUpdateOk"){
			msg = "설문내용이 수정되었습니다.";
		}
		else if(msg == "surveyDeleteOk"){
			msg = "설문내용이 삭제되었습니다.";
		}
		else if(msg == "surveyDeleteNo"){
			msg = "설문내용이 삭제되지 않았습니다.";
		}
		else if(msg == "surveyAnswerDeleteOk"){
			msg = "설문 답변이 삭제되었습니다.";
		}
		else if(msg == "scContentOk"){
			msg = "일정이 등록/수정되었습니다.";
		}
		else if(msg == "scDeleteOk"){
			msg = "삭제가 완료되었습니다.";
		}
		else if(msg == "webInputOk"){
			msg = "메세지를 보냈습니다.";
		}
		else if(msg == "webInputNo"){
			msg = "잘못된 아이디 입니다.";
		}
		else if(msg == "wmDeleteOk"){
			msg = "휴지통으로 이동되었습니다.";
		}
		else if(msg == "wmSendDeleteOk"){
			msg = "보낸메세지함에서 삭제되었습니다.";
		}
		else if(msg == "wmDeleteDeleteOk"){
			msg = "휴지통에서 삭제되었습니다.";
		}
		else if(msg == "wmTrashDeleteOk"){
			msg = "휴지통을 비웠습니다.";
		}
		alert(msg);
		if(url != "") location.href = url;
	</script>
</head>
<body>

</body>
</html>
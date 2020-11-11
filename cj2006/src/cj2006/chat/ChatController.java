package cj2006.chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatinput")
public class ChatController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String nickname = URLDecoder.decode(request.getParameter("name"),"UTF-8"); //인코딩한 자료를 다시 디코딩
		String content = URLDecoder.decode(request.getParameter("content"),"UTF-8"); 
		String avatar = request.getParameter("avatar"); 
		
		//닉네임 또는 내용이 없ㅇ면 '0'으로, 있으면 DAO 객체 생성 후 입력처리
		if(nickname==null || nickname.equals("") || content==null || content.equals("")) {
			response.getWriter().write("0");
		}
		else {
			response.getWriter().write(new ChatDao().chatInput(nickname, content, avatar));
		}
	}
}

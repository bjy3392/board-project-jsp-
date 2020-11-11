package cj2006.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatlist")
public class ChatListController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String listType = request.getParameter("listType");
		
		if(listType==null || listType.equals("")) {
			response.getWriter().write("");
		}
		else if(listType.equals("ten")){ 
			response.getWriter().write(getTen());
		}
		else {
			try {
				response.getWriter().write(getIdx(listType));
			}catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}

	//마지막 접속한 idx 이후 자료만 다시 호출
	private String getIdx(String idx) {
		ChatDao dao = new ChatDao();
		ArrayList<ChatVo> vos = dao.chatList(idx);
		ChatVo vo = new ChatVo();
		
		StringBuffer res = new StringBuffer();
		res.append("{\"res\":[");
	    
	    for(int i=0; i<vos.size(); i++) {
	      vo = vos.get(i);
	      res.append("[{\"value\": \""+vo.getIdx()+"\"},");
	      res.append("{\"value\": \""+vo.getNickname()+"\"},");
	      res.append("{\"value\": \""+vo.getContent()+"\"},");
	      res.append("{\"value\": \""+vo.getCdate()+"\"},");
	      res.append("{\"value\": \""+vo.getAvatar()+"\"}]");
	      if(i != (vos.size() - 1)) res.append(",");
	    }
	    res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		
		return res.toString();
	}


	//최근 10개의 자료만 호출하여 채팅창으로 보낸다. (vo에 자료를 담아온후 json형식으로 변환해서 보여준다.)
	private String getTen() {
		ChatDao dao = new ChatDao();
		ArrayList<ChatVo> vos = dao.chatList(10);
		ChatVo vo = new ChatVo();
		
		StringBuffer res = new StringBuffer();
		res.append("{\"res\":[");
	    
	    for(int i=0; i<vos.size(); i++) {
	      vo = vos.get(i);
	      res.append("[{\"value\": \""+vo.getIdx()+"\"},");
	      res.append("{\"value\": \""+vo.getNickname()+"\"},");
	      res.append("{\"value\": \""+vo.getContent()+"\"},");
	      res.append("{\"value\": \""+vo.getCdate()+"\"},");
	      res.append("{\"value\": \""+vo.getAvatar()+"\"}]");
	      if(i != (vos.size() - 1)) res.append(",");
	    }
	    res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		
		return res.toString();
	}
}

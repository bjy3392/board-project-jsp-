package cj2006.webmessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WMessageListCommand implements WebMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		
		String mid = (String)session.getAttribute("smid");
		int msw = request.getParameter("msw")==null ? 1:Integer.parseInt(request.getParameter("msw"));
		int premsw = request.getParameter("premsw")==null ? 1:Integer.parseInt(request.getParameter("premsw"));
		int idx = request.getParameter("idx")==null ? 1:Integer.parseInt(request.getParameter("idx"));
		String receiveId = request.getParameter("sendId")==null ? "":request.getParameter("sendId");

		WebMessageDao dao = new WebMessageDao();
		WebMessageVo vo = new WebMessageVo();
		
		int cnt = dao.wmCount(mid); 
		
		if(msw == 0) { //메세지 작성, 답장하기 클릭했을때
			request.setAttribute("receiveId", receiveId);
			request.setAttribute("msw", msw);
		} 
		else if(msw == 7) { //메세지 내용을 보려고 할 때
			vo = dao.wmMessageOne(idx,mid);
			request.setAttribute("vo", vo);
			request.setAttribute("premsw", premsw);
		}
		else { //메세지 리스트와 새 매세지 리스트 보기			
			ArrayList<WebMessageVo> vos = dao.wMessageList(mid, msw);
			request.setAttribute("vos", vos);
		}

		request.setAttribute("msw", msw);
		request.setAttribute("cnt", cnt);
		
	}

}

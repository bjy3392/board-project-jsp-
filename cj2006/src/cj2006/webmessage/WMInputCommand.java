package cj2006.webmessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WMInputCommand implements WebMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebMessageVo vo = new WebMessageVo();
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setSendId(request.getParameter("sendId"));
		vo.setReceiveId(request.getParameter("receiveId"));
		
		WebMessageDao dao = new WebMessageDao();
		
		int res = dao.wmInput(vo);
		
		if(res == 0) {
			request.setAttribute("msg", "webInputNo");
			request.setAttribute("url",  request.getContextPath() + "/webMessageList.wm?msw=0");
		}
		else {     
			request.setAttribute("msg", "webInputOk");
			request.setAttribute("url", request.getContextPath() + "/webMessageList.wm?msw=1");
		}
	}

}

package cj2006.webmessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WMDeleteOkCommand implements WebMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("smid");
		
		WebMessageDao dao = new WebMessageDao();
		dao.wmTrashDelete(mid);
		
		request.setAttribute("msg", "wmTrashDeleteOk");
		request.setAttribute("url", request.getContextPath()+"/webMessageList.wm?msw=5");
		
	}	

}

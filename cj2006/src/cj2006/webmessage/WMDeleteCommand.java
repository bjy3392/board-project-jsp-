package cj2006.webmessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WMDeleteCommand implements WebMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idx = Integer.parseInt(request.getParameter("idx"));
		int premsw = request.getParameter("premsw")==null ? 1:Integer.parseInt(request.getParameter("premsw"));
		
		
		WebMessageDao dao = new WebMessageDao();
		dao.wmDelete(idx, premsw);
		
		if(premsw == 3) {
			request.setAttribute("msg", "wmSendDeleteOk");
		}
		else if(premsw == 5) {
			request.setAttribute("msg", "wmDeleteDeleteOk");
		}
		else {
			request.setAttribute("msg", "wmDeleteOk");			
		}
		request.setAttribute("url", request.getContextPath()+"/webMessageList.wm?msw="+premsw);
		
	}

}

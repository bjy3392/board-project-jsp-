package cj2006.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BUpdateOkCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 1 :Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String search = request.getParameter("search") ==null ? "" : request.getParameter("search");
		String searchStr = request.getParameter("searchStr") ==null ? "" : request.getParameter("searchStr");
		

		vo.setTitle(request.getParameter("title"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setHostip(request.getParameter("hostip"));
		vo.setContent(request.getParameter("content"));
		
		int res = dao.boardUpdate(idx,vo);
		
		if(res == 1) {
			request.setAttribute("msg", "boardUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/bContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize+"&search="+search+"&searchStr="+searchStr);
		}
		
	}

}

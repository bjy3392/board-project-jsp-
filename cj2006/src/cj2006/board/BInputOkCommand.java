package cj2006.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BInputOkCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardDao dao = new BoardDao();
		BoardVo vo = new BoardVo();
		
		vo.setName(request.getParameter("name"));
		vo.setTitle(request.getParameter("title"));
		vo.setEmail(request.getParameter("email"));
		vo.setHomepage(request.getParameter("homepage"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setHostip(request.getParameter("hostip"));
		
		int res = dao.boardInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "boardInputOk");
			request.setAttribute("url", request.getContextPath()+"/bList.bo");
		}
		
	}

}

package cj2006.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bReplyInput")
public class BReplyInputOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardContVo cvo = new BoardContVo();
		
		cvo.setBoard_idx(Integer.parseInt(request.getParameter("bidx"))); 
		cvo.setNickname(request.getParameter("nick"));
		cvo.setHostip(request.getParameter("hostip")); 
		cvo.setContent(request.getParameter("cont"));
		
		
		response.getWriter().write(replyInput(cvo));
	}

	private String replyInput(BoardContVo cvo) {
		BoardDao dao = new BoardDao();
		dao.boardContInput(cvo);
		
		return "1";
	}
}

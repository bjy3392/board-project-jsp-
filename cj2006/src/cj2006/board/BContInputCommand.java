package cj2006.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BContInputCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao();
		BoardContVo cvo = new BoardContVo();
		
		int board_idx = Integer.parseInt(request.getParameter("board_idx"));
		
		cvo.setBoard_idx(board_idx);
		cvo.setNickname(request.getParameter("nickname"));
		cvo.setHostip(request.getParameter("hostip"));
		cvo.setContent(request.getParameter("content"));
		
		dao.boardContInput(cvo);
	}

}

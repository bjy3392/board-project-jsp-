package cj2006.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BContentCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 1 :Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String search = request.getParameter("search") ==null ? "" : request.getParameter("search");
		String searchStr = request.getParameter("searchStr") ==null ? "" : request.getParameter("searchStr");
		
		BoardDao dao = new BoardDao();
		BoardVo vo = dao.getBoardContent(idx);
		
		if(search.equals("") || searchStr.equals("")) {
			vo.setPreIdx(dao.keySearch("pre",idx));
			vo.setNextIdx(dao.keySearch("next",idx));
		}
		else{
			vo.setPreIdx(dao.keySearch(search,searchStr,"pre",idx));
			vo.setNextIdx(dao.keySearch(search,searchStr,"next",idx));
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("search", search);
		request.setAttribute("searchStr", searchStr);
		
		//댓글 표시를 위한 작업처리
		ArrayList<BoardContVo> cvos = dao.getcontList(idx);
		request.setAttribute("cvos", cvos);
		
		//이전글,다음글 검색해오기
		//dao.keySearch("pre",idx);
		//dao.keySearch("next",idx);
		
	}

}

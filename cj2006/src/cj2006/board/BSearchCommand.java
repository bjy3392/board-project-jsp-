package cj2006.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BSearchCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardDao dao = new BoardDao();
		String search = request.getParameter("search") ==null ? "" : request.getParameter("search");
		String searchStr = request.getParameter("searchStr") ==null ? "" : request.getParameter("searchStr");
		
		int pageSize = request.getParameter("pageSize") ==  null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
	    int blockSize = 3; // 한개 블록의 크기
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int totRecCnt = dao.totGecCnt(search, searchStr);  //총 레코드 건수 계산하기
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
		int totBlock = (totPage % blockSize) == 0 ? (totPage/blockSize) : (totPage/blockSize)+1 ;
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		//ArrayList<BoardVo> vos = dao.getBoardSearch(search, searchStr );
		
		//request.setAttribute("vos", vos); 
		request.setAttribute("blockSize", blockSize);
	    request.setAttribute("pageSize", pageSize);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrNo", curScrNo);
		request.setAttribute("totBlock", totBlock);
	}

}

package cj2006.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BListCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		BoardDao dao = new BoardDao();
		ArrayList<BoardVo> vos = null;
		
		//페이지 블럭 처리
		int pageSize = request.getParameter("pageSize") ==  null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
	    int blockSize = 3; // 한개 블록의 크기
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int totRecCnt = dao.totGecCnt();  //총 레코드 건수 계산하기
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
		int totBlock = (totPage % blockSize) == 0 ? (totPage/blockSize) : (totPage/blockSize)+1 ;
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		
		//검색어 입력시
		String search = request.getParameter("search") ==null ? "" : request.getParameter("search");
		String searchStr = request.getParameter("searchStr") ==null ? "" : request.getParameter("searchStr");
		
		if(search.equals("") || searchStr.equals("")) {
			vos = dao.getBoardList(startNo,pageSize); 			
		}
		//검색어 입력시
		else {
			vos = dao.getBoardSearch(search, searchStr,startNo,pageSize );
			totRecCnt = dao.totGecCnt(search, searchStr);  //총 레코드 건수 계산하기
			totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
			totBlock = (totPage % blockSize) == 0 ? (totPage/blockSize) : (totPage/blockSize)+1 ;
			
		}
		

		request.setAttribute("vos", vos);
	    request.setAttribute("blockSize", blockSize);
	    request.setAttribute("pageSize", pageSize);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrNo", curScrNo); //인덱스 적기 위해서 필요 
		request.setAttribute("totBlock", totBlock);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("search", search);
		request.setAttribute("searchStr", searchStr);
	}

}

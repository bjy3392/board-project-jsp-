package cj2006.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.pds.PdsDao;
import cj2006.pds.PdsVo;

public class APListCommand implements AdminCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsDao dao = new PdsDao();
		
		String part= request.getParameter("part")==null ? "전체" : (String)request.getParameter("part");
		
		//페이지 블럭 처리
		int pageSize = 10;
	    int blockSize = 3; // 한개 블록의 크기
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int totRecCnt = dao.totGecCnt(part);  //총 레코드 건수 계산하기
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
		int totBlock = (totPage % blockSize) == 0 ? (totPage/blockSize) : (totPage/blockSize)+1 ;
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		ArrayList<PdsVo> vos = dao.pList(startNo,part );
		request.setAttribute("vos", vos);
	    request.setAttribute("blockSize", blockSize);
	    request.setAttribute("pageSize", pageSize);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrNo", curScrNo); //인덱스 적기 위해서 필요 
		request.setAttribute("totBlock", totBlock);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("part", part);
	}

}

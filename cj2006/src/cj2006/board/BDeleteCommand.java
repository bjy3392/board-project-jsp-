package cj2006.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BDeleteCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BoardDao dao = new BoardDao();
		int idx = Integer.parseInt(request.getParameter("idx"));
		String pwd = request.getParameter("pwd");
		String pag = request.getParameter("pag");
		String pageSize = request.getParameter("pageSize");
		
		//검색어 입력시
		String search = request.getParameter("search") ==null ? "" : request.getParameter("search");
		String searchStr = request.getParameter("searchStr") ==null ? "" : request.getParameter("searchStr");
		
		int res = dao.boardDelete(idx,pwd);
		
		if(res == 1) { //정상적으로 게시글이 삭제되는 경우
			request.setAttribute("msg", "boardDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/bList.bo?pag="+pag+"&pageSize="+pageSize+"&search="+search+"&searchStr="+searchStr);
		}
		else {
			request.setAttribute("msg", "boardDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/bContent.bo?idx="+idx+"&pag="+pag+"&pageSize="+pageSize+"&search="+search+"&searchStr="+searchStr);
		}
	}

}

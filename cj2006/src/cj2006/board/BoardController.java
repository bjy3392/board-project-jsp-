package cj2006.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    BoardCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();				/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));	/*/bList */
	    //게시판 목록
	    if(com.equals("/bList.bo")) {
	    	command = new BListCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/board/bList.jsp";
	    }
	    //게시글 글올리기 화면
	    else if(com.equals("/bInput.bo")) {
	    	viewPage = "/WEB-INF/board/bInput.jsp";
	    }
	    //글올리기
	    else if(com.equals("/bInputOk.bo")) {
	    	command = new BInputOkCommand();
	    	command.execute(request, response);
	    	//viewPage = "/WEB-INF/board/bList.jsp";
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    //글 내용보기
	    else if(com.equals("/bContent.bo")) {
	    	command = new BContentCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/board/bContent.jsp";
	    }
	    //글 검색하기
	    else if(com.equals("/bSearch.bo")) {
	    	command = new BSearchCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/board/bSearch.jsp";
	    }
	    //게시글 삭제
	    else if(com.equals("/bDelete.bo")) {
	    	command = new BDeleteCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    //수정하는 화면 보기
	    else if(com.equals("/bUpdate.bo")) {
	    	command = new BUpdateCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/board/bUpdate.jsp";
	    }
	    //수정하기
	    else if(com.equals("/bUpdatetOk.bo")) {
	    	command = new BUpdateOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    //댓글 입력
	    else if(com.equals("/bContInput.bo")) {
	    	command = new BContInputCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/board/bContent.jsp";
	    }
	    //댓글삭제
	    else if(com.equals("/bReplyDel.bo")) {
	    	int idx = Integer.parseInt(request.getParameter("idx"));
	    	response.getWriter().write(bReplyDel(idx));
	    	return;
	    }
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	}

	private String bReplyDel(int idx) {
		BoardDao dao= new BoardDao();
		dao.replyDel(idx);
		return "1";
	}
}

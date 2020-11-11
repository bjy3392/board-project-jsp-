package cj2006.pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.board.BListCommand;

@WebServlet("*.pd")
public class PdsController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    PdsCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();			/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));	/*/bList */
	    //게시판 목록
	    if(com.equals("/pList.pd")) {
	    	command = new PListCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/pds/pList.jsp";
	    }
	    else if(com.equals("/pInput.pd")) {
	    	viewPage = "/WEB-INF/pds/pInput.jsp";
	    }
	    else if(com.equals("/pInputOk.pd")) {
	    	command = new PInputOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/pContent.pd")) {
	    	command = new PContentCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/pds/pContent.jsp";
	    }
	    else if(com.equals("/pDownLoad.pd")) {
//	    	command = new PContentCommand();
//	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/pds/pDownLoad.jsp";
	    }
	    else if(com.equals("/pDelCheck.pd")) {
	    	viewPage = "/WEB-INF/pds/pDelCheck.jsp";
	    }
	    else if(com.equals("/pDelete.pd")) {
	    	viewPage = "/WEB-INF/pds/pDelete.jsp";
	    }
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	}
	
	
}

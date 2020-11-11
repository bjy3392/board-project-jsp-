package cj2006.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.board.BListCommand;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
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
	    
	    AdminCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();			/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));	/*/bList */
	    //게시판 목록
	    if(com.equals("/aMenu.ad")) { 
	    	command = new APListCommand();
	    	command.execute(request, response);
	    	viewPage = "/admin/aMenu.jsp";
	    }
	    else if(com.equals("/apDeleteAll.ad")) { 
	    	command = new APDeleteAllCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	}
	
	
}

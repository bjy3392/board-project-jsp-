package cj2006.study.pdstest;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.board.BListCommand;

@WebServlet("*.pt")
public class Pdstestcontroller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actiondo(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actiondo(request,response);
	}
	private void actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
		PTestCommand command = null;
		String viewPage = "";
		
		String uri = request.getRequestURI();			/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));
	    
	    if(com.equals("/ptUpLoad1.pt")) {
	    	viewPage = "/study/pdstest/upLoadTest1.jsp";
	    }
	    else if(com.equals("/ptUpLoadOk1.pt")) {
	    	command = new PtUpLoadOk1Command();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";	    	
	    }
	    else if(com.equals("/ptDownLoad1.pt")) {
	    	command = new PtDownLoad1Command();
	    	command.execute(request, response);
	    	viewPage = "/study/pdstest/downLoad1.jsp";	    	
	    }
	    else if(com.equals("/ptUpLoad2.pt")) {
	    	viewPage = "/study/pdstest/upLoadTest2.jsp";
	    }
	    else if(com.equals("/ptUpLoadOk2.pt")) {
	    	command = new PtUpLoadOk2Command();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";	    	
	    }
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	}

}

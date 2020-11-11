package cj2006.webmessage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.pds.PListCommand;

@WebServlet("*.wm")
public class WebMessageController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doaction(request,response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doaction(request,response);
	}
	
	private void doaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    WebMessageCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();
	    String com = uri.substring(uri.lastIndexOf("/"));	
	    
	    if(com.equals("/webMessageList.wm")) {
	    	command = new WMessageListCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/webmessage/webMessage.jsp";
	    }
	    else if(com.equals("/wmInputOk.wm")) {
	    	command = new WMInputCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/wmDelete.wm")) {
	    	command = new WMDeleteCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/wmDeleteOk.wm")) {
	    	command = new WMDeleteOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/wmSearchId.wm")) {
	    	command = new WMSearchIdCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/webmessage/wmSearchId.jsp";
	    }
	    
	   
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	    		
		
	}
}








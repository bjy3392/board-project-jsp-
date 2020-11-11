package cj2006.survey;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.board.BListCommand;

@WebServlet("*.su")
public class SurveyController extends HttpServlet {
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
	    
	    SurveyCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();			/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));	/*/bList */
	    //게시판 목록
	    if(com.equals("/home.su")){ 
	    	viewPage = "/";
	    }
	    else if(com.equals("/survey.su")){ 
	    	viewPage = "/WEB-INF/survey/survey.jsp";
	    }
	    else if(com.equals("/sList.su")) {
	    	command = new SListCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sList.jsp";
	    }
	    else if(com.equals("/sInput.su")) {
	    	viewPage = "/WEB-INF/survey/sInput.jsp";
	    }
	    else if(com.equals("/sInputOk.su")) {
	    	command = new SInputOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/sAnswerInput.su")) {
	    	command = new SAnswerInputCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sAnswerInput.jsp";
	    }
	    else if(com.equals("/sAnswerInputOk.su")) {
	    	command = new SAnswerInputOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/sContent.su")) {
	    	command = new SContentCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sContent.jsp";
	    }
	    else if(com.equals("/sUpdateOk.su")) {
	    	command = new SUpdateOkCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/sDelete.su")) {
	    	command = new SDeleteCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/sAList.su")) {
	    	command = new SAListCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sAList.jsp";
	    }
	    else if(com.equals("/sAnswerDelete.su")) {
	    	command = new SAnswerDeleteCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/message/message.jsp";
	    }
	    else if(com.equals("/sResult.su")) {
	    	command = new SResultCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sResult.jsp";
	    }
	    else if(com.equals("/sAResult.su")) {
	    	command = new SResultCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sAResult.jsp";
	    }
	    else if(com.equals("/sAnswerTotalPrint.su")) {
	    	command = new SAnswerTotalPrintCommand();
	    	command.execute(request, response);
	    	viewPage = "/WEB-INF/survey/sAnswerTotalPrint.jsp";
	    }
	   
	    RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	    dispatcher.forward(request, response);
	}
	
	
}

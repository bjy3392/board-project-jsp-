package cj2006.schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.survey.SurveyCommand;

@WebServlet("*.sc")
public class ScheduleController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDao(request,response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDao(request,response);
	}
	private void actionDao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    SurveyCommand command = null;
	    String viewPage = "";
	    
	    String uri = request.getRequestURI();			/*http://localhost:9090/cj2006*/
	    String com = uri.substring(uri.lastIndexOf("/"));	/*/bList */
		
		if(com.equals("/scCalendar.sc")) {
			viewPage = "/WEB-INF/schedule/scCalendar.jsp";
		}
		else if(com.equals("/scContent.sc")) {
			command = new ScContentCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/schedule/scContent.jsp";
		}
		else if(com.equals("/scContentOk.sc")) {
			command = new ScContentOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		else if(com.equals("/scDelete.sc")) {
			command = new ScDeleteCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/message/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}

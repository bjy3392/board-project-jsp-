package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SAnswerInputOkCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SurveyDao dao = new SurveyDao();
		int res = dao.sAnswerInputOk(request, response);
		String sdate = request.getParameter("sdate")==null ? "":request.getParameter("sdate"); 
		
		if(res == 1 ) {
			request.setAttribute("msg", "answerInputOk");
			request.setAttribute("url", request.getContextPath()+"/sList.su?sdate="+sdate);
		}
	}

}

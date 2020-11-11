package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SUpdateOkCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SurveyDao dao = new SurveyDao();
		int res = dao.sUpdateOk(request, response);
		int idx =Integer.parseInt((request.getParameter("idx")));
		
		if(res == 1 ) {
			request.setAttribute("msg", "surveyUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/sContent.su?idx="+idx);
		}
	}

}

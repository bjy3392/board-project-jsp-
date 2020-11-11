package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SDeleteCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SurveyDao dao = new SurveyDao();
		int idx =Integer.parseInt((request.getParameter("idx")));
		String sdate = request.getParameter("sdate")==null ? "":request.getParameter("sdate"); 

		int res = dao.sDelete(idx);
		
		if(res == 1 ) {
			request.setAttribute("msg", "surveyDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/sList.su?sdate="+sdate);
		}
		else if(res == 0 ) {
			request.setAttribute("msg", "surveyDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/sContent.su?idx="+idx);
		}
	}

}

package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SAnswerDeleteCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx =Integer.parseInt(request.getParameter("idx"));
		String sdate = request.getParameter("sdate");
		
		SurveyDao dao = new SurveyDao();
		dao.sAnswerDelete(idx);
		
		request.setAttribute("msg",	"surveyAnswerDeleteOk");
		request.setAttribute("url", request.getContextPath()+"/sList.su?sdate="+sdate);
	}

}

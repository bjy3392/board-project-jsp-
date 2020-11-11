package cj2006.survey;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SAnswerTotalPrintCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String sdate = request.getParameter("sdate");

		SurveyDao dao = new SurveyDao();
		
		ArrayList<SurveyAnswerVo> vos = dao.sAnswerTotalPrint(idx);
		
		request.setAttribute("vos", vos);
		request.setAttribute("sdate", sdate);
		
	}

}

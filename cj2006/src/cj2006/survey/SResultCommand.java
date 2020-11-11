package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SResultCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		SurveyDao dao = new SurveyDao();
		
		SurveyAnswerVo vo = dao.sResult(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("idx", idx);
		
	}

}

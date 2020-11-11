package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SContentCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		SurveyDao dao = new SurveyDao();
		
		SurveyVo vo = dao.sAnswerInput(idx); //설문지 가져오기
		
		request.setAttribute("vo", vo);
	}

}

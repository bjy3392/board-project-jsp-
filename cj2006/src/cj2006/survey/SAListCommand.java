package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SAListCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int survey_idx = Integer.parseInt(request.getParameter("idx"));
		int curNo = request.getParameter("curNo")==null ? 1 : Integer.parseInt(request.getParameter("curNo"));  //현재 설문지의 화면번호(처음에는 무조건 1번)
		
		SurveyDao dao = new SurveyDao();
		SurveyAnswerVo vo = dao.aSList(survey_idx, curNo);
		
		
		request.setAttribute("vo", vo);
		request.setAttribute("survey_idx", survey_idx);
	}

}

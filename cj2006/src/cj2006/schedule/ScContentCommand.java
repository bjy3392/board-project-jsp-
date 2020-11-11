package cj2006.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.survey.SurveyCommand;

public class ScContentCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String ymd = request.getParameter("ymd");
		String mid = request.getParameter("mid");

		ScheduleDao dao = new ScheduleDao();
		
		ScheduleVo vo = dao.scContent(ymd,mid);

		request.setAttribute("vo", vo);
		request.setAttribute("ymd", ymd);
		request.setAttribute("mid", mid);
		
	}	

}

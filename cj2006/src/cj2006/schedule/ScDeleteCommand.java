package cj2006.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.survey.SurveyCommand;

public class ScDeleteCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ScheduleDao dao= new ScheduleDao();
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String mid = request.getParameter("ymd")==null ? "mid" : request.getParameter("mid");
		
		dao.scDelete(ymd, mid);
		
		request.setAttribute("msg", "scDeleteOk");
		request.setAttribute("url", request.getContextPath()+"/scCalendar.sc?ymd="+ymd);
	}

}
  
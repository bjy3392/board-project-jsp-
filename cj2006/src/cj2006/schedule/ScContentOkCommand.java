package cj2006.schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.survey.SurveyCommand;

public class ScContentOkCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScheduleDao dao = new ScheduleDao();
		ScheduleVo vo = new ScheduleVo();
		
		String ymd = request.getParameter("ymd");
		vo.setMid(request.getParameter("mid"));
		vo.setScdate(request.getParameter("ymd"));
		vo.setMemory(request.getParameter("memory"));
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		
		dao.scContentOk(vo);
		
		request.setAttribute("msg",	"scContentOk");
		request.setAttribute("url",	request.getContextPath()+"/scCalendar.sc?ymd="+ymd);
	}

}

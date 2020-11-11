package cj2006.survey;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SListCommand implements SurveyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SurveyDao dao = new SurveyDao();
			
			String sdate = request.getParameter("sdate")==null ? " " :request.getParameter("sdate");
			

			ArrayList<String> sdateArr = dao.sDate();
			ArrayList<SurveyVo> vos  = dao.sList(sdate);
			
			request.setAttribute("vos", vos);
			request.setAttribute("sdateArr", sdateArr);
			request.setAttribute("selectdate", sdate);
	}

}

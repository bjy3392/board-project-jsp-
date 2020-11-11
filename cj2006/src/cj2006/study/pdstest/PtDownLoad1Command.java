package cj2006.study.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PtDownLoad1Command implements PTestCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		
		String directory = application.getRealPath("/study/pdstest/data");
		
		
		String[] files = new File(directory).list(); //경로안에 들어있는 List를 가져온다.
		
		request.setAttribute("files", files);
	}

}

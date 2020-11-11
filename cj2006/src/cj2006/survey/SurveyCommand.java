package cj2006.survey;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SurveyCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException;
}

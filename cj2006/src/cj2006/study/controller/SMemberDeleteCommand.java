package cj2006.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.member.MemberDao;

public class SMemberDeleteCommand implements StudyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		String cause = "";
		
		MemberDao dao = new MemberDao();
		dao.delCheck(cause,mid);
		
	}

}

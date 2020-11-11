package cj2006.study.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.member.MemberDao;
import cj2006.member.MemberVo;

public class SMemberSearchCommand implements StudyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
	    
	    String nickname = request.getParameter("nickname");
	    
	    MemberDao dao = new MemberDao();
	    MemberVo vo = dao.mSearch("nickname", nickname);
	    request.setAttribute("vo", vo);
	    
	    if(vo == null) {
	    	//response.sendRedirect("request.getContextPath()/memberSearch.do");
	    	String errMsg = "잘못된 닉네임입니다.";
	    	request.setAttribute("errMsg", errMsg);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/memberSearch.do");
			dispatcher.forward(request, response);
	    }
	   
	}

}

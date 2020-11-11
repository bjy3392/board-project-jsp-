package cj2006.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SMSearchCommand implements StudyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//회원조회처리부분이 와야하는 부분 (DB연동처리부분)
		System.out.println("회원조회 커맨드 블럭");
	}

}

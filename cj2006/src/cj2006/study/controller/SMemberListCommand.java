package cj2006.study.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.member.MemberDao;
import cj2006.member.MemberVo;

public class SMemberListCommand implements StudyCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao =new MemberDao();
		
		int pageSize =3;
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int totRecCnt = dao.totGecCnt();  //총 레코드 건수 계산하기
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) +1 ;//총페이지 수
		int startNo = (pag -1) * pageSize;
		int curScrNo = totRecCnt - startNo;
		
		ArrayList<MemberVo> vos = dao.mList(startNo,pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrNo", curScrNo);
	}

}

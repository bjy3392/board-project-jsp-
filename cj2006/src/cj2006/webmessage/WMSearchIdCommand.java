package cj2006.webmessage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.member.MemberDao;
import cj2006.member.MemberVo;

public class WMSearchIdCommand implements WebMessageCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		
		ArrayList<MemberVo> vos = dao.mSearchAll();
		
		request.setAttribute("vos", vos);
	}

}

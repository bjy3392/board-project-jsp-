package cj2006.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/MUpd")
public class MUpdOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		
		HttpSession session = request.getSession();
		String snickname = (String)session.getAttribute("snickname");

		vo.setMid(request.getParameter("mid"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setName(request.getParameter("name"));
		vo.setGender(request.getParameter("gender"));
		vo.setBirth(request.getParameter("birth"));
		vo.setTel(request.getParameter("tel"));
		vo.setAddress(request.getParameter("address"));
		vo.setEmail(request.getParameter("email"));
		vo.setHomepage(request.getParameter("homepage"));
		vo.setJob(request.getParameter("job"));
		vo.setHobby(request.getParameter("hobby"));
		vo.setUserinfo(request.getParameter("userinfor"));

		String name = dao.mUpdate(vo, snickname);

		PrintWriter out = response.getWriter();

		if (name.equals("")) {
			out.println("<script>");
			out.println("alert('중복된 닉네임을 수정할 수 없습니다. 중복체크를 해주세요.');");
			out.println("location.href='javascript:history.back();';");
			out.println("</script>");
		} else {
			session.setAttribute("snickname", vo.getNickname());
			out.println("<script>");
			out.println("alert('" + name + "님 가입을 정보가 수정되었습니다.');");
			out.println("location.href='" + request.getContextPath() + "/member/mUpdate.jsp';");
			out.println("</script>");
		}

	}
}

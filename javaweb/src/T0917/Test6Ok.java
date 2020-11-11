package T0917;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test6Ok
 */
@WebServlet("/atom")
public class Test6Ok extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8"); //respond 객체 한글처리
		response.getWriter().append("출력(output)연습: ");

		String mid = request.getParameter("mid");
		String pwd = request.getParameter("pwd"); 
		
		System.out.println("아이디:" + mid);
		System.out.println("비밀번호:" + pwd);
		
		PrintWriter out = response.getWriter();
		out.println("아이디 : " + mid + "<br/>" );
		out.println("아이디 : " + pwd + "<br/>" );
		out.println("<a href='/javaweb/0917/test6.html'>돌아가기</a>" );
	}


}

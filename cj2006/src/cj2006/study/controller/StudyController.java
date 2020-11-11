package cj2006.study.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class StudyController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet입니다.");
		actiondo(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost입니다.");
		actiondo(request, response);
	}

	protected void actiondo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html; charset=utf-8");
	    request.setCharacterEncoding("utf-8");
		
	    //참고...
		System.out.println("이곳은 actionDo입니다.");
		
		String uri = request.getRequestURI();
		System.out.println("uri: " + uri);
		
		String conPath = request.getContextPath();
		System.out.println("conPath: " + conPath);
		
		String imsi = uri.substring(conPath.length());
		System.out.println(imsi);
		//여기까지...
		
		StudyCommand command = null; //작업지시 인터페이스
		String viewPage = "";        //작업수행후 돌아갈 View(jsp파일)
		
		int flag = uri.lastIndexOf("/");
		String comm =  uri.substring(flag);
		System.out.println("파일명 : "+ comm);
		
		if(comm.equals("/mInput.do")) {
			//System.out.println("회원가입창으로 전송시커주는 command블럭");
			command = new SMInputCommand();
			command.execute(request, response);
			viewPage = "/study/controller/testInput.jsp";
			//response.sendRedirect(...); request에 자료를 담아왔기때문에 사용할수 없다.
		}
		else if(comm.equals("/mSearch.do")) {
			//System.out.println("회원조회창으로 전송시커주는 command블럭");	
			command = new SMSearchCommand();
			command.execute(request, response);
			viewPage = "/study/controller/testSearch.jsp";		
		}
		else if(comm.equals("/mUpdate.do")) {
			//System.out.println("회원정보수정창으로 전송시커주는 command블럭");	
			command = new SMUpdateCommand();
			command.execute(request, response);
			viewPage = "/study/controller/testUpdate.jsp";			
		}
		else if(comm.equals("/mDelete.do")) {
			//System.out.println("회원탈퇴창으로 전송시커주는 command블럭");	
			command = new SMmDeleteCommand();
			command.execute(request, response);
			viewPage = "/study/controller/testmDelete.jsp";			
		}
		else if(comm.equals("/testController.do")) {
			viewPage = "/study/controller/testController.jsp";			
		}
		else if(comm.equals("/memberController.do")) {
			viewPage = "/study/controller/memberController.jsp";			
		}
		else if(comm.equals("/memberList.do")) {
			command = new SMemberListCommand();
			command.execute(request, response);
			viewPage = "/study/controller/memberList.jsp";			
		}
		else if(comm.equals("/memberSearch.do")) {
			viewPage = "/study/controller/memberSearch.jsp";			
		}
		else if(comm.equals("/memberSearchOk.do")) {
			command = new SMemberSearchCommand();
			command.execute(request, response);
			viewPage = "/study/controller/memberSearchView.jsp";			
		}
		else if(comm.equals("/memberDelete.do")) {
			System.out.println("이곳은 delete처리 부분입니다.");
			command = new SMemberDeleteCommand();
			command.execute(request, response);
			viewPage = "/member/mLogin.jsp";			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		//System.out.println("작업처리 끝");
	}
}

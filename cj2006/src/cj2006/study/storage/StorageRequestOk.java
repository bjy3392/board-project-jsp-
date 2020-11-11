package cj2006.study.storage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cj2006.member.MemberVo;

@WebServlet("/study/storage/StorageRequest")
public class StorageRequestOk extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; chrset=utf8");
		request.setCharacterEncoding("utf-8");

		//서블릿에서 request 객체변수에 값을 직접 저장
		request.setAttribute("requestVar", "안녕 request!!");
		
		//jsp에서 넘어온 값을 다시 request객체변수에 저장
		request.setAttribute("imsi", request.getParameter("imsi"));
		
		// (jsp에서 넘어온) 배열값을 다시 request객체변수에 저장
		String[] hobbys = {"등산","낚시","서핑","수영","넷플릭스","기타"};
		request.setAttribute("hobbys", hobbys);
	
		//컬렉션 프레임웤 객체 사용 예 :Map계열 객체에 자료 저장
		Map<String, Object> member = new HashMap<String, Object>();
		member.put("name", "배지영");
		member.put("age",25);
		member.put("address", "청주시 흥덕구 복대동");
		member.put("job", "회사원");
		member.put("ipsail", "2020-01-05");
		request.setAttribute("member", member);
		
		//vo(MemberVo)객체를 통한 저장
		MemberVo vo = new MemberVo();
		vo.setIdx(1);
		vo.setName("이다양");
		vo.setAddress("증평");
		vo.setHobby("승마/역도");
		request.setAttribute("vo", vo);
		
		//vos(ArrayList)객체에 저장
		ArrayList<MemberVo> vos = new ArrayList<MemberVo>();
		vo = new MemberVo();
		vo.setIdx(1);
		vo.setName("이다양");
		vo.setAddress("증평");
		vo.setHobby("승마/역도");
		vos.add(vo);
		
		vo = new MemberVo();
		vo.setIdx(1);
		vo.setName("윤서나");
		vo.setAddress("용얌동");
		vo.setHobby("승마/역도/차력");
		request.setAttribute("vo", vo);
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		
		//response.sendRedirect(request.getContextPath()+"/study/storage/storageRes.jsp");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/storage/storageRes.jsp");
		dispatcher.forward(request, response);
	}
}

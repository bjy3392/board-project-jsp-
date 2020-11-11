package cj2006.study.pdstest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PtUpLoadOk1Command implements PTestCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MultipartRequest(전송타입(request),저장디렉토리,최대크기,코드변환방식,옵션)
		ServletContext application = request.getServletContext();
		
		String directory = application.getRealPath("/study/pdstest/data");  //서버의 절대 경로를 구한다. webcontext 경로 하위에 내가 사용하고 싶은 경로를 지정.
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("fname");  // 클라이언트에서 업로드 시킨 파일명(form태그에서 file에 적어준 이름<input type="file"name="fname"> 여기적어준 name)
		String fileRealName = multipartRequest.getFilesystemName("fname"); //서버에 실제로 저장되는 폴더의 파일명. 중복된 파일명이 있을경우 서버가 임의로 새로운 이름을 부여한다.
		
		System.out.println();
		
		//System.out.println("/ : " + application.getRealPath("/"));  //contextPath root
		//System.out.println("directory : "+ directory);
		//System.out.println("fileName : "+ fileName);
		//System.out.println("fileRealName : "+ fileRealName);
		
		if(fileRealName != null) {
			request.setAttribute("msg", "upLoadOk");
			request.setAttribute("url", request.getContextPath()+"/ptUpLoad1.pt");
		}
		else {
			request.setAttribute("msg", "upLoadNo");
			request.setAttribute("url", request.getContextPath()+"/ptUpLoad1.pt");
		}
	}

}

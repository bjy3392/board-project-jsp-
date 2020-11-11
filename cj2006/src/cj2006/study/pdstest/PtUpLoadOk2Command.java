package cj2006.study.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PtUpLoadOk2Command implements PTestCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();

		String directory = application.getRealPath("/study/pdstest/data"); // 서버의 절대 경로를 구한다. webcontext 경로 하위에 내가 사용하고
																			// 싶은 경로를 지정.
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileRealName =  null;
		Enumeration fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()) {
			String parameter = (String)fileNames.nextElement();
			
			String fileName = multipartRequest.getOriginalFileName(parameter);  // 클라이언트에서 업로드 시킨 파일명(form태그에서 file에 적어준 이름<input type="file"name="fname"> 여기적어준 name)
			fileRealName = multipartRequest.getFilesystemName(parameter); //서버에 실제로 저장되는 폴더의 파일명. 중복된 파일명이 있을경우 서버가 임의로 새로운 이름을 부여한다.
			
		}
			
		if(fileRealName != null) {
			request.setAttribute("msg", "upLoadOk");
			request.setAttribute("url", request.getContextPath()+"/ptUpLoad2.pt");
		}
		else {
			request.setAttribute("msg", "upLoadNo");
			request.setAttribute("url", request.getContextPath()+"/ptUpLoad2.pt");
		}
		
	}

}

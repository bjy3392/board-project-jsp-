package cj2006.pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownAction")
public class DownAction extends HttpServlet {
  @Override
  protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String fileName = request.getParameter("file");
    
    ServletContext application = request.getServletContext();
    
    String directory = application.getRealPath("/data/pds/");
    
    File file = new File(directory+"/"+fileName);
    
    String mimeType = getServletContext().getMimeType(file.toString());
    if(mimeType == null) {
      response.setContentType("application/octet-strean"); // 2진(바이너리)파일로 전송하겠다는것
    }
    
    String downLoadName = null;  // 실제로 다운로드될 파일명
    if(request.getHeader("user-agent").indexOf("MSIE") == -1) { // 사용자 브라우저가 익스플로러가 아니면...
      downLoadName = new String(fileName.getBytes("UTF-8"), "8859_1");
    }
    else {
      downLoadName = new String(fileName.getBytes("EUC-KR"), "8859_1");
    }
    
    // 다운로드할 파일명과 형식을 헤더파일에 담아서 전송시켜준다.
    response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
    
    FileInputStream fileInputStream = new FileInputStream(file);
    ServletOutputStream servletOutputStream = response.getOutputStream();
    
    byte[] b = new byte[1024];  // 실제로 한번에 전송할 크기를 1024Byte로 쪼개어 전송한다...
    int data = 0;
    
    while((data = fileInputStream.read(b, 0, b.length)) != -1) {
      servletOutputStream.write(b, 0, data);  // 실제로 전송할때 1024바이트 단위로 쪼개어 저장한 data변의 내용을 전송한다.
    }
    servletOutputStream.flush();  // data변수에 1024Byte미만으로 남아있는 자료를 다 보내어 준다.
    
    servletOutputStream.close();
    fileInputStream.close();
    
    
  }
}



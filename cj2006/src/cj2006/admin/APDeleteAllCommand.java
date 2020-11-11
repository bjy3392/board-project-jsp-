package cj2006.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class APDeleteAllCommand implements AdminCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext application = request.getServletContext();
		
		String dir = application.getRealPath("/data/pds/imsi/");
		
		File imsiFolder= new File(dir);
		
		if(imsiFolder.exists()) {
			File[] deleteFolderList = imsiFolder.listFiles();
			for(File file : deleteFolderList) {
				file.delete();
			}
			
			request.setAttribute("msg", "APDeleteAllOk");
			request.setAttribute("url", request.getContextPath()+"/aMenu.ad?sw=p");
		}
	}

}

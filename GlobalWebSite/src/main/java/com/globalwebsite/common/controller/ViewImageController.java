package com.globalwebsite.common.controller;

import org.springframework.stereotype.Controller;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ViewImageController {

	@RequestMapping(value = "/viewimage", method = RequestMethod.GET)
	public void downloadFile(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String imageName = request.getParameter("imageID");
		String imageFolder = request.getParameter("imageFolder");
		File file = null;
		String rootPath = System.getProperty("catalina.home");
		file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+imageFolder+""+File.separator+""+imageName);
		
		

		if (!file.exists()) {
			
				file = new File(request.getRealPath("products") + "/logo.jpg");
			if(!file.exists())
			{
			String errorMessage = "Sorry. The file you are looking for does not exist";
			//System.out.println(errorMessage);
			OutputStream outputStream = response.getOutputStream();
			outputStream.write(errorMessage.getBytes(Charset.forName("UTF-8")));
			outputStream.close();
			return;
			}
			
			}
		

		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		//System.out.println("image name is " + imageName);
		if (mimeType == null) {
			//System.out.println("mimetype is not detectable, will take default");
			mimeType = "application/octet-stream";
		}

		//System.out.println("mimetype : " + mimeType);

		response.setContentType(mimeType);

		/*
		 * "Content-Disposition : inline" will show viewable types [like
		 * images/text/pdf/anything viewable by browser] right on browser while
		 * others(zip e.g) will be directly downloaded [may provide save as
		 * popup, based on your browser setting.]
		 */
		response.setHeader("Content-Disposition", String.format("inline; filename=\"" + file.getName() + "\""));

		/*
		 * "Content-Disposition : attachment" will be directly download, may
		 * provide save as popup, based on your browser setting
		 */
		// response.setHeader("Content-Disposition", String.format("attachment;
		// filename=\"%s\"", file.getName()));

		response.setContentLength((int) file.length());

		InputStream inputStream = new BufferedInputStream(new FileInputStream(file));

		// Copy bytes from source to destination(outputstream in this example),
		// closes both streams.
		FileCopyUtils.copy(inputStream, response.getOutputStream());
	}

	
	
	
	
	

	
}

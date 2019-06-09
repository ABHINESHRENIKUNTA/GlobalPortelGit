package com.globalwebsite.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadToTomcatController {

	
	
	public String uploadFileHandler(MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				System.out.println(file.getOriginalFilename());
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+"UserDashboardImages");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+File.separator+file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				

				return file.getOriginalFilename();
			} catch (Exception e) {
				return "You failed to upload " + e.getMessage();
			}
		} else {
			return "You failed to upload " 
					+ " because the file was empty.";
		}
	}
	
	/**Common method for save images**/
	/**
	 * @param file
	 * @param imageFolder
	 * @param tablecnt
	 * @return
	 */
	public String saveImagesInTomcatDirectory(MultipartFile file, String imageFolder, int tablecnt) {
		
		if (!file.isEmpty()) {
			try {
				System.out.println(file.getOriginalFilename());
				byte[] bytes = file.getBytes();
				
				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+imageFolder);
				if (!dir.exists())
					dir.mkdirs();
				
				String fileex=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf('.'),file.getOriginalFilename().length());
				String fileName=tablecnt+""+""+fileex;
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+File.separator+fileName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				
				
				return file.getOriginalFilename();
			} catch (Exception e) {
				return "You failed to upload " + e.getMessage();
			}
		} else {
			return "You failed to upload " 
					+ " because the file was empty.";
		}
	}
	

}

package com.globalwebsite.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadToTomcatController {

	private final static Logger logger = Logger.getLogger(FileUploadToTomcatController.class);

	
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
				
				
				
				return fileName;
			} catch (Exception e) {
				return "You failed to upload " + e.getMessage();
			}
		} else {
			return "You failed to upload " 
					+ " because the file was empty.";
		}
	}
	
	/**
	 * @param imageFolder
	 * @param fileName
	 * @return
	 */
	public boolean removeImageFromDirectory(String imageFolder, String fileName) {
		logger.info("removeImageFromDirectory");
		// Creating the directory to store file
		String rootPath = System.getProperty("catalina.home");
			
		// Create the file on server
		File serverFile = null;
		try {
			serverFile = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+imageFolder+File.separator+fileName);
		} catch (Exception e) {
			logger.info("Exception occured when deleting file: "+e);
		}
				
		return serverFile.delete();
	}
	

}

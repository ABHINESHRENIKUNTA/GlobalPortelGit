package com.globalwebsite.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminAddCompanyLogoScrollController {
	private final static Logger logger = Logger.getLogger(AdminAddCompanyLogoScrollController.class);

	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	@Autowired
	AdminRolePermissionController apr;
	
	@Value("${companyLogoFolder.Name}")
	private String companyLogoFolderName;
	
	@RequestMapping(value="/view-companylogopage", method=RequestMethod.GET)
	public ModelAndView viewCompanyLogoUploadScreen(Model model,AdminAddUserImagesModel adm,HttpServletRequest req){
		logger.info("viewCompanyLogoUploadScreen::");
		boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
		if ( rolenotnull==false) {
			return new ModelAndView("admin/somethingError");
		}
		String ssroleid = (String)req.getSession().getAttribute("roleid");
		int roleid = Integer.valueOf(ssroleid);
		String permisaccess = apr.adminManagePermissions(roleid, req);
		if(permisaccess == "accessdenied"){
			return new ModelAndView("admin/somethingError");
		}
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg",  req.getParameter("emsg"));
		return new ModelAndView("admin/adminCompanyLogo", "companyLogos", adm);
	}
	
	@RequestMapping("/delete-companylogopage")
	public ModelAndView adminViewDeleteCompanyLogosScreen(Model model,AdminAddUserImagesModel adm,HttpServletRequest req)
	{
		boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
		if ( rolenotnull==false) {
			return new ModelAndView("admin/somethingError");
		}
		String ssroleid = (String)req.getSession().getAttribute("roleid");
		int roleid = Integer.valueOf(ssroleid);
		String permisaccess = apr.adminManagePermissions(roleid, req);
		if(permisaccess == "accessdenied"){
			return new ModelAndView("admin/somethingError");
		}
		List<AdminAddUserImagesModel> admdata= adminservices.getAdminDeleteCompanyLogos();
		model.addAttribute("admdata", admdata);
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg",  req.getParameter("emsg"));
		
		return new ModelAndView("admin/adminDeleteCompanyLogos", "companyLogos", adm);
	}
	
	@RequestMapping("/admininsert-companyLogos")
	public String adminAddCompanyLogosData(Model model,AdminAddUserImagesModel adm,@RequestParam("file1") MultipartFile file){
		String smsg="",emsg="";
		FileUploadToTomcatController fileupload=new FileUploadToTomcatController();
		boolean isFileExists = verifyFileExistsInFolder(file.getOriginalFilename(), companyLogoFolderName);
		if(isFileExists || StringUtils.equals(file.getOriginalFilename(), "emptyFile")){
			model.addAttribute("emsg", "Given file is already exists: "+file.getOriginalFilename());
			return "redirect:/view-companylogopage";
		}
		String filename=fileupload.uploadFileInGivenFolder(file, companyLogoFolderName);
		adm.setFilename(filename);
		int insert=adminservices.uploadAdminCompanyLogoData(adm);
		if(insert>0){
			smsg="File Data Added Successfully.";
		}
		else{
			emsg="There is an error while uploading file.";
		}
		model.addAttribute("smsg", smsg);
		model.addAttribute("emsg", emsg);
		return "redirect:/view-companylogopage";
	}
	
	@RequestMapping("/admindelete-companyLogos")
	public String adminDeleteCompanyLogosData(Model model,AdminAddUserImagesModel adm,HttpServletRequest req)
	{
		String smsg="",emsg="";
		String admvalue=req.getParameter("admid");
		String arr[]=admvalue.split("_");
		
		boolean isDeteleted = deleteFileFromFolder(arr[0], companyLogoFolderName);
		if(!isDeteleted){
			model.addAttribute("emsg", "There is an error while deleting file.");
			return "redirect:/delete-companylogopage";
		}
		int delete=adminservices.deleteAdminSelectedCompanyLogo(arr[1]);
		if(delete>0){
			smsg="File Data Deleted Successfully.";
		}
		else{
			emsg="There is an error while deleting file.";
		}
		model.addAttribute("smsg", smsg);
		model.addAttribute("emsg", emsg);
		return "redirect:/delete-companylogopage";
	}
	
	public boolean deleteFileFromFolder(String filename, String folderName) {
		String rootPath = System.getProperty("catalina.home");
		File file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+folderName+""+File.separator+filename);
		return file.delete();	
	}
	public boolean verifyFileExistsInFolder(String filename, String folderName) {
		String rootPath = System.getProperty("catalina.home");
		File file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+folderName+""+File.separator+filename);
		return file.exists();	
	}
	
	 @RequestMapping("/viewcompanylogs")
	    public  @ResponseBody byte[] getImage(HttpServletRequest req) throws IOException {
	        String imageName=req.getParameter("userImage");
	        String rootPath = System.getProperty("catalina.home");
			File file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+""+companyLogoFolderName+""+File.separator+imageName);
	        return Files.readAllBytes(file.toPath());
	    }
	
}

package com.globalwebsite.admin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminAddUserDisplayImagesController {
	
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	@Autowired
	AdminRolePermissionController apr;
	
	@RequestMapping("/AdminAddImagesForUser")
	public ModelAndView AdminAddImagesForUser(Model model,AdminAddUserImagesModel adm,HttpServletRequest req){
		
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
		model.addAttribute("adm", adm);
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg",  req.getParameter("emsg"));
		
		return new ModelAndView("admin/loadAddUserImages");
	}
	
	
	@RequestMapping("/AdminAddUserPageImages")
	public String AdminAddUserPageImages(Model model,AdminAddUserImagesModel adm,@RequestParam("file1") MultipartFile file){
		String smsg="",emsg="";
		FileUploadToTomcatController fileupload=new FileUploadToTomcatController();
		String filename=fileupload.uploadFileHandler(file);
		adm.setFilename(filename);
		int insert=adminservices.uploadAdminUserDahboardImagesData(adm);
		if(insert>0){
			smsg="File Data Added Successfully.";
		}
		else{
			emsg="There is an error while uploading file.";
		}
		model.addAttribute("adm", adm);
		model.addAttribute("smsg", smsg);
		model.addAttribute("emsg", emsg);
		return "redirect:/AdminAddImagesForUser";
	}
	
	@RequestMapping("/AdminDeleteImagesForUser")
	public ModelAndView AdminDeleteImagesForUser(Model model,AdminAddUserImagesModel adm,HttpServletRequest req)
	{
		List<AdminAddUserImagesModel> admdata= adminservices.getAdminDeleteUserImages();
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
		model.addAttribute("admdata", admdata);
		model.addAttribute("adm", adm);
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg",  req.getParameter("emsg"));
		
		return new ModelAndView("admin/deleteUserImage");
	}
	
	@RequestMapping("/AdminDeleteUserPageImages")
	public String AdminDeleteUserPageImages(Model model,AdminAddUserImagesModel adm,HttpServletRequest req)
	{
		String smsg="",emsg="";
		String admvalue=req.getParameter("admid");
		String arr[]=admvalue.split("_");
		
		deleteFileHandler(arr[0]);
		
		int delete=adminservices.deleteAdminSelectedImage(arr[1]);
		if(delete>0){
			smsg="File Data Deleted Successfully.";
		}
		else{
			emsg="There is an error while deleting file.";
		}
		model.addAttribute("adm", adm);
		model.addAttribute("smsg", smsg);
		model.addAttribute("emsg", emsg);
		return "redirect:/AdminDeleteImagesForUser";
	}
	
	public void deleteFileHandler(String filename) {
		String rootPath = System.getProperty("catalina.home");
		File file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+"UserDashboardImages"+File.separator+filename);
		file.delete();
		
	}
	  @RequestMapping("/userDashboardImage")
	    public  @ResponseBody byte[] getImage(HttpServletRequest req) throws IOException {
	        String imageName=req.getParameter("userImage");
	        String rootPath = System.getProperty("catalina.home");
			File file = new File(rootPath + File.separator + "GlobalWebsiteFiles"+File.separator+"UserDashboardImages"+File.separator+imageName);
	        

	        return Files.readAllBytes(file.toPath());
	    }
	

}

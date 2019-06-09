package com.globalwebsite.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.controller.DatabaseTableNames;
import com.gw.student.model.StudentDashboardModel;

@Controller
public class AdminStudentHomeInfoController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminStudentHomeInfoController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;

	@RequestMapping("/load-adminaddstuinfo")
	public ModelAndView adminStudentAddInfoPage(StudentDashboardModel stdmodel, Model model, HttpServletRequest req) throws Exception{
		Map<String, String> tablevalues = tableReferenceData();
		logger.info("Admin Student Add Info Page: "+hashCode());
		model.addAttribute("tablelist", tablevalues);
		logger.info("Available tables in drop-down: "+tablevalues);
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg",  req.getParameter("emsg"));
		return new ModelAndView("studentadmin/adminAddStudentHomeInfo" , "adminaddstuinfo", stdmodel);
		
	}
	
	 @SuppressWarnings("unused") //Testing method
	private String encodeFileToBase64Binary( MultipartFile file) throws Exception{
		 byte[] bytes = file.getBytes();
        String  imageString = new String(Base64.encodeBase64(bytes), "UTF-8");
        String  imageString1 ="<img src='data:image/png;base64,"+ imageString +"/'>";
         return imageString1;
     }
	 


	@RequestMapping("/adminaddstudenthomeinfo")
	public String adminInsertStudentInfoPage(Model model, StudentDashboardModel stdmodel,@RequestParam("imagepath") MultipartFile file) throws Exception{
	
		String imageFolder = "studenthomepageimages";
		model.addAttribute("adminupdatestuinfo", stdmodel);
		String tablename = searchSelectedTableName(stdmodel.getTablename());
		String errormsg = "";
		String susmsg = "";
		if(!stdmodel.getTablename().equals(tablename)){
			errormsg = tablename;
		}else{
		//Get total count from selected table
		int tablecnt=1;
		    tablecnt = tablecnt+1;
		FileUploadToTomcatController fut = new FileUploadToTomcatController();
		
		String imgpath = fut.saveImagesInTomcatDirectory(file, imageFolder, tablecnt);
		stdmodel.setFilename(imgpath);
		susmsg = "Student home page data successfully added.";
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		return "redirect:/load-adminaddstuinfo";
		
	}
	@RequestMapping("/load-adminupdatestuinfo")
	public String adminStudentEditInfoPage(Model model, StudentDashboardModel stdmodel,@RequestParam("imagepath") MultipartFile file){
		
		model.addAttribute("adminupdatestuinfo", stdmodel);
		
		return "studentadmin/adminUpdateStudentHomeInfo";
		
	}
	@RequestMapping("/load-admindeletestuinfo")
	public String adminStudentdeleteInfoPage(Model model, StudentDashboardModel stdmodel){
		
		model.addAttribute("admindeletestuinfo", stdmodel);
		
		return "studentadmin/adminDeleteStudentHomeInfoss";
		
	}
}

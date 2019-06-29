package com.globalwebsite.admin.controller;

import java.util.List;
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
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class AdminStudentHomeInfoController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminStudentHomeInfoController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;

	@RequestMapping("/load-adminaddstuinfo")
	public ModelAndView adminStudentAddInfoPage(AdminSubmissionModel stdmodel, Model model, HttpServletRequest req) throws Exception{
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = req.getParameter("selectedparam");
		logger.info("Admin Selected Page: "+selectpage);
		if(!mapvalues.containsKey(selectpage)){
			return new ModelAndView("admin/somethingError" , "adminaddstuinfo", stdmodel);
		}
		model.addAttribute("tablekey", selectpage);
		model.addAttribute("tableval", mapvalues.get(selectpage));
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
	public String adminInsertStudentInfoPage(Model model, AdminSubmissionModel stdmodel,@RequestParam("imagepath") MultipartFile file) throws Exception{
	
		String imageFolder = stdmodel.getTablename();
		model.addAttribute("adminupdatestuinfo", stdmodel);
		Map<String, String> tablevalues = tableReferenceData();
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		stdmodel.setLoggedowner("Prakash Varma");
		//Get total count from selected table (SQL query)
		int tablecnt=adminservices.selectCountForSubmissionData(stdmodel);
		//Create TOMCAT Directory Object    
		FileUploadToTomcatController fut = new FileUploadToTomcatController();
		System.out.println(stdmodel.getTablename());
		//Save Image in TOMCAT directory
		String imgpath = fut.saveImagesInTomcatDirectory(file, imageFolder, tablecnt);
		stdmodel.setFilename(imgpath);
		//Insert Data
		succsscnt = adminservices.insertSubmissionData(stdmodel);
		if(succsscnt==1){
		susmsg = tablevalues.get(stdmodel.getTablename())+" data successfully added.";
		logger.info(susmsg);
		}else{
		errormsg = tablevalues.get(stdmodel.getTablename())+" data not added. Please try with valid data or contact support team.";
		logger.info(errormsg);
		fut.removeImageFromDirectory(imageFolder, imgpath);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		model.addAttribute("selectedparam", imageFolder);
		return "redirect:/load-adminaddstuinfo";
		
	}
	@RequestMapping("/load-adminupdatestuinfo")
	public String adminStudentEditInfoPage(Model model, AdminSubmissionModel stdmodel){
		
		model.addAttribute("adminupdatestuinfo", stdmodel);
		
		return "studentadmin/adminUpdateStudentHomeInfo";
		
	}
	@RequestMapping("/load-selecttoviewdata")
	public String adminSelectPageToViewDat(Model model, AdminSubmissionModel stdmodel){
		
		model.addAttribute("adminselpage", stdmodel);
		Map<String, String> tablevalues = tableReferenceData();
		model.addAttribute("tablelist", tablevalues);
		logger.info("Available tables in drop-down: "+tablevalues);
		
		return "studentadmin/adminSelectPageToView";
		
	}
	@RequestMapping("/load-adminviewcommoninfo")
	public String adminStudentdeleteInfoPage(Model model, AdminSubmissionModel stdmodel, HttpServletRequest req){
		
		model.addAttribute("adminviewstuinfo", stdmodel);
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = req.getParameter("selectedparam");
		String retvalue = "studentadmin/adminViewStudentHomeInfo";
		if(!mapvalues.containsKey(selectpage)){
			return "admin/somethingError";
		}
		stdmodel.setTablename(selectpage);
		model.addAttribute("tablekey", stdmodel.getTablename());
		model.addAttribute("tableval", mapvalues.get(stdmodel.getTablename()));
		List<AdminSubmissionModel> listdata = adminservices.getAllViewSubmissionData(stdmodel.getTablename());
		model.addAttribute("listdata", listdata);
		
		return retvalue;
		
	}
}

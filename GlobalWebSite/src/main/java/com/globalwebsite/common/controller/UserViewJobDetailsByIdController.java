package com.globalwebsite.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class UserViewJobDetailsByIdController {

	private final static Logger logger = Logger.getLogger(UserViewJobDetailsByIdController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	private final String errorPage="user/userErrorPage";
	
	 @RequestMapping("/view-userconsultantsjobsbyid")
	 public ModelAndView userViewConsultantJobScreenById(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_jobconsult_jobs";
		 if(stdmodel.getRowid()==0){
			 return new ModelAndView(errorPage, "listjobdetails", stdmodel);
		 }
		 int jobdetailid=stdmodel.getRowid();
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewConsultantJobsById", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-userreferraljobsid")
	 public ModelAndView userViewReferralScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_refpost_jobs";
		 if(stdmodel.getRowid()==0){
			 return new ModelAndView(errorPage, "listjobdetails", stdmodel);
		 }
		 int jobdetailid=stdmodel.getRowid();
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewReferralJobsById", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-userpostedbyadminid")
	 public ModelAndView userViewPostedByAdminScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_postedbyadmin_jobs";
		 if(stdmodel.getRowid()==0){
			 return new ModelAndView(errorPage, "listjobdetails", stdmodel);
		 }
		 int jobdetailid=stdmodel.getRowid();
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewJobsPostedByAdminById", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-useremployeepostedjobsid")
	 public ModelAndView userViewEmployerPostedJobsScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_empposted_jobs";
		 if(stdmodel.getRowid()==0){
			 return new ModelAndView(errorPage, "listjobdetails", stdmodel);
		 }
		 int jobdetailid=stdmodel.getRowid();
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 logger.info("userViewEmployerPostedJobsScreenId: "+listData);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewEmployerPostedJobsById", "listjobdetails", stdmodel);
	 }

}

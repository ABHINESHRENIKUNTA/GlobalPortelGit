package com.globalwebsite.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class UserViewJobDetailsByIdController {

	private final static Logger logger = Logger.getLogger(UserViewJobDetailsByIdController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	private final String errorPage="user/userErrorPage";
	
	 @RequestMapping("/view-userconsultantsjobsbyid")
	 public String userViewConsultantJobScreenById(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_jobconsult_jobs";
		 boolean selectflag = stdmodel.getTablekey()!=null;
		 if(selectflag==false){
			 return errorPage;
		 }
		 int jobdetailid=Integer.valueOf(stdmodel.getTablekey().trim());
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return "user/userViewConsultantJobs";
	 }
	 @RequestMapping("/view-userreferraljobsid")
	 public String userViewReferralScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_refpost_jobs";
		 boolean selectflag = stdmodel.getTablekey()!=null;
		 if(selectflag==false){
			 return errorPage;
		 }
		 int jobdetailid=Integer.valueOf(stdmodel.getTablekey().trim());
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return "user/userViewReferralJobs";
	 }
	 @RequestMapping("/view-userpostedbyadminid")
	 public String userViewPostedByAdminScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_postedbyadmin_jobs";
		 boolean selectflag = stdmodel.getTablekey()!=null;
		 if(selectflag==false){
			 return errorPage;
		 }
		 int jobdetailid=Integer.valueOf(stdmodel.getTablekey().trim());
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return "user/userViewJobsPostedByAdmin";
	 }
	 @RequestMapping("/view-useremployeepostedjobsid")
	 public String userViewEmployerPostedJobsScreenId(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_empposted_jobs";
		 boolean selectflag = stdmodel.getTablekey()!=null;
		 if(selectflag==false){
			 return errorPage;
		 }
		 int jobdetailid=Integer.valueOf(stdmodel.getTablekey().trim());
		 List<AdminSubmissionModel> listData = userserviceimpl.findSelectedViewJobInfo(jobdetailid, tablekey);
		 model.addAttribute("listData", listData);
		 return "user/userViewEmployerPostedJobs";
	 }

}

package com.globalwebsite.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.controller.AdminStudentHomeInfoController;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class UserViewAllPagesJobsController {

	private final static Logger logger = Logger.getLogger(UserViewAllPagesJobsController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	private final int activenum =1;
	
	 @RequestMapping("/view-userpopularjobs")
	 public String userViewPopularJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		List<AdminSubmissionModel> popularList = userserviceimpl.getActivePopularJobs(activenum);
		 model.addAttribute("popularList", popularList);
		 return "user/userViewPopularJobs";
	 }
	 @RequestMapping("/view-userstatewisejobs")
	 public String userViewStateWiseJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewStateWiseJobs";
	 }
	 @RequestMapping("/view-usercentralgovjobs")
	 public String userViewCentralGovJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewCentralGovJobs";
	 }
	 @RequestMapping("/view-userViewAbroadJobs")
	 public String userViewAbroadJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewAbroadJobs";
	 }
	
	 @RequestMapping("/view-useritjobs")
	 public String userViewItJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewITJobs";
	 }
	 @RequestMapping("/view-usernonitjobs")
	 public String userViewNonJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userNonITJobs";
	 }
	 @RequestMapping("/view-userconsultantsjobs")
	 public String userViewConsultantJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewConsultantJobs";
	 }
	 @RequestMapping("/view-userfreejobtraininginst")
	 public String userViewFreeJobTrainingInstScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewFreeTrainingInstJobs";
	 }
	 @RequestMapping("/view-usertrainingplacinst")
	 public String userViewTrainingAndPlacementInstScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewTrainingPlacInst";
	 }
	 @RequestMapping("/view-userreferraljobs")
	 public String userViewReferralScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewReferralJobs";
	 }
	
	 @RequestMapping("/view-userpostedbyadmin")
	 public String userViewPostedByAdminScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewJobsPostedByAdmin";
	 }
	 @RequestMapping("/view-useremployeepostedjobs")
	 public String userViewEmployerPostedJobsScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return "user/userViewEmployerPostedJobs";
	 }
	
}

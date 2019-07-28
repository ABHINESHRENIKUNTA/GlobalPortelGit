package com.globalwebsite.common.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.StatesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class UserViewAllPagesJobsController {

	private final static Logger logger = Logger.getLogger(UserViewAllPagesJobsController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	private final int activenum =1;
	
	 @RequestMapping("/view-userpopularjobs")
	 public ModelAndView userViewPopularJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 List<AdminSubmissionModel> popularList = userserviceimpl.getActivePopularJobs(activenum);
		 model.addAttribute("popularList", popularList);
		 return new ModelAndView("user/userViewPopularJobs", "jobdetails", stdmodel);
	 }
	 @RequestMapping("/view-userstatewisejobs")
	 public ModelAndView userViewStateWiseJobScreen(Model model, AdminSubmissionModel stdmodel){
		 List<StatesModel> stateList = adminservices.findAllStates();
			
		 model.addAttribute("stateList", stateList);
		 return new ModelAndView("user/userViewStateWiseJobs", "statewise", stdmodel);
	 }
	 @RequestMapping("/view-usercentralgovjobs")
	 public ModelAndView userViewCentralGovJobScreen(Model model, AdminSubmissionModel stdmodel){
		
		 return new ModelAndView("user/userViewCentralGovJobs", "jobdetails", stdmodel);
	 }
	 @RequestMapping("/view-userViewAbroadJobs")
	 public ModelAndView userViewAbroadJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return new ModelAndView("user/userViewAbroadJobs", "jobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-useritjobs")
	 public ModelAndView userViewItJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return new ModelAndView("user/userViewITJobs", "jobdetails", stdmodel);
	 }
	 @RequestMapping("/view-usernonitjobs")
	 public ModelAndView userViewNonJobScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return new ModelAndView("user/userNonITJobs", "jobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-userfreejobtraininginst")
	 public ModelAndView userViewFreeJobTrainingInstScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return new ModelAndView("user/userViewFreeTrainingInstJobs", "jobdetails", stdmodel);
	 }
	 @RequestMapping("/view-usertrainingplacinst")
	 public ModelAndView userViewTrainingAndPlacementInstScreen(Model model, AdminSubmissionModel stdmodel){
		 
		 return new ModelAndView("user/userViewTrainingPlacInst", "jobdetails", stdmodel);
	 }
	 
	 @RequestMapping("/view-userconsultantsjobs")
	 public ModelAndView userViewConsultantJobScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_jobconsult_jobs";
		 List<AdminSubmissionModel> listData = userserviceimpl.findAllViewJobInfo(activenum, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewConsultantJobs", "jobdetails", stdmodel);
	 }
	 
	 @RequestMapping("/view-userreferraljobs")
	 public ModelAndView userViewReferralScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_refpost_jobs";
		 List<AdminSubmissionModel> listData = userserviceimpl.findAllViewJobInfo(activenum, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewReferralJobs", "jobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-userpostedbyadmin")
	 public ModelAndView userViewPostedByAdminScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_postedbyadmin_jobs";
		 List<AdminSubmissionModel> listData = userserviceimpl.findAllViewJobInfo(activenum, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewJobsPostedByAdmin", "jobdetails", stdmodel);
	 }
	 @RequestMapping("/view-useremployeepostedjobs")
	 public ModelAndView userViewEmployerPostedJobsScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_empposted_jobs";
		 List<AdminSubmissionModel> listData = userserviceimpl.findAllViewJobInfo(activenum, tablekey);
		 model.addAttribute("listData", listData);
		 return new ModelAndView("user/userViewEmployerPostedJobs", "jobdetails", stdmodel);
	 }
	
}

package com.globalwebsite.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserViewAllPagesJobsController {

	 @RequestMapping("/view-userpopularjobs")
	 public String userViewPopularJobScreen(Model model){
		 
		 return "user/userViewPopularJobs";
	 }
	 @RequestMapping("/view-userstatewisejobs")
	 public String userViewStateWiseJobScreen(Model model){
		 
		 return "user/userViewStateWiseJobs";
	 }
	 @RequestMapping("/view-usercentralgovjobs")
	 public String userViewCentralGovJobScreen(Model model){
		 
		 return "user/userViewCentralGovJobs";
	 }
	 @RequestMapping("/view-userViewAbroadJobs")
	 public String userViewAbroadJobScreen(Model model){
		 
		 return "user/userViewAbroadJobs";
	 }
	
	 @RequestMapping("/view-useritjobs")
	 public String userViewItJobScreen(Model model){
		 
		 return "user/userViewITJobs";
	 }
	 @RequestMapping("/view-usernonitjobs")
	 public String userViewNonJobScreen(Model model){
		 
		 return "user/userNonITJobs";
	 }
	 @RequestMapping("/view-userconsultantsjobs")
	 public String userViewConsultantJobScreen(Model model){
		 
		 return "user/userViewConsultantJobs";
	 }
	 @RequestMapping("/view-userfreejobtraininginst")
	 public String userViewFreeJobTrainingInstScreen(Model model){
		 
		 return "user/userViewFreeTrainingInstJobs";
	 }
	 @RequestMapping("/view-usertrainingplacinst")
	 public String userViewTrainingAndPlacementInstScreen(Model model){
		 
		 return "user/userViewTrainingPlacInst";
	 }
	
	 @RequestMapping("/view-userpostedbyadmin")
	 public String userViewPostedByAdminScreen(Model model){
		 
		 return "user/userViewJobsPostedByAdmin";
	 }
	 @RequestMapping("/view-useremployeepostedjobs")
	 public String userViewEmployerPostedJobsScreen(Model model){
		 
		 return "user/userViewEmployerPostedJobs";
	 }
	
}

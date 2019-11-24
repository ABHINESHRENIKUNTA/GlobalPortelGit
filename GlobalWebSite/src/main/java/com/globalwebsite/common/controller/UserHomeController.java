package com.globalwebsite.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

@Controller
public class UserHomeController {
	
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	private int activenum=1;
	
	@Value("${companyLogoFolder.Name}")
	private String companyLogoFolder;
	
	 @RequestMapping("/GlobalSiteWelcomePage")
	 public String globalSiteWelcomePage(Model model){
		 List<AdminAddUserImagesModel> admdata= adminservices.getAdminDeleteUserImages();
		 model.addAttribute("admdata", admdata);
		 List<AdminAddUserImagesModel> logosList= adminservices.getAdminDeleteCompanyLogos();
		 model.addAttribute("logosList", logosList);
		 model.addAttribute("companyLogoFolder", companyLogoFolder);
		 return "user/welcomePage";
	 }
	
	 @RequestMapping("/load-jobcategories")
	 public String loadJobCategoriesPage(Model model){
		 
		 avilableLinksCount(model);
		 return "user/userJobCategories";
	 }
	 
	 @ModelAttribute
	 public void avilableLinksCount(Model model){
		  int popularcnt = userserviceimpl.getPopulaJobsCount(activenum);
		    model.addAttribute("popularcnt", popularcnt);
			int statecnt = userserviceimpl.getStatewiseGovtJobsCount(activenum);
			model.addAttribute("statecnt", statecnt);
			int centralcnt = userserviceimpl.getCentralGovJobsCount(activenum);
			model.addAttribute("centralcnt", centralcnt);
			int abroadcnt = userserviceimpl.getAbroadJobsCount(activenum);
			model.addAttribute("abroadcnt", abroadcnt);
			int itcnt = userserviceimpl.getItJobsCount(activenum);
			model.addAttribute("itcnt", itcnt);
			int nonitcnt = userserviceimpl.getNonItJobsCount(activenum);
			model.addAttribute("nonitcnt", nonitcnt);
			int freecnt = userserviceimpl.getFreeJobsCount(activenum);
			model.addAttribute("freecnt", freecnt);
			int placementcnt = userserviceimpl.getPlacementJobsCount(activenum);
			model.addAttribute("placementcnt", placementcnt);
			int consultantcnt = userserviceimpl.getPostedByConsultantsjobscount(activenum);
			model.addAttribute("consultantcnt", consultantcnt);
			int referralcnt = userserviceimpl.getPostedByReferralsJobsCount(activenum);
			model.addAttribute("referralcnt", referralcnt);
			int admincnt = userserviceimpl.getPostedByAdminJobsCount(activenum);
			model.addAttribute("admincnt", admincnt);
			int empcnt = userserviceimpl.getPostedbyEmpJobsCount(activenum);
			model.addAttribute("empcnt", empcnt);
	 }

}

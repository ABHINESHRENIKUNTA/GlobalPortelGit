package com.globalwebsite.common.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.CountryModel;
import com.globalwebsite.admin.model.IndustryTypeModel;
import com.globalwebsite.admin.model.StatesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.model.JobDetailCountModel;
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
	
	@Value("${user.viewtype}")
	private String viewType;
	
	
	 @RequestMapping("/view-userpopularjobs")
	 public ModelAndView userViewPopularJobScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_popular_jobsites_page";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userViewPopularJobs", "listjobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-usercentralgovjobs")
	 public ModelAndView userViewCentralGovJobScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_centralgov_jobs";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userViewCentralGovJobs", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-userstatewisejobs")
	 public ModelAndView userViewStateWiseJobScreen(Model model, AdminSubmissionModel stdmodel){
		 List<StatesModel> stateList = adminservices.findAllStates();
		 model.addAttribute("stateList", stateList);
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getActiveStatewiseJobs(activenum);
		 logger.info("State List Size::: "+CollectionUtils.size(jobsList));
		 model.addAttribute("jobsList", jobsList);
		 return new ModelAndView("user/userViewStateWiseJobs", "statewise", stdmodel);
	 }
	 @RequestMapping("/view-userViewAbroadJobs")
	 public ModelAndView userViewAbroadJobScreen(Model model, AdminSubmissionModel stdmodel){
		 List<CountryModel> countryList = adminservices.findAllCountries();
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getActiveAbroadJobs(activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("countryList", countryList);
		 return new ModelAndView("user/userViewAbroadJobs", "abroadlist", stdmodel);
	 }
	
	 @RequestMapping("/view-useritjobs")
	 public ModelAndView userViewItJobScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_it_jobs";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userViewITJobs", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-usernonitjobs")
	 public ModelAndView userViewNonJobScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_nonit_jobs";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userNonITJobs", "listjobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-userfreejobtraininginst")
	 public ModelAndView userViewFreeJobTrainingInstScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_freejobtraining_jobs";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userViewFreeTrainingInstJobs", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-usertrainingplacinst")
	 public ModelAndView userViewTrainingAndPlacementInstScreen(Model model, AdminSubmissionModel stdmodel){
		 String tablekey="global_trainingandplace_jobs";
		 List<AdminSubmissionModel> jobsList = userserviceimpl.getCommonSubmissionJobsList(tablekey,activenum);
		 model.addAttribute("jobsList", jobsList);
		 model.addAttribute("tablekey", tablekey);
		 return new ModelAndView("user/userViewTrainingPlacInst", "listjobdetails", stdmodel);
	 }
	 
	 @RequestMapping("/view-userconsultantsjobs")
	 public ModelAndView userViewConsultantJobScreen(Model model, AdminSubmissionModel stdmodel, HttpServletRequest request){
		 String tablekey="global_jobconsult_jobs";
		 String jobtype=request.getParameter("jobtype");
		 String industryid=request.getParameter("industryid");
		 boolean isFilterResults = filterJobDetailsData(model, stdmodel, request);
		 model.addAttribute("jobtype",jobtype);
		 model.addAttribute("industrydataval",industryid);
		 fetchAllJobListDetails(model, tablekey, isFilterResults);
		
		 return new ModelAndView("user/userViewConsultantJobs", "listjobdetails", stdmodel);
	 }

	 
	 @RequestMapping("/view-userreferraljobs")
	 public ModelAndView userViewReferralScreen(Model model, AdminSubmissionModel stdmodel, HttpServletRequest request){
		 String tablekey="global_refpost_jobs";
		 boolean isFilterResults = filterJobDetailsData(model, stdmodel, request);
		 fetchAllJobListDetails(model, tablekey, isFilterResults);
		 String jobtype=request.getParameter("jobtype");
		 String industryid=request.getParameter("industryid");
		 model.addAttribute("jobtype",jobtype);
		 model.addAttribute("industrydataval",industryid);
		 return new ModelAndView("user/userViewReferralJobs", "listjobdetails", stdmodel);
	 }
	
	 @RequestMapping("/view-userpostedbyadmin")
	 public ModelAndView userViewPostedByAdminScreen(Model model, AdminSubmissionModel stdmodel, HttpServletRequest request){
		 String tablekey="global_postedbyadmin_jobs";
		 boolean isFilterResults = filterJobDetailsData(model, stdmodel, request);
		 String jobtype=request.getParameter("jobtype");
		 String industryid=request.getParameter("industryid");
		 model.addAttribute("jobtype",jobtype);
		 model.addAttribute("industrydataval",industryid);
		 fetchAllJobListDetails(model, tablekey, isFilterResults);
		 return new ModelAndView("user/userViewJobsPostedByAdmin", "listjobdetails", stdmodel);
	 }
	 @RequestMapping("/view-useremployeepostedjobs")
	 public ModelAndView userViewEmployerPostedJobsScreen(Model model, AdminSubmissionModel stdmodel, HttpServletRequest request){
		 String tablekey="global_empposted_jobs";
		 boolean isFilterResults = filterJobDetailsData(model, stdmodel, request);
		 String jobtype=request.getParameter("jobtype");
		 String industryid=request.getParameter("industryid");
		 model.addAttribute("jobtype",jobtype);
		 model.addAttribute("industrydataval",industryid);
		 fetchAllJobListDetails(model, tablekey, isFilterResults);
		 return new ModelAndView("user/userViewEmployerPostedJobs", "listjobdetails", stdmodel);
	 }
	 
	 
	 public boolean filterJobDetailsData(Model model,AdminSubmissionModel stdmodel, HttpServletRequest request){
			String[] jobtypelist = request.getParameterValues("jobtype");
			String[] industryidlist = request.getParameterValues("industryid");
			String tablekey = request.getParameter("tablekey");
			String wherecond = "";
			String indulist="";
			String joblist="";
			boolean isFilterResults = false;
			if(jobtypelist!=null && industryidlist!=null){
					for (int i = 0; i < industryidlist.length; i++) {
						indulist = industryidlist.length > 1? indulist += industryidlist[i]+",":industryidlist[i];
					}
					for (int j = 0; j < jobtypelist.length; j++) {
						joblist = jobtypelist.length > 1? joblist += "'"+jobtypelist[j]+"'"+",":"'"+jobtypelist[j]+"'";
					}
					char replaceWith = ' ';
					indulist= industryidlist.length > 1?replaceLastCharacter(indulist, replaceWith).trim():indulist;
					joblist= jobtypelist.length > 1?replaceLastCharacter(joblist, replaceWith).trim():joblist;
					wherecond = "and jd.industry_id in("+indulist+") and jd.jobtype in("+joblist+")";
					logger.info("jobtypelist!=null && industryidlist!=null:: "+wherecond);
					isFilterResults = true;
					List<AdminSubmissionModel> listData = userserviceimpl.fetchJobDetailsByFilter(tablekey, wherecond, activenum);
					model.addAttribute("listData", listData);
				}else if(jobtypelist!=null && null==industryidlist){
					for (int j = 0; j < jobtypelist.length; j++) {
						joblist = jobtypelist.length > 1? joblist += "'"+jobtypelist[j]+"'"+",":"'"+jobtypelist[j]+"'";
					}
					char replaceWith = ' ';
					joblist= jobtypelist.length > 1?replaceLastCharacter(joblist, replaceWith).trim():joblist;
					wherecond = "and jd.jobtype in("+joblist+")";
					logger.info("jobtypelist!=null && null==industryidlist:: "+wherecond);
					List<AdminSubmissionModel> listData = userserviceimpl.fetchJobDetailsByFilter(tablekey, wherecond, activenum);
					isFilterResults = true;
					model.addAttribute("listData", listData);
				}else if(industryidlist!=null && null==jobtypelist){
					for (int i = 0; i < industryidlist.length; i++) {
						indulist = industryidlist.length > 1? indulist += industryidlist[i]+",":industryidlist[i]+"";
					}
					char replaceWith = ' ';
					indulist= industryidlist.length > 1?replaceLastCharacter(indulist, replaceWith).trim():indulist;
					wherecond = "and jd.industry_id in("+indulist+")";
					logger.info("industryidlist!=null && null==jobtypelist:: "+wherecond);
					isFilterResults = true;
					List<AdminSubmissionModel> listData = userserviceimpl.fetchJobDetailsByFilter(tablekey, wherecond, activenum);
					model.addAttribute("listData", listData);
				}else{
					logger.info("Nothing is selected to filter job details:");
				}
			
			
			return  isFilterResults;
			
		}
	 
	 /**
		 * @param model
		 * @param tablekey
		 * @param isFilterResults
		 */
		public void fetchAllJobListDetails(Model model, String tablekey, boolean isFilterResults) {
			if(!isFilterResults){
				 List<AdminSubmissionModel> listData = userserviceimpl.findAllViewJobInfo(activenum, tablekey);
			     model.addAttribute("listData", listData);
			 }
			 List<JobDetailCountModel> industryList = userserviceimpl.getTotalIndustryCount(activenum, tablekey);
			 model.addAttribute("industryList", industryList);
			 model.addAttribute("tablekey", tablekey);
			 
		}

		/**
		 * @param str
		 * @param replaceWith
		 * @return
		 */
		public String replaceLastCharacter(String str, char replaceWith) {
			StringBuilder sBuilder = new StringBuilder(str);
			sBuilder.setCharAt(sBuilder.length()-1, replaceWith);
			return sBuilder.toString();
		}
	
}

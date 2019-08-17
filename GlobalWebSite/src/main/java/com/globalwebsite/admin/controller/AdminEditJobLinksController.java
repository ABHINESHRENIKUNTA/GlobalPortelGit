package com.globalwebsite.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.model.CountryModel;
import com.globalwebsite.admin.model.IndustryTypeModel;
import com.globalwebsite.admin.model.StatesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.controller.DatabaseTableNames;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class AdminEditJobLinksController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminEditJobLinksController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@RequestMapping("edit-typeonedetails")
	public String adminViewTypeOneJspForUpdate(Model model, AdminSubmissionModel stdmodel, HttpServletRequest req){
		
		model.addAttribute("adminupdatestuinfo", stdmodel);
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = stdmodel.getTablekey();
		int rowId = stdmodel.getRowid();
		String retvalue = "studentadmin/adminEditOneJobInfo";
		String retvalueCREP = "studentadmin/adminEditOneJobInfo";
		if (!mapvalues.containsKey(selectpage)) {
			return "admin/somethingError";
		}
		stdmodel.setTablekey(selectpage);
		model.addAttribute("tablekey", selectpage);
		model.addAttribute("tableval", mapvalues.get(selectpage));
		
		List<CountryModel> countryList = adminservices.findAllCountries();
		List<StatesModel> stateList = adminservices.findAllStates();
		List<IndustryTypeModel> industryList = adminservices.findAllIndustryTypes();
		logger.info("countryList::: "+countryList);
		logger.info("stateList::: "+stateList);
		logger.info("industryList::: "+industryList);
		
		model.addAttribute("industryList", industryList);
		model.addAttribute("stateList", stateList);
		model.addAttribute("countryList", countryList);
		
		/*Job Consultants, Referral, Employee and Posted By Administrator Jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_jobconsult_jobs")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_refpost_jobs"))
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_postedbyadmin_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_empposted_jobs"))) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
		List<AdminSubmissionModel> alistdata = adminservices.getAllViewConsuRefAdminPostSubmissionDataById(stdmodel.getTablekey(),rowId);
		setViewConsuRefAdminPostSubmissionDataById(stdmodel, alistdata);
		model.addAttribute("alistdata", alistdata);
		model.addAttribute("rowId", rowId);
		return retvalueCREP;
		}
		
		/*popular, central, it, non-it, training, free-training jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_popular_jobsites_page")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_centralgov_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_it_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_nonit_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_trainingandplace_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_freejobtraining_jobs"))) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewSubmissionDataById(stdmodel.getTablekey(), rowId);
			for (AdminSubmissionModel as1 : alistdata) {
				stdmodel.setLinkname(as1.getLinkname());
				stdmodel.setLinkaddress(as1.getLinkaddress());
				stdmodel.setComments(as1.getComments());
				stdmodel.setIsactive(as1.isIsactive());
			}
			logger.info("Selected Table Data: "+selectpage +" in: "+alistdata );
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}
		/*Abroad Jobs view*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_abroad_jobs")) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminAbroadDataById(stdmodel.getTablekey(), rowId);
			for (AdminSubmissionModel as1 : alistdata) {
				stdmodel.setLinkname(as1.getLinkname());
				stdmodel.setLinkaddress(as1.getLinkaddress());
				stdmodel.setCountryiso(as1.getCountryiso());
				stdmodel.setCountrystate(as1.getCountrystate());
				stdmodel.setComments(as1.getComments());
				stdmodel.setIsactive(as1.isIsactive());
			}
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}
		/*State-Wise Jobs view*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_statewisegovt_jobs")) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminStateWiseDataById(stdmodel.getTablekey(), rowId);
			for (AdminSubmissionModel as1 : alistdata) {
				stdmodel.setLinkname(as1.getLinkname());
				stdmodel.setLinkaddress(as1.getLinkaddress());
				stdmodel.setStateid(as1.getStateid());
				stdmodel.setComments(as1.getComments());
				stdmodel.setIsactive(as1.isIsactive());
			}
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}
	
		return retvalue;
		
	}
	
	/*Job Consultants, Referral, Employee and Posted By Administrator Jobs*/
	public void setViewConsuRefAdminPostSubmissionDataById(AdminSubmissionModel stdmodel,
			List<AdminSubmissionModel> alistdata) {
		for (AdminSubmissionModel item : alistdata) {
			
			stdmodel.setJobtitle(item.getJobtitle());
			
			stdmodel.setIndustryid(item.getIndustryid());
			stdmodel.setCompany(item.getCompany());
			stdmodel.setQualification(item.getQualification());
			stdmodel.setExperience(item.getExperience());
			stdmodel.setNoticeperiod(item.getNoticeperiod());
			stdmodel.setRolecategory(item.getRolecategory());
			stdmodel.setSalary(item.getSalary());
			stdmodel.setNoofpossitions(item.getNoofpossitions());
			stdmodel.setJobtype(item.getJobtype());
			stdmodel.setEmailid(item.getEmailid());
			stdmodel.setContactnum(item.getContactnum());
			stdmodel.setLocation(item.getLocation());
			stdmodel.setJobresponsibilities(item.getJobresponsibilities());
			stdmodel.setSkillreq(item.getSkillreq());
			stdmodel.setOtherinfo(item.getOtherinfo());
			stdmodel.setIsactive(item.isIsactive());
		}
	}

}

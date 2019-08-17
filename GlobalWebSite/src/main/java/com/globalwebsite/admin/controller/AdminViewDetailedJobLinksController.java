package com.globalwebsite.admin.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.controller.DatabaseTableNames;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class AdminViewDetailedJobLinksController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminAddJobLinksController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@RequestMapping("/load-adminviewallcommoninfo")
	public String adminCommonViewAllInfoPage(Model model, AdminSubmissionModel stdmodel, HttpServletRequest req) throws ParseException {

		model.addAttribute("adminviewstuinfo", stdmodel);
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = stdmodel.getTablekey();
		int rowId = stdmodel.getRowid();
		String retvalue = "studentadmin/adminViewDetailedJobInfo";
		String retvalueCREP = "studentadmin/adminViewDetailedJobInfoById";
		
		
		if (!mapvalues.containsKey(selectpage)) {
			return "admin/somethingError";
		}
		stdmodel.setTablekey(selectpage);
		model.addAttribute("tablekey", selectpage);
		model.addAttribute("tableval", mapvalues.get(selectpage));
		
		/*Job Consultants, Referral, Employee and Posted By Administrator Jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_jobconsult_jobs")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_refpost_jobs"))
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_postedbyadmin_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_empposted_jobs"))) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
		List<AdminSubmissionModel> alistdata = adminservices.getAllViewConsuRefAdminPostSubmissionDataById(stdmodel.getTablekey(),rowId);
		model.addAttribute("alistdata", alistdata);
		model.addAttribute("rowId", rowId);
		return retvalueCREP;
		}
		if (StringUtils.equals(stdmodel.getTablekey(), "global_popular_jobsites_page")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_centralgov_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_it_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_nonit_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_trainingandplace_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_freejobtraining_jobs"))) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewSubmissionDataById(stdmodel.getTablekey(), rowId);
			logger.info("Selected Table Data: "+selectpage +" in: "+alistdata );
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}
		/*Abroad Jobs view*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_abroad_jobs")) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminAbroadDataById(stdmodel.getTablekey(), rowId);
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}
		/*State-Wise Jobs view*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_statewisegovt_jobs")) {
			logger.info("Selected Table: "+selectpage +" AND Selected Row: "+rowId );
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminStateWiseDataById(stdmodel.getTablekey(), rowId);
			model.addAttribute("alistdata", alistdata);
			model.addAttribute("rowId", rowId);
		}

		return retvalue;

	}
	
}

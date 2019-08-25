package com.globalwebsite.admin.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.controller.DatabaseTableNames;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class AdminUpdateJobLinksController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminUpdateJobLinksController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@Value("${admin.viewtype}")
	private String viewType;
	
	@RequestMapping(value="/adminupdatestudenthomeinfo")
	public String adminCommonUpdateInfoPage(Model model, AdminSubmissionModel stdmodel,
			@RequestParam(required=false, value="imagepath") MultipartFile file, FileUploadToTomcatController fut,HttpSession sess) throws Exception {
		String imageFolder = stdmodel.getTablekey();
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		String imgpath ="";
		if ((String)sess.getAttribute("username")!=null) {
			stdmodel.setLoggedowner((String)sess.getAttribute("username"));
		}else{
			return "admin/somethingError";
			
		}
		/*Job Consultants, Referral and Posted By Administrator Jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_jobconsult_jobs")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_refpost_jobs"))
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_postedbyadmin_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_empposted_jobs"))) {
				logger.info("Entered in: " + stdmodel.getTablename());
				succsscnt = adminservices.updateAdminAddJobAllJobDetailsInfo(stdmodel);
		}
		/*popular, central, it and non it insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_popular_jobsites_page")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_centralgov_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_it_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_nonit_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_trainingandplace_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_freejobtraining_jobs"))) {
				
				logger.info("Entered in: " + stdmodel.getTablename());
				succsscnt = adminservices.updateSubmissionData(stdmodel);
		}
		/*Abroad Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_abroad_jobs")) {
			logger.info("Entered in: " + stdmodel.getTablename());
			succsscnt = adminservices.updateAbroadSubmissionData(stdmodel);
		}
		/*State-Wise Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_statewisegovt_jobs")) {
			logger.info("Entered in: " + stdmodel.getTablename());
			succsscnt = adminservices.updateStateSubmissionData(stdmodel);
		}
		
		logger.info("Image Path::: "+imgpath);
		if (succsscnt > 0) {
			susmsg = stdmodel.getTablename() + " data successfully updated.";
			logger.info(susmsg);
		} else {
			errormsg = stdmodel.getTablename() + " data not updated. Please try with valid data or contact support team.";
			logger.info(errormsg);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		model.addAttribute("selectedparam", imageFolder);
		
		return "redirect:/load-adminviewcommoninfo";

	}
	
}

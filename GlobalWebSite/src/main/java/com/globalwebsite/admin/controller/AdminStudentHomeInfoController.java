package com.globalwebsite.admin.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.CountryModel;
import com.globalwebsite.admin.model.StatesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.controller.DatabaseTableNames;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class AdminStudentHomeInfoController extends DatabaseTableNames {

	private final static Logger logger = Logger.getLogger(AdminStudentHomeInfoController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;

	@RequestMapping("/load-adminaddstuinfo")
	public ModelAndView adminCommonAddInfoPage(AdminSubmissionModel stdmodel, Model model, HttpServletRequest req)
			throws Exception {
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = req.getParameter("selectedparam");
		logger.info("Admin Selected Page: " + selectpage);
		if (!mapvalues.containsKey(selectpage)) {
			return new ModelAndView("admin/somethingError", "adminaddstuinfo", stdmodel);
		}
		
		List<CountryModel> countryList = adminservices.findAllCountries();
		List<StatesModel> stateList = adminservices.findAllStates();
		
		model.addAttribute("stateList", stateList);
		model.addAttribute("countryList", countryList);
		model.addAttribute("tablekey", selectpage);
		model.addAttribute("tableval", mapvalues.get(selectpage));
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		return new ModelAndView("studentadmin/adminAddJobInfo", "adminaddstuinfo", stdmodel);

	}

	@SuppressWarnings("unused") // Testing method
	private String encodeFileToBase64Binary(MultipartFile file) throws Exception {
		byte[] bytes = file.getBytes();
		String imageString = new String(Base64.encodeBase64(bytes), "UTF-8");
		String imageString1 = "<img src='data:image/png;base64," + imageString + "/'>";
		return imageString1;
	}

	@RequestMapping("/adminaddstudenthomeinfo")
	public String adminCommonSubmitInfoPage(Model model, AdminSubmissionModel stdmodel,
			@RequestParam(required=false, value="imagepath") MultipartFile file, FileUploadToTomcatController fut) throws Exception {

		String imageFolder = stdmodel.getTablekey();
		model.addAttribute("adminupdatestuinfo", stdmodel);
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		stdmodel.setLoggedowner("Prakash Varma");
		String imgpath ="";
		/*popular, central, it and non it insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_popular_jobsites_page")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_centralgov_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_it_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_nonit_jobs"))) {
			/** Save Image in Selected Folder **/
			succsscnt = adminservices.insertSubmissionData(stdmodel);
			imgpath = saveImageInSelectedFolder(stdmodel, file, fut, imageFolder, succsscnt);
			adminservices.updateImageFileNameInTable(stdmodel.getTablekey(), imgpath, succsscnt);
		}
		/*Abroad Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_abroad_jobs")) {
			/** Save Image in Selected Folder **/
			succsscnt = adminservices.insertAbroadSubmissionData(stdmodel);
			imgpath = saveImageInSelectedFolder(stdmodel, file, fut, imageFolder, succsscnt);
			adminservices.updateImageFileNameInTable(stdmodel.getTablekey(), imgpath, succsscnt);
		}
		/*State-Wise Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_statewisegovt_jobs")) {
			/** Save Image in Selected Folder **/
			succsscnt = adminservices.insertStateSubmissionData(stdmodel);
			imgpath = saveImageInSelectedFolder(stdmodel, file, fut, imageFolder, succsscnt);
			adminservices.updateImageFileNameInTable(stdmodel.getTablekey(), imgpath, succsscnt);
		}
		/*Job Consultants, Referral and Posted By Administrator Jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_jobconsult_jobs")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_refpost_jobs"))
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_postedbyadmin_jobs"))) {
			System.out.println("Entered in: " + stdmodel.getTablename());
			logger.info("Entered in: " + stdmodel.getTablename());
			succsscnt = adminservices.adminAddJobConsultantInfo(stdmodel);
		}
		System.out.println("Image Path::: "+imgpath);
		logger.info("Image Path::: "+imgpath);
		if (succsscnt > 0) {
			susmsg = stdmodel.getTablename() + " data successfully added.";
			logger.info(susmsg);
		} else {
			errormsg = stdmodel.getTablename() + " data not added. Please try with valid data or contact support team.";
			logger.info(errormsg);
			fut.removeImageFromDirectory(imageFolder, imgpath);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		model.addAttribute("selectedparam", imageFolder);
		return "redirect:/load-adminaddstuinfo";

	}

	/**
	 * Save Image in Selected Folder
	 **/
	public String saveImageInSelectedFolder(AdminSubmissionModel stdmodel, MultipartFile file,
			FileUploadToTomcatController fut, String imageFolder, int rowid) {
		// Get total count from selected table (SQL query)
		//int tablecnt = adminservices.selectCountForSubmissionData(stdmodel);
		// Create TOMCAT Directory Object
		System.out.println(stdmodel.getTablename());
		// Save Image in TOMCAT directory
		String imgpath = fut.saveImagesInTomcatDirectory(file, imageFolder, rowid);
		stdmodel.setFilename(imgpath);
		return imgpath;
	}

	@RequestMapping("/load-adminupdatestuinfo")
	public String adminCommonEditInfoPage(Model model, AdminSubmissionModel stdmodel) {

		model.addAttribute("adminupdatestuinfo", stdmodel);

		return "studentadmin/adminUpdateJobInfo";

	}


	/**
	 * View Common Info Method
	 * 
	 * **/
	@RequestMapping("/load-adminviewcommoninfo")
	public String adminCommonViewInfoPage(Model model, AdminSubmissionModel stdmodel, HttpServletRequest req) throws ParseException {

		model.addAttribute("adminviewstuinfo", stdmodel);
		Map<String, String> mapvalues = tableReferenceData();
		String selectpage = req.getParameter("selectedparam");
		String retvalue = "studentadmin/adminViewJobInfo";
		System.out.println("date range: "+stdmodel.getDaterange());
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat jspfmt = new SimpleDateFormat("dd/MMM/yyyy");
		String currentdate=null;
		String prevdate=null;
		if(null==stdmodel.getDaterange()){
			    Date date = new Date();
			    GregorianCalendar cal = new GregorianCalendar();
				cal.setTime(date);
				Date curdate =cal.getTime();
				currentdate = fmt.format(curdate);
				cal.add(Calendar.DATE, -30);
			    Date newDate = cal.getTime();
			    prevdate = fmt.format(newDate);
		}else{
			Date dateprev = jspfmt.parse(stdmodel.getDaterange().split("-")[0].trim());
			Date datecur = jspfmt.parse(stdmodel.getDaterange().split("-")[1].trim()); 
			prevdate = fmt.format(dateprev);
			currentdate = fmt.format(datecur);
		}
		System.out.println("date range: "+currentdate);
		System.out.println("date range: "+prevdate);
		
		if (!mapvalues.containsKey(selectpage)) {
			return "admin/somethingError";
		}
		stdmodel.setTablekey(selectpage);
		model.addAttribute("tablekey", selectpage);
		model.addAttribute("tableval", mapvalues.get(selectpage));
		
		/*Job Consultants, Referral and Posted By Administrator Jobs*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_jobconsult_jobs")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_refpost_jobs"))
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_postedbyadmin_jobs"))) {
		List<AdminSubmissionModel> alistdata = adminservices.getAllViewConsuRefAdminPostSubmissionData(stdmodel.getTablekey(),prevdate, currentdate);
		model.addAttribute("alistdata", alistdata);
		}
		/*popular, central, it and non it insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_popular_jobsites_page")
				|| (StringUtils.equals(stdmodel.getTablekey(), "global_centralgov_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_it_jobs"))
			    || (StringUtils.equals(stdmodel.getTablekey(), "global_nonit_jobs"))) {
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewSubmissionData(stdmodel.getTablekey(), prevdate, currentdate);
			model.addAttribute("alistdata", alistdata);
		}
		/*Abroad Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_abroad_jobs")) {
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminAbroadData(stdmodel.getTablekey(), prevdate, currentdate);
			model.addAttribute("alistdata", alistdata);
		}
		/*State-Wise Jobs insert*/
		if (StringUtils.equals(stdmodel.getTablekey(), "global_statewisegovt_jobs")) {
			List<AdminSubmissionModel> alistdata = adminservices.getAllViewAdminStateWiseData(stdmodel.getTablekey(), prevdate, currentdate);
			model.addAttribute("alistdata", alistdata);
		}
		model.addAttribute("prevdate",jspfmt.format(fmt.parse(prevdate)));
		model.addAttribute("presdate",jspfmt.format(fmt.parse(currentdate)));

		return retvalue;

	}

}

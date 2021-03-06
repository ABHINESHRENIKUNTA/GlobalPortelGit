package com.globalwebsite.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminOperatorModel;
import com.globalwebsite.admin.model.AdminOrganizationModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminOperatorController {
	
	private final static Logger logger = Logger.getLogger(AdminAddJobLinksController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@Autowired
	AdminRolePermissionController apr;
	
	@Value("${superadmin.roleid}")
	private int superadminid;
	
@RequestMapping("/view-operators")
public ModelAndView viewAddedOperatorPage(Model model, AdminOperatorModel aom, HttpServletRequest req){
	boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
	logger.info("viewAddedOperatorPage");
	if (rolenotnull==false) {
		return new ModelAndView("admin/somethingError");
	}
	String ssroleid = (String)req.getSession().getAttribute("roleid");
	int roleid = Integer.valueOf(ssroleid);
	String permisaccess = apr.adminManagePermissions(roleid, req);
	if(permisaccess == "accessdenied"){
		return new ModelAndView("admin/somethingError");
	}
	List<AdminOperatorModel> listofOperators = adminservices.getAllOperators();
	model.addAttribute("listofOperators", listofOperators);
	
	model.addAttribute("superadminid", superadminid);
	model.addAttribute("smsg", req.getParameter("smsg"));
	model.addAttribute("emsg", req.getParameter("emsg"));
	return new ModelAndView("admin/adminViewOperators","viewoperator", aom);
	
	
}
@RequestMapping("/load-addoperatorpage")
public ModelAndView viewAddOperatorPage(Model model,AdminOperatorModel aom,HttpServletRequest req ){
	boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
	logger.info("viewAddedOperatorPage");
	if (rolenotnull==false) {
		return new ModelAndView("admin/somethingError");
	}
	String ssroleid = (String)req.getSession().getAttribute("roleid");
	int roleid = Integer.valueOf(ssroleid);
	String permisaccess = apr.adminManagePermissions(roleid, req);
	if(permisaccess == "accessdenied"){
		return new ModelAndView("admin/somethingError");
	}
	List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
	model.addAttribute("listallroles", listallroles);
	
	List<AdminOrganizationModel> orgList = adminservices.findAllOrganizations();
	model.addAttribute("orgList", orgList);
	
	model.addAttribute("smsg", req.getParameter("smsg"));
	model.addAttribute("emsg", req.getParameter("emsg"));
	return new ModelAndView("admin/adminAddOperators", "addoperator", aom);
	
	
}
@RequestMapping("/process-operatorinfo")
public ModelAndView submitOperatorInformation(Model model,AdminOperatorModel aom ){
	
	String errormsg = "";
	String susmsg = "";
	aom.setCreatedby("Prakash Varma");
	
	int	succsscnt = adminservices.insertOperatorSubmissionData(aom);

	if (succsscnt > 0) {
		susmsg = "OperaorInformation successfully added.";
		logger.info(susmsg);
	} else {
		errormsg = "There is a problem in add operator. Please try with valid data or contact support team.";
		logger.info(errormsg);
	}
	model.addAttribute("emsg", errormsg);
	model.addAttribute("smsg", susmsg);
	
	return new ModelAndView("redirect:/load-addoperatorpage", "addoperator", aom);
	
	
}

@RequestMapping("/loadEmployeeRegister")
public ModelAndView loadEmployeeRegister(Model model,AdminOperatorModel aom,HttpServletRequest req ){
	logger.info("loadEmployeeRegister");
	
	List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
	model.addAttribute("listallroles", listallroles);
	
	List<AdminOrganizationModel> orgList = adminservices.findAllOrganizations();
	model.addAttribute("orgList", orgList);
	
	model.addAttribute("smsg", req.getParameter("smsg"));
	model.addAttribute("emsg", req.getParameter("emsg"));
	return new ModelAndView("admin/employeeRegister", "addoperator", aom);
	
	
}

@RequestMapping("/process-registeroperatorinfo")
public ModelAndView registeroperatorinfo(Model model,AdminOperatorModel aom ){
	
	String errormsg = "";
	String susmsg = "";
	aom.setCreatedby(aom.getUsername());
	
	int	succsscnt = adminservices.insertOperatorSubmissionData(aom);

	if (succsscnt > 0) {
		susmsg = "Your Registration Done Successfull.";
		logger.info(susmsg);
	} else {
		errormsg = "There is a problem in Registration User Already Exist Or Please try with valid data or contact support team.";
		logger.info(errormsg);
	}
	model.addAttribute("emsg", errormsg);
	model.addAttribute("smsg", susmsg);
	
	return new ModelAndView("redirect:/loadEmployeeRegister", "addoperator", aom);
	
	
}

}

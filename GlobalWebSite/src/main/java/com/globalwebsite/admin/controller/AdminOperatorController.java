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
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminOperatorController {
	
	private final static Logger logger = Logger.getLogger(AdminAddJobLinksController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@Value("${superadmin.roleid}")
	private int superadminid;
	
@RequestMapping("/view-operators")
public ModelAndView viewAddedOperatorPage(Model model){
	
	List<AdminOperatorModel> listofOperators = adminservices.getAllOperators();
	model.addAttribute("listofOperators", listofOperators);
	model.addAttribute("superadminid", superadminid);
	return new ModelAndView("admin/adminViewOperators");
	
	
}
@RequestMapping("/load-addoperatorpage")
public ModelAndView viewAddOperatorPage(Model model,AdminOperatorModel aom,HttpServletRequest req ){
	
	List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
	model.addAttribute("listallroles", listallroles);
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

}

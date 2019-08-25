package com.globalwebsite.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminOperatorModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminViewOperatorByIdController {
	
	private final static Logger logger = Logger.getLogger(AdminViewOperatorByIdController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@RequestMapping("/load-viewoperatorsbyid")
	public ModelAndView adminViewOperatorsById(Model model, AdminOperatorModel aom, HttpServletRequest req)  {
		logger.info("You are in adminViewOperatorsById:: "+aom.getRowid());
		List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
		model.addAttribute("listallroles", listallroles);
		int rowId = aom.getRowid();
		List<AdminOperatorModel> listofOperators = adminservices.getOperatorById(rowId);
		for (AdminOperatorModel lop : listofOperators) {
			aom.setUsername(lop.getUsername());
			aom.setPassword(lop.getPassword());
			aom.setFullname(lop.getFullname());
			aom.setQualification(lop.getQualification());
			aom.setEmpdob(lop.getEmpdob());
			aom.setEmail(lop.getEmail());
			aom.setPhonenumber(lop.getPhonenumber());
			aom.setJobdescription(lop.getJobdescription());
			aom.setAddress(lop.getAddress());
			aom.setReferrarname(lop.getReferrarname());
			aom.setCompanyname(lop.getCompanyname());
			aom.setCompanyurl(lop.getCompanyurl());
			aom.setHrname(lop.getHrname());
			aom.setHremail(lop.getHremail());
			aom.setHrphonenumber(lop.getHrphonenumber());
			aom.setRoleid(lop.getRoleid());
			aom.setCreatedby(lop.getCreatedby());
			aom.setRolename(lop.getRolename());
			aom.setStatus(lop.isStatus());
			aom.setRowid(lop.getRowid());
			
		}
		model.addAttribute("listofOperators", listofOperators);
		model.addAttribute("disabled", "disabled='disabled'");
		model.addAttribute("viewoperator", "none");
		
		return new ModelAndView("admin/adminEditAndUpdateOperators", "updateoperator", aom);

	}
	@RequestMapping("/load-editoperatorsbyid")
	public ModelAndView adminViewEditOperatorsById(Model model, AdminOperatorModel aom, HttpServletRequest req)  {
		logger.info("You are in adminViewEditOperatorsById:: "+aom.getRowid());
		List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
		model.addAttribute("listallroles", listallroles);
		int rowId = aom.getRowid();
		List<AdminOperatorModel> listofOperators = adminservices.getOperatorById(rowId);
		for (AdminOperatorModel lop : listofOperators) {
			aom.setUsername(lop.getUsername());
			aom.setPassword(lop.getPassword());
			aom.setFullname(lop.getFullname());
			aom.setQualification(lop.getQualification());
			aom.setEmpdob(lop.getEmpdob());
			aom.setEmail(lop.getEmail());
			aom.setPhonenumber(lop.getPhonenumber());
			aom.setJobdescription(lop.getJobdescription());
			aom.setAddress(lop.getAddress());
			aom.setReferrarname(lop.getReferrarname());
			aom.setCompanyname(lop.getCompanyname());
			aom.setCompanyurl(lop.getCompanyurl());
			aom.setHrname(lop.getHrname());
			aom.setHremail(lop.getHremail());
			aom.setHrphonenumber(lop.getHrphonenumber());
			aom.setRoleid(lop.getRoleid());
			aom.setCreatedby(lop.getCreatedby());
			aom.setRolename(lop.getRolename());
			aom.setStatus(lop.isStatus());
			aom.setRowid(lop.getRowid());
		}
		model.addAttribute("listofOperators", listofOperators);
		model.addAttribute("disabled", "");
		model.addAttribute("viewoperator", "block");
		
		return new ModelAndView("admin/adminEditAndUpdateOperators", "updateoperator", aom);
		
	}

}

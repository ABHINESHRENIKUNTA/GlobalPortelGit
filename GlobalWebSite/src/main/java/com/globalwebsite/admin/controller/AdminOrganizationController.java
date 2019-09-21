package com.globalwebsite.admin.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminOrganizationModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminOrganizationController {

	private final static Logger logger = Logger.getLogger(AdminOrganizationController.class);
	
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@Autowired
	AdminRolePermissionController apr;
	
	private int activestatus=1;
	
	@RequestMapping(value="/adminvieworg", method=RequestMethod.GET)
	public ModelAndView viewOrganizationScreen(Model model, AdminOrganizationModel ao,HttpServletRequest req){
		boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
		if(!rolenotnull){
			return new ModelAndView("admin/somethingError");
		}
		String ssroleid = (String)req.getSession().getAttribute("roleid");
		int roleid = Integer.valueOf(ssroleid);
		String permisaccess = apr.adminManagePermissions(roleid, req);
		if(permisaccess == "accessdenied"){
			return new ModelAndView("admin/somethingError");
		}
		List<AdminOrganizationModel> orgList = adminservices.findAllOrganizations();
		model.addAttribute("orgList", orgList);
		model.addAttribute("emsg", req.getParameter("emsg"));
		model.addAttribute("smsg", req.getParameter("smsg"));
		return new ModelAndView("admin/adminViewOrganization", "orginfo", ao);
		
	}
	@RequestMapping("/admineditaddorg")
	public ModelAndView viewAddOrganizationScreen(Model model, AdminOrganizationModel ao,HttpServletRequest req){
		String typeofPage= req.getParameter("typeofPage");
		String actiontype = StringUtils.equals(typeofPage, "add") ? "adminsubmitorg" : 
			StringUtils.equals(typeofPage, "edit") ? "adminupdateorg" : 
				StringUtils.equals(typeofPage, "view") ? "adminupdateorg" : "admin/somethingError";
		String ssroleid = (String)req.getSession().getAttribute("roleid");
		int roleid = Integer.valueOf(ssroleid);
		String permisaccess = apr.adminManagePermissions(roleid, req);
		if(permisaccess == "accessdenied"){
			return new ModelAndView("admin/somethingError");
		}
		int orgid=ao.getOrgid();
		if((StringUtils.equals(typeofPage, "view")) || (StringUtils.equals(typeofPage, "edit"))){
		List<AdminOrganizationModel> orgList = adminservices.findOrganizationById(orgid);
		for (AdminOrganizationModel orgl : orgList) {
			ao.setOrgname(orgl.getOrgname());
			ao.setIsactive(orgl.isIsactive());
			ao.setOrgid(orgl.getOrgid());
		}
		model.addAttribute("orgList", orgList);
		}
		model.addAttribute("actiontype", actiontype);
		model.addAttribute("typeofPage", typeofPage);
		return new ModelAndView("admin/adminOrganization", "orginfo", ao);
		
	}
	@RequestMapping(value="/adminsubmitorg")
	public ModelAndView submitOrganizationForm(Model model, AdminOrganizationModel ao){
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		
		succsscnt = adminservices.insertOrganizationData(ao);
		
		if (succsscnt > 0) {
			susmsg = "Organization successfully added.";
			logger.info(susmsg);
		} else {
			errormsg = "Given data is not added. Please try with valid data or contact support team.";
			logger.info(errormsg);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		return new ModelAndView("redirect:/adminvieworg", "orginfo", ao);
		
	}
	@RequestMapping(value="/adminupdateorg", method=RequestMethod.POST)
	public ModelAndView updateOrganizationForm(Model model, AdminOrganizationModel ao){
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		int orgid = ao.getOrgid();
		succsscnt = adminservices.updateOrganizationData(ao, orgid);
		
		if (succsscnt > 0) {
			susmsg = "Organization successfully updated.";
			logger.info(susmsg);
		} else {
			errormsg = "Given data is not updated. Please try with valid data or contact support team.";
			logger.info(errormsg);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		return new ModelAndView("redirect:/adminvieworg", "orginfo", ao);
		
	}
	
}

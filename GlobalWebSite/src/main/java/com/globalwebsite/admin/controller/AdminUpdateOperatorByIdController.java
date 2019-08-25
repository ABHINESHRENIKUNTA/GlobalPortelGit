package com.globalwebsite.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalwebsite.admin.model.AdminOperatorModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminUpdateOperatorByIdController {
	
	private final static Logger logger = Logger.getLogger(AdminUpdateOperatorByIdController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@RequestMapping(value="/update-operatorinfo", method=RequestMethod.POST)
	public String adminUpdateOperatorsById(Model model, AdminOperatorModel aom, HttpServletRequest req, HttpSession sess)  {
		logger.info("You are in adminUpdateOperatorsById:: "+aom.getRowid());
		String errormsg = "";
		String susmsg = "";
		int succsscnt = 0;
		if ((String)sess.getAttribute("username")!=null) {
			aom.setCreatedby((String)sess.getAttribute("username"));
		}else{
			return "admin/somethingError";
			
		}
		succsscnt = adminservices.updateOperatorById(aom);
		if (succsscnt > 0) {
			susmsg = aom.getUsername() + " data successfully updated.";
			logger.info(susmsg);
		} else {
			errormsg = aom.getUsername() + " data not updated. Please try with valid data or contact support team.";
			logger.info(errormsg);
		}
		model.addAttribute("emsg", errormsg);
		model.addAttribute("smsg", susmsg);
		
		return "redirect:/view-operators";

	}

}

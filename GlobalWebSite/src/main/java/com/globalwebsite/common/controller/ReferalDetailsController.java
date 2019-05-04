package com.globalwebsite.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

@Controller
public class ReferalDetailsController {
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	@RequestMapping("/ReferalLogin")
	public String employeeLogin(Model model,ReferalLoginModel ref,HttpServletRequest req){
		
		model.addAttribute("login", ref);
		model.addAttribute("regemsg", req.getParameter("regemsg"));
		model.addAttribute("regsmsg", req.getParameter("regsmsg"));
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		return "user/referalLogin";
	}
	
	@RequestMapping("/ValidateReferal")
	public String ValidateEmployee(Model model,ReferalLoginModel refl,HttpServletRequest req){
		 String emsg="",smsg="";
		int validuser=userserviceimpl.validateReferalDetails(refl);
		if(validuser>0){
			return "redirect:/ValidReferal";
		}
		else{
			emsg="Invalid User";
		}
		model.addAttribute("smsg",smsg);
		model.addAttribute("emsg",emsg);
		
		return "redirect:/ReferalLogin";
	}
	@RequestMapping("/registerReferal")
	public String registerEmployee(Model model,ReferalLoginModel refl)
	{
		String regsmsg="";
		String regemsg="";
		int alreadyexst=userserviceimpl.getCountForAlreadyExistReferal(refl);
		if(alreadyexst==0){
			int insertdata=userserviceimpl.insertReferalRegistrationDetails(refl);
			if(insertdata>0){
				regsmsg="You Have Registered Successfully.";
			}
			else{
			regemsg="There is an error while adding data.";
			}
		}
		else{
			regemsg="User Already Exist For Given Email Id.";
		}
		model.addAttribute("regemsg", regemsg);
		model.addAttribute("regsmsg", regsmsg);
		return "redirect:/ReferalLogin";
	}
	
}

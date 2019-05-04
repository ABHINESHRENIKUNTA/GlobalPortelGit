package com.globalwebsite.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;
@Controller
public class EmplyeeDetailsController {
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	
	@RequestMapping("/EmployeLogin")
	public String employeeLogin(Model model,EmployeeLoginModel empl,HttpServletRequest req){
		
		model.addAttribute("login", empl);
		model.addAttribute("regemsg", req.getParameter("regemsg"));
		model.addAttribute("regsmsg", req.getParameter("regsmsg"));
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		return "user/employeeLogin";
	}
	
	
	@RequestMapping("/ValidateEmployee")
	public String ValidateEmployee(Model model,EmployeeLoginModel empl,HttpServletRequest req){
		 String emsg="",smsg="";
		int validuser=userserviceimpl.validateEmployeeDetails(empl);
		if(validuser>0){
			return "redirect:/ValidEmployee";
		}
		else{
			emsg="Invalid User";
		}
		model.addAttribute("smsg",smsg);
		model.addAttribute("emsg",emsg);
		
		return "redirect:/EmployeLogin";
	}
	
	@RequestMapping("/registerEmployee")
	public String registerEmployee(Model model,EmployeeLoginModel stud)
	{
		String regsmsg="";
		String regemsg="";
		int alreadyexst=userserviceimpl.getCountForAlreadyExistEmployee(stud);
		if(alreadyexst==0){
			int insertdata=userserviceimpl.insertEmployeeRegistrationDetails(stud);
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
		return "redirect:/EmployeLogin";
	}
}

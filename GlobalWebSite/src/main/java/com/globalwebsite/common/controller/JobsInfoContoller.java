package com.globalwebsite.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

@Controller
public class JobsInfoContoller {
	
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	@RequestMapping("/displayDifferentUsers")
	public String displayDifferentUsers(Model model){
		
		
		return "user/displayDiffUsers";
	}
	
	@RequestMapping("/studentLogin")
	public String studentLogin(Model model,StudentLoginModel stud){
		
		model.addAttribute("login", stud);
		
		
		
		return "user/studentLogin";
	}
	
	
	
	

}

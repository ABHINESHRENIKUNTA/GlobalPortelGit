package com.globalwebsite.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class UserHomeController {
	
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	 @RequestMapping("/GlobalSiteWelcomePage")
	 public String globalSiteWelcomePage(Model model){
		 List<AdminAddUserImagesModel> admdata= adminservices.getAdminDeleteUserImages();
			model.addAttribute("admdata", admdata);
		 
		 return "user/welcomePage";
	 }

}

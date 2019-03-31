package com.globalwebsite.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserHomeController {
	
	 @RequestMapping("/GlobalSiteWelcomePage")
	 public String globalSiteWelcomePage(){
		 
		 
		 return "user/welcomePage";
	 }

}

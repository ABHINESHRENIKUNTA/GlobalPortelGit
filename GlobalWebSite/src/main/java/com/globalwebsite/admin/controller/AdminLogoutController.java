package com.globalwebsite.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLogoutController {

	@RequestMapping("/adminlogout")
	public String adminLogout(HttpSession session){
		session.invalidate();
		return "redirect:/view-adminLogin";
	}
}

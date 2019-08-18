package com.globalwebsite.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.model.AdminOperatorModel;

@Controller
public class AdminViewOperatorByIdController {
	
	@RequestMapping("/load-viewoperatorsbyid")
	public String adminViewOperatorsById(Model model, AdminOperatorModel aom, HttpServletRequest req)  {
		
		
		return "";

	}

}

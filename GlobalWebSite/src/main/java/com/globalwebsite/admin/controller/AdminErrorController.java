package com.globalwebsite.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminErrorController {

	@RequestMapping("/load-errorss")
	public ModelAndView someThingWrong(){
		
		return new ModelAndView("admin/somethingError");
	}
}

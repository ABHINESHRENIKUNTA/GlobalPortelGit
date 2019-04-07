package com.globalwebsite.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScrollLinksController {
	
	@RequestMapping(value="/addScrollLink",method=RequestMethod.GET)
	private String addScrollLink() {
		
		return "admin/addScrolllink";
		
	}
	@RequestMapping(value="/editScrollLink",method=RequestMethod.GET)
	private String editScrollLink() {
		System.out.println("hai");
		return "admin/editScrollLink";
		
	}
	@RequestMapping(value="/deleteScrollLink",method=RequestMethod.GET)
	private String deleteScrollLink() {
		
		return "admin/deleteScrollLink";
		
	}

}

package com.globalwebsite.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalwebsite.admin.model.AddScrollLink;

@Controller
public class ScrollLinksController {
	@Autowired
	private AddScrollLink addScrollLinkObj;
	
	
	@RequestMapping(value="/addScrollLink",method=RequestMethod.GET)
	private String addScrollLink(Model model) {
		model.addAttribute("addLink", new AddScrollLink());
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
	@RequestMapping(value="/addLink",method=RequestMethod.POST)
	private String addLink(@ModelAttribute("addLink") AddScrollLink addlink) {
		System.out.println(addlink);
		
		return "admin/deleteScrollLink";
		
	}

}

package com.globalwebsite.admin.controller;



import javax.validation.Valid;

import org.junit.validator.ValidateWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalwebsite.admin.dao.AdminDaoInterface;
import com.globalwebsite.admin.dao.AdminDaoInterfaceImpl;
import com.globalwebsite.admin.model.AddScrollLink;

@Controller
public class ScrollLinksController {
	/*@Autowired
	private AddScrollLink addScrollLinkObj;*/
	
	@Autowired(required=true)
	private AdminDaoInterface daoimpl;
	
	public void setDaoimpl(AdminDaoInterface daoimpl) {
		this.daoimpl = daoimpl;
	}
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
	private String addLink(@ModelAttribute("addLink") @Valid AddScrollLink addlink,BindingResult result,Model model) {
		System.out.println(addlink);
		System.out.println(result);

		if(result.hasErrors()) {
//			model.addAttribute("addlink", addlink);
			return "admin/addScrolllink";
		}
		int returnvalue=daoimpl.createNewScrolllink(addlink);
		if(returnvalue>0) {
		model.addAttribute("smsg", "Link Created Successfully");
		model.addAttribute("emsg", "");
		}
		else {
			model.addAttribute("smsg", "");
			model.addAttribute("emsg", "Failed");
		}
		return "admin/addScrolllink";
		
	}

}

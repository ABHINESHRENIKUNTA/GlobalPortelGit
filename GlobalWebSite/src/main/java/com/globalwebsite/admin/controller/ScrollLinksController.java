package com.globalwebsite.admin.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;

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
	private String addScrollLink(Model model,HttpServletRequest req) {
		model.addAttribute("addLink", new AddScrollLink());
		if(req.getParameter("smsg")!="" || req.getParameter("emsg")!="") {
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		}
		return "admin/addScrolllink";
		
	}
	@RequestMapping("/editScrollLink")
	private String editScrollLink(Model model,HttpServletRequest req) {
		
		List<AddScrollLink> linkNames=daoimpl.getAllScrollLinkNames();
		
		model.addAttribute("edit", new EditScrollLink());
		model.addAttribute("linknames", linkNames);
		
		
		return "admin/editScrollLink";
		
	}
	@RequestMapping(value="/deleteScrollLink",method=RequestMethod.GET)
	private String deleteScrollLink(HttpServletRequest req,Model model) {
	List<AddScrollLink> linkNames=daoimpl.getAllScrollLinkNames();
		System.out.println("links------------->"+linkNames);

		model.addAttribute("deleteLink", new DeleteScrollLink());
		model.addAttribute("linknames", linkNames);
		if(req.getParameter("smsg")!="" || req.getParameter("emsg")!="") {
			model.addAttribute("smsg", req.getParameter("smsg"));
			model.addAttribute("emsg", req.getParameter("emsg"));
			}
		return "admin/deleteScrollLink";
		
	}
	@RequestMapping(value="/addLink",method=RequestMethod.POST)
	private String addLink(@ModelAttribute("addLink") @Valid AddScrollLink addlink,BindingResult result,Model model) {
		System.out.println(addlink);
		System.out.println(result);

		if(result.hasErrors()) {
//			model.addAttribute("addlink", addlink);
			return "redirect:/addScrolllink";
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
		return "redirect:/addScrollLink";
		
	}
	@RequestMapping(value="/editLink",method=RequestMethod.POST)
	private String editLink(@ModelAttribute("edit") EditScrollLink editLink,Model model,HttpServletRequest req ) {
		System.out.println("editlink operation");
		String linktobeupdated=req.getParameter("link");
		editLink.setLinktobemodified(linktobeupdated);
		int returnvalue=daoimpl.updateScrollLink(editLink);
		if(returnvalue>0) {
		model.addAttribute("smsg", "Updated Link Successfully");
		model.addAttribute("emsg", "");
		}
		else {
			model.addAttribute("smsg", "");
			model.addAttribute("emsg", "Failed");
		}
		return "redirect:/refreshScrollLink";
		
	}
	@RequestMapping(value="refreshScrollLink")
	private String refreshScrollLink(HttpServletRequest req,Model model) {
List<AddScrollLink> linkNames=daoimpl.getAllScrollLinkNames();
		
		model.addAttribute("edit", new EditScrollLink());
		model.addAttribute("linknames", linkNames);
		if(req.getParameter("smsg")!="" || req.getParameter("emsg")!="") {
			model.addAttribute("smsg", req.getParameter("smsg"));
			model.addAttribute("emsg", req.getParameter("emsg"));
			}
		return "admin/editScrollLink";
	}
	
	@RequestMapping(value="deleteLink",method=RequestMethod.POST)
	public String deleteLink(HttpServletRequest req,Model model) {
		String linktobedeleted=req.getParameter("link");
		DeleteScrollLink ds=new DeleteScrollLink();
		ds.setLinktobedeleted(linktobedeleted);
		
		int result=daoimpl.deleteScrollLink(ds);
		if(result>0) {
			model.addAttribute("smsg", "removed Link Successfully");
			model.addAttribute("emsg", "");
			}
			else {
				model.addAttribute("smsg", "");
				model.addAttribute("emsg", "Failed");
			}
		return "redirect:/deleteScrollLink";
	}
	

}


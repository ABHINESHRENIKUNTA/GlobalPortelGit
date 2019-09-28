package com.globalwebsite.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LoginController {

private final static Logger logger = Logger.getLogger(LoginController.class);
    
/*	@Autowired
	private AdminServiceInterfaceImpl admindaoimpl;*/
	
	@RequestMapping("/view-userlogin")
	public ModelAndView userLoginScreen(Model model, HttpServletRequest req){
		System.out.println("login");
		boolean useremail =	req.getSession().getAttribute("useremil") != null;
		if(!useremail){
			logger.info("User not logged in.. And displaying login screen.");
			return new ModelAndView("user/userLoginModal","listjobdetails",model);
		}
		return null;
	}
	
	@RequestMapping("/view-userregistration")
	public ModelAndView userQuickRegisterScreen(Model model){
		
		return null;
		
	}
	
}

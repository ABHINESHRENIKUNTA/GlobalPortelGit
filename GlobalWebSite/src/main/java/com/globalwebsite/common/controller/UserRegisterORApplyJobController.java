package com.globalwebsite.common.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

@Controller
public class UserRegisterORApplyJobController {

	private final static Logger logger = Logger.getLogger(UserRegisterORApplyJobController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	private final int activenum =1;

	
	public String registerOrApplyJob(Model model, HttpSession session){
		boolean isRegistered = (String)session.getAttribute("useremailid")!=null ? true: false;
		


		
		return null;
	}
}

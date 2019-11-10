package com.globalwebsite.common.controller;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.model.StudentLoginModel;
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
		
		if(!isRegistered){
			
		}

		
		return null;
	}
	
	@RequestMapping(value="/viewuserloginpage", method=RequestMethod.GET)
	public String viewUserLoginScreen(Model model, HttpSession session, StudentLoginModel slm){
		model.addAttribute("viewuserlogin", slm);
		return "user/userLogin";
	}
	
	@RequestMapping(value="/submituserLoginDetails", method=RequestMethod.POST)
	public String userLogin(Model model, HttpSession session, StudentLoginModel slm){
		model.addAttribute("viewuserlogin", slm);
		boolean isLogin = (String)session.getAttribute("useremailid")!=null ? true: false;
		String username = slm.getUsername();
		String pwd = slm.getPassword();
		logger.info("Entered Usermame is: "+username +" Entered Password is: "+pwd);
		if(null==username || null==pwd || username.length()<=0 || pwd.length()<=0){
			model.addAttribute("emsg", "Please enter valid credentials.");
			return "user/userLogin";
		}
		List<StudentLoginModel> stdList = userserviceimpl.findUserIsAvailable(username, pwd);
		if(null==stdList || stdList.isEmpty()){
			model.addAttribute("emsg", "Please enter valid credentials.");
			return "user/userLogin";
		}
		for (StudentLoginModel stList : stdList) {
			session.setAttribute("useremailid", stList.getEmailid());
			session.setAttribute("userloginid", stList.getUserloginid());
			session.setAttribute("userstuname", stList.getName());
		}
		
		return "redirect:/load-jobcategories";
	}
	
	@RequestMapping("/studentlogout")
	public String userLogout(HttpSession session, Model model){
		session.invalidate();
		model.addAttribute("smsg", "Your successfully logged out.");
		return "redirect:/viewuserloginpage";
	}
}

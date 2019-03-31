package com.globalwebsite.admin.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminDashboardController {

	private final static Logger logger = Logger.getLogger(AdminDashboardController.class);
	public int data=0;
	int gid=0;
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	 @Autowired
	 private JavaMailSender mailSenderObj;
	
	@RequestMapping("/view-admindashboard")
	public String viewAdminDashboardWindow(Model model) {
		
		logger.info("Entry of Admin Dashboard method....");
		
		logger.info("End  of Admin Dashboard method....");
		return "admin/adminDashboard";
	}
	
	@RequestMapping("/view-adminLogin")
	public String viewAdminLogin(Model model,AdminLoginModel adm,HttpServletRequest req) {
		logger.info("Entry of Admin Login method....");
		model.addAttribute("login", adm);
		model.addAttribute("emsg", req.getParameter("emsg"));
		logger.info("End  of Admin Login method....");
		return "admin/adminLogin";
	}
	

	
	@RequestMapping("/ValidateAdmin")
	public String validateLogin(Model model, AdminLoginModel lmodel, HttpSession ses, HttpServletRequest req){
		logger.info("Start processLoginForm method....");
		model.addAttribute("loginform", lmodel);
		String emsg = null;
		String redirecturl="";
		
		List<AdminLoginModel> ldetails = adminservices.getAdminLoginDetails(lmodel);
		if(ldetails.size()>0){
		for (AdminLoginModel lm : ldetails) {
				ses.setAttribute("username", lm.getUsername());
				ses.setAttribute("password", lm.getPassword());
				gid=lm.getGlobalid();
		}
		String OTP=String.valueOf(generatePin()) ; 
		mailSenderObj.send(new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
            	
                MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");             
                mimeMsgHelperObj.setTo(lmodel.getUsername());
                mimeMsgHelperObj.setFrom("globalwebsite001@gmail.com");               
                mimeMsgHelperObj.setText(OTP);
                mimeMsgHelperObj.setSubject("Verification OTP");
             
                }
        });
		  adminservices.updateOTP(OTP,gid);
		  model.addAttribute("username", lmodel.getUsername());
		redirecturl = "redirect:/ValidatedAdmin";	
		}
		else{
		redirecturl = "redirect:/view-adminLogin";
		}
		emsg = "Please enter valid Username/Password";
		
		model.addAttribute("emsg", emsg);
		return redirecturl;
	}
	
	@RequestMapping("/ValidatedAdmin")
	public String validatedAdmin(Model model, AdminLoginModel lmodel, HttpSession ses, HttpServletRequest req) {
		
		model.addAttribute("lmodel", lmodel);
		model.addAttribute("username",req.getParameter("username"));
		model.addAttribute("ermsg",req.getParameter("ermsg"));
		return "admin/validateOTP";
	}
	
	@RequestMapping("/ValidateAdminOTP")
	public String validateAdminOTP(Model model, AdminLoginModel lmodel, HttpSession ses, HttpServletRequest req) {
		model.addAttribute("lmodel", lmodel);
		String username=req.getParameter("usernameval");
		lmodel.setUsername(username);
		int validotp=adminservices.getValidateAdminOTP(lmodel);
		if(validotp>0){
			return "redirect:/view-admindashboard";
		}
		else
		{
			model.addAttribute("ermsg", "Invalid OTP");
			return "redirect:/ValidatedAdmin";
		}
		
	}
	
	
	
	public static int generatePin(){
		Random generator = new Random();	
		return 100000 + generator.nextInt(900000);
		}
}

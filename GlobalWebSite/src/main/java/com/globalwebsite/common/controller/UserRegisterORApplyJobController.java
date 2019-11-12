package com.globalwebsite.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

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
	
	@ResponseBody
	@RequestMapping(value="/login-applyjob", method= RequestMethod.POST)
	public String loginAndApplyJob(Model model, HttpSession session, HttpServletRequest req) {
		
		String username= req.getParameter("email");
		String password= req.getParameter("password");
		String tablekey= req.getParameter("tablekey");
		String rowid= req.getParameter("rowid");

		logger.info("Login and Apply: "+ username+ "pwd: "+password +" tablekey: "+tablekey +" rowId: "+rowid);
		StudentLoginModel sl = new StudentLoginModel();
		GsonBuilder gsonBuilder = new GsonBuilder();
			List<StudentLoginModel> stdList = userserviceimpl.findUserIsAvailable(username, password);
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(stdList);
			if (CollectionUtils.isEmpty(stdList)) {
				sl.setErrorcode("100");
				sl.setErrormsg("Invalid credentials.");
				
				return gson.toJson(sl);
			} 
			logger.info("\nConverted JSONObject ==> " + JSONObject);
			
		return JSONObject;
	}
	
	@RequestMapping(value="/viewuserloginpage", method=RequestMethod.GET, headers = { "application/json"} )
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

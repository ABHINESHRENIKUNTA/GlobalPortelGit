package com.globalwebsite.common.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;
import com.gw.student.model.AdminSubmissionModel;

@Controller
public class UserFilterJobDetailsController {

	private final static Logger logger = Logger.getLogger(UserFilterJobDetailsController.class);

	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	private final int activenum =1;
	
	@RequestMapping("load-submitfilterjobresults")
	public String filterJobDetails(Model model,AdminSubmissionModel stdmodel, HttpServletRequest request){
		String[] jobtypelist = request.getParameterValues("jobtype");
		String[] industryidlist = request.getParameterValues("industryid");
		String tablekey = request.getParameter("tablekey");
		if(jobtypelist!=null && industryidlist!=null){
			 List<String> jobtypelist1 = Arrays.asList(jobtypelist);
			String whereqry="where jobtype="+jobtypelist1+" and industryid="+convertArrayToListInt(industryidlist)+"";
			logger.info("filterJobDetails:: "+whereqry);
		}
		//MapSqlParameterSource parameters = new MapSqlParameterSource();
		//parameters.addValue("jobtypelist", jobtypelist);
		return null;
		
	}
	 public static <T> List<T> convertArrayToListString(T array[]) 
	    { 
	  
	        // Create an empty List 
	        List<T> list = new ArrayList<>(); 
	  
	        // Iterate through the array 
	        for (T t : array) { 
	            // Add each element into the list 
	            list.add(t); 
	        } 
	  
	        // Return the converted List 
	        return list; 
	    } 
	 public static <Int> List<Int> convertArrayToListInt(Int array[]) 
	 { 
		 
		 // Create an empty List 
		 List<Int> list = new ArrayList<>(); 
		 
		 // Iterate through the array 
		 for (Int t : array) { 
			 // Add each element into the list 
			 list.add(t); 
		 } 
		 
		 // Return the converted List 
		 return list; 
	 } 
}

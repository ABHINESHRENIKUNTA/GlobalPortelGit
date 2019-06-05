package com.globalwebsite.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gw.student.model.StudentDashboardModel;

@Controller
public class AdminStudentHomeInfoController {

	@RequestMapping("/load-adminaddstuinfo")
	public String adminStudentAddInfoPage(Model model, StudentDashboardModel stdmodel){
		
		model.addAttribute("adminaddstuinfo", stdmodel);
		
		return "studentadmin/adminAddStudentHomeInfo";
		
	}
	@RequestMapping("/load-adminupdatestuinfo")
	public String adminStudentEditInfoPage(Model model, StudentDashboardModel stdmodel){
		
		model.addAttribute("adminupdatestuinfo", stdmodel);
		
		return "studentadmin/adminUpdateStudentHomeInfo";
		
	}
	@RequestMapping("/load-admindeletestuinfo")
	public String adminStudentdeleteInfoPage(Model model, StudentDashboardModel stdmodel){
		
		model.addAttribute("admindeletestuinfo", stdmodel);
		
		return "studentadmin/adminDeleteStudentHomeInfoss";
		
	}
}

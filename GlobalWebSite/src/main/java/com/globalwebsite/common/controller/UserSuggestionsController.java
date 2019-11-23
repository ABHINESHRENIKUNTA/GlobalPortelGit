package com.globalwebsite.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.common.model.UserSuggestionsModel;
import com.globalwebsite.common.services.UserServiceInterfaceImpl;

/**
 * @author PRANEEL VARMA
 *
 */
@Controller
public class UserSuggestionsController {

	private final static Logger logger = Logger.getLogger(UserSuggestionsController.class);
	
	@Autowired
	private UserServiceInterfaceImpl userserviceimpl;
	
	
	/**
	 * @param model
	 * @param usm
	 * @return
	 */
	@RequestMapping(value="/view-usersuggestions", method=RequestMethod.GET)
	public ModelAndView viewSuggestionScreen(Model model, UserSuggestionsModel usm, HttpServletRequest req){
		logger.info("viewSuggestionScreen starts");
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		return new ModelAndView("user/userSuggestions", "usersuggestion", usm);
		
	}
	/**
	 * @param model
	 * @param usm
	 * @return
	 */
	@RequestMapping(value="/view-aboutuspage", method=RequestMethod.GET)
	public ModelAndView viewAboutUsPage(Model model){
		logger.info("ViewAboutUsPage starts");
		return new ModelAndView("user/userAboutUs");
		
	}
	@RequestMapping(value="/comingSoonPage", method=RequestMethod.GET)
	public ModelAndView comingSoonPage(Model model){
		logger.info("comingSoonPage starts");
		return new ModelAndView("user/comingSoonPage");
		
	}

	@RequestMapping(value="/submit-usersuggestions", method=RequestMethod.GET)
	public ModelAndView submitSuggestions(Model model, UserSuggestionsModel usm){
		logger.info("submitSuggestions starts");
		
		int submitData = userserviceimpl.insertUserSuggestions(usm);
		if(submitData>0){
			model.addAttribute("smsg", "Thank you!. Successfully submitted your suggestion.");
		}else{
			model.addAttribute("emsg", "Sorry, your suggestion is not submitted! Please try again.");
		}
		return new ModelAndView("redirect:/view-usersuggestions", "usersuggestion", usm);
		
	}
}

package com.globalwebsite.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.globalwebsite.admin.controller.AdminRolePermissionController;
import com.globalwebsite.admin.model.AdminRolePermissionModel;

public class GlobalInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = Logger.getLogger(HandlerInterceptorAdapter.class);
	
	@Autowired
	AdminRolePermissionController apr;

	// before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		long startTime = System.currentTimeMillis();
		request.setAttribute("startTime", startTime);
		System.out.println("preHandle - > startTime::: "+startTime);

		return true;
	}

	// after the handler is executed
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		long startTime = (Long) request.getAttribute("startTime");

		long endTime = System.currentTimeMillis();

		long executeTime = endTime - startTime;

		// modified the existing modelAndView
		modelAndView.addObject("executeTime", executeTime);
		System.out.println("postHandle - > executeTime::: "+executeTime);
		logger.info("postHandle - > executeTime::: "+executeTime);
		
		String apndQryStr = getQueryStringFromURL(request);
		String permissionurl = request.getServletPath();
		
		int roleid=1;
		
		boolean rolenotnull = request.getSession().getAttribute("roleid") != null;
		List<AdminRolePermissionModel> leftMenuList = null;
		if(roleid==1){
			leftMenuList = apr.getAllPermissionsForSuperuser();
		}else{
			leftMenuList = apr.getAllPermissionsBasedonRoleId(roleid);
		}
		modelAndView.addObject("leftMenuList", leftMenuList);
		
		permissionurl=permissionurl.replaceFirst("/", "");
		permissionurl = permissionurl+""+apndQryStr;
		System.out.println("permissionurl:::::::: "+permissionurl);
		String permisaccess = apr.adminManagePermissions(roleid, permissionurl);
		System.out.println("***********************: "+permisaccess);
		
		
		// log it
		if (logger.isDebugEnabled()) {
			logger.debug("[" + handler + "] executeTime : " + executeTime + "ms");
		}
	}

	//Get Query String from URL
	public String getQueryStringFromURL(HttpServletRequest request) {
		String getqryString = request.getQueryString();
		String apndQryStr = "";
		try {
			if(getqryString.contains("selectedparam=")){
				apndQryStr = "?selectedparam="+request.getParameter("selectedparam");
			}
		} catch (Exception e) {
			logger.info("Query String is not found in the URL::"+request.getServletPath());
			System.out.println("Query String is not found in the URL::"+request.getServletPath());
			apndQryStr="";
		}
		return apndQryStr;
	}

}

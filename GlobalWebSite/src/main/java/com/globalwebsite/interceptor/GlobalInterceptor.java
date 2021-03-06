package com.globalwebsite.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.globalwebsite.admin.controller.AdminRolePermissionController;
import com.globalwebsite.admin.model.AdminRolePermissionModel;

public class GlobalInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = Logger.getLogger(HandlerInterceptorAdapter.class);
	
	@Autowired
	AdminRolePermissionController apr;
	
	@Value("${superadmin.roleid}")
	private int superadminid;

	// before the actual handler will be executed
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		long startTime = System.currentTimeMillis();
		request.setAttribute("startTime", startTime);
		logger.info("preHandle - > startTime::: "+startTime);

		return true;
	}

	// after the handler is executed
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		long startTime = (Long) request.getAttribute("startTime");
		

		long endTime = System.currentTimeMillis();

		long executeTime = endTime - startTime;

		try {
			// modified the existing modelAndView
			modelAndView.addObject("executeTime", executeTime);
			logger.info("postHandle - > executeTime::: "+executeTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
		
		String apndQryStr = apr.getQueryStringFromURL(request);
		String permissionurl = request.getServletPath();
		
		int roleid=0;
		boolean rolenotnull = request.getSession().getAttribute("roleid") != null;
		if(rolenotnull==true){
			String ssroleid = (String) request.getSession().getAttribute("roleid");
			roleid = Integer.valueOf(ssroleid);
		}
		if(roleid!=0){
		if(null==request.getSession().getAttribute("leftMenuListjsp")){
			List<AdminRolePermissionModel> leftMenuList;
			if(roleid==superadminid){
				leftMenuList = apr.getAllPermissionsForSuperuser();
			}else{
				leftMenuList = apr.getAllPermissionsBasedonRoleId(roleid);
			}
			request.getSession().setAttribute("leftMenuList", leftMenuList);
		}
	}
		permissionurl=permissionurl.replaceFirst("/", "");
		permissionurl = permissionurl+""+apndQryStr;
		String clientipaddr = getClientIpAddress(request);
		logger.info("Client IP ADDRESS:: "+clientipaddr);
		  String ipAddress = request.getHeader("X-FORWARDED-FOR");  
	       if (ipAddress == null) {  
	         ipAddress = request.getRemoteAddr();  
	         logger.info("***Client IP ADDRESS:: "+ipAddress);
	   }
		// log it
		if (logger.isDebugEnabled()) {
			logger.debug("[" + handler + "] executeTime : " + executeTime + "ms");
		}
	}

	private static final String[] IP_HEADER_CANDIDATES = { 
		    "X-Forwarded-For",
		    "Proxy-Client-IP",
		    "WL-Proxy-Client-IP",
		    "HTTP_X_FORWARDED_FOR",
		    "HTTP_X_FORWARDED",
		    "HTTP_X_CLUSTER_CLIENT_IP",
		    "HTTP_CLIENT_IP",
		    "HTTP_FORWARDED_FOR",
		    "HTTP_FORWARDED",
		    "HTTP_VIA",
		    "REMOTE_ADDR" };

		public static String getClientIpAddress(HttpServletRequest request) {
		    for (String header : IP_HEADER_CANDIDATES) {
		        String ip = request.getHeader(header);
		        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
		            return ip;
		        }
		    }
		    return request.getRemoteAddr();
		}

}

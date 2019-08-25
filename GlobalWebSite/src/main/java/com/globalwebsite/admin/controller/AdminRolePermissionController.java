package com.globalwebsite.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.services.AdminServiceInterfaceImpl;

@Controller
public class AdminRolePermissionController {

	private final static Logger logger = Logger.getLogger(AdminRolePermissionController.class);
	@Autowired
	private AdminServiceInterfaceImpl adminservices;
	
	@Value("${superadmin.roleid}")
	private int superadminid;
	
	@RequestMapping("/view-rolepermissions")
	public ModelAndView viewReolePermissionPage(Model model, HttpServletRequest req) {
		boolean rolenotnull = req.getSession().getAttribute("roleid") != null;
		logger.info("viewAddedOperatorPage");
		if (rolenotnull==false) {
			return new ModelAndView("admin/somethingError");
		}
		String ssroleid = (String)req.getSession().getAttribute("roleid");
		int roleid = Integer.valueOf(ssroleid);
		String permisaccess = adminManagePermissions(roleid, req);
		if(permisaccess == "accessdenied"){
			return new ModelAndView("admin/somethingError");
		}
		List<AdminRolePermissionModel> listallroles = adminservices.getAllRoles();
		model.addAttribute("superadminid", superadminid);
		return new ModelAndView("admin/adminAddPermissions", "listallroles", listallroles);
	}

	@RequestMapping("/edit-rolepermissions")
	public ModelAndView getAssignedPermissionsForRole(HttpServletRequest req, Model model,
			AdminRolePermissionModel arp) {
		model.addAttribute("editperm", arp);
		model.addAttribute("smsg", req.getParameter("smsg"));
		model.addAttribute("emsg", req.getParameter("emsg"));
		int paramroleid = Integer.parseInt(req.getParameter("roleid"));
		List<AdminRolePermissionModel> listroleperm = adminservices.getAllPermissionsBasedonRoleId(paramroleid);
		System.out.println("***************: " + listroleperm.size());
		List<AdminRolePermissionModel> notlistperm = adminservices.getNotAssignedRolePermissions(paramroleid);
		model.addAttribute("notlistperm", notlistperm);
		String rolename = adminservices.getRoleNameFromId(paramroleid);
		model.addAttribute("paramroleid", paramroleid);
		model.addAttribute("rolename", rolename);
		return new ModelAndView("admin/adminEditPermissions", "listroleperm", listroleperm);
	}

	@RequestMapping("/update-rolepermissions")
	public ModelAndView updatePermissionsForRole(HttpServletRequest req, Model model, AdminRolePermissionModel arp) {
		String[] permilist = req.getParameterValues("permilist");
		int updatecnt = 0;
		String emsg = null;
		String smsg = null;
      
		int deletecnt = adminservices.deleteRolePermissions(arp.getRoleid(), arp.getPermilist());
		if (deletecnt > 0) {
			updatecnt++;
		}

		if(arp.getPermilist()!=null){
		for (String plistid : permilist) {
			System.out.println("*************: " + plistid);
			int availabilitycnt = adminservices.checkRolePermissionisAvailable(arp.getRoleid(), plistid);
			if (availabilitycnt == 0) {
				int insertcnt = adminservices.insertRolePermissions(arp.getRoleid(), plistid);
				if (insertcnt > 0) {
					updatecnt++;
				}
			}
		}
		}

		if (updatecnt == 0) {
			emsg = "Permissions are not updated.Pls try again or contact support team";
		} else {
			smsg = "Permissions are updated succesfully.";
		}
		model.addAttribute("emsg", emsg);
		model.addAttribute("smsg", smsg);
		model.addAttribute("roleid", arp.getRoleid());

		return new ModelAndView("redirect:/edit-rolepermissions", "editpermlist", model);

	}
	
	
	public String adminManagePermissions(int roleid, HttpServletRequest request){
	
		String permisaccess="";
		String permissionurl = getQueryStringFromURL(request);
		List<Map<String, Object>> getpermlst = adminservices.getPermissionIsAvailable(roleid,permissionurl);
		if(roleid==superadminid){
			permisaccess = "grantpermission";
		}else{
			permisaccess = getpermlst.size()==0 ?permisaccess = "accessdenied" : "grantpermission";
		}
		return permisaccess;
	}
	
	public String getQueryStringFromURL(HttpServletRequest request) {
		String getqryString = request.getQueryString();
		String apndQryStr = "";
		try {
			if(getqryString.contains("selectedparam=")){
				apndQryStr = "?selectedparam="+request.getParameter("selectedparam");
			}
		} catch (Exception e) {
			logger.info("Query String is not found in the URL::"+request.getServletPath());
			apndQryStr="";
		}
		String permissionurl = request.getServletPath();
		permissionurl=permissionurl.replaceFirst("/", "");
		permissionurl = permissionurl+""+apndQryStr;
		return permissionurl;
	}
	
	public List<AdminRolePermissionModel> getAllPermissionsBasedonRoleId(int roleid){
		
		return adminservices.getAllPermissionsBasedonRoleId(roleid);
		
	}
	
	public List<AdminRolePermissionModel> getAllPermissionsForSuperuser(){
		return adminservices.getAllPermissions();
	}
}
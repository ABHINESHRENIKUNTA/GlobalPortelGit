package com.globalwebsite.admin.dao;

import java.util.List;

import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.gw.student.model.AdminSubmissionModel;

public interface AdminDaoInterface {

	List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel);

	int updateOTP(String oTP, int gid);

	int getValidateAdminOTP(AdminLoginModel lmodel);

	int uploadAdminUserDahboardImagesData(AdminAddUserImagesModel adm);

	List<AdminAddUserImagesModel> getAdminDeleteUserImages();

	int deleteAdminSelectedImage(String admid);
	
	public int createNewScrolllink(AddScrollLink addscroll);
	
	public List<AddScrollLink> getAllScrollLinkNames();
	
	public int updateScrollLink(EditScrollLink editscrolllink);
	
	public int deleteScrollLink(DeleteScrollLink deleteScrollLink);

	//Add Common Submission Data
	int insertSubmissionData(AdminSubmissionModel stdmodel);

	//Select count from common Submission Data
	int selectCountForSubmissionData(AdminSubmissionModel stdmodel);

	//View common Submission Data
	List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey, String prevdate, String currentdate);

	List<AdminRolePermissionModel> getAllRoles();

	List<AdminRolePermissionModel> getAllPermissions();

	List<AdminRolePermissionModel> getNotAssignedRolePermissions(int roleid);

	List<AdminRolePermissionModel> getAllPermissionsBasedonRoleId(int loggedroleid);

	String getRoleNameFromId(int roleid);
	
	int checkRolePermissionisAvailable(int roleid, String plistid);

	int deleteRolePermissions(int roleid, String permids);

	int insertRolePermissions(int roleid, String plistid);






}

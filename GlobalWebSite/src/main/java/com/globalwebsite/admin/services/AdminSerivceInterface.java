package com.globalwebsite.admin.services;

import java.util.List;

import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.gw.student.model.AdminSubmissionModel;

public interface AdminSerivceInterface {

	List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel);

	int updateOTP(String oTP,int gid);

	int getValidateAdminOTP(AdminLoginModel lmodel);

	int uploadAdminUserDahboardImagesData(AdminAddUserImagesModel adm);

	List<AdminAddUserImagesModel> getAdminDeleteUserImages();

	int deleteAdminSelectedImage(String string);
    
	List<AddScrollLink> getAllScrollLinkNames();
	
	int createNewScrolllink(AddScrollLink addscroll);
	
	int updateScrollLink(EditScrollLink editscrolllink);
	
	int deleteScrollLink(DeleteScrollLink deleteScrollLink);
	
	//Add Common Submission Data
	int insertSubmissionData(AdminSubmissionModel stdmodel);

	//Select count from common Submission Data
	int selectCountForSubmissionData(AdminSubmissionModel stdmodel);

	/*View Common submission Data */
	List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey);

	List<AdminRolePermissionModel> getAllRoles();

	List<AdminRolePermissionModel> getAllPermissions();

	List<AdminRolePermissionModel> getAllPermissionsBasedonRoleId(int loggedroleid);

	List<AdminRolePermissionModel> getNotAssignedRolePermissions(int roleid);

	String getRoleNameFromId(int roleid);

	int checkRolePermissionisAvailable(int roleid, String plistid);

	int deleteRolePermissions(int roleid, String permids);

	int insertRolePermissions(int roleid, String plistid);

	int adminAddJobConsultantInfo(AdminSubmissionModel stdmodel);

	List<AdminSubmissionModel> getAllViewConsuRefAdminPostSubmissionData(String tablekey);


}

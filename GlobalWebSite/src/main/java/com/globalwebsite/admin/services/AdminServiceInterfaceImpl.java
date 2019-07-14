package com.globalwebsite.admin.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.admin.dao.AdminDaoInterfaceImpl;
import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.AdminOperatorModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.model.CountryModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.gw.student.model.AdminSubmissionModel;


@Service("adminservices")
public class AdminServiceInterfaceImpl implements AdminSerivceInterface {
	
	@Autowired
	private AdminDaoInterfaceImpl admindaoimpl;

	@Override
	public List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel) {
		return admindaoimpl.getAdminLoginDetails(lmodel);
	}
	@Override
	public int updateOTP(String oTP, int gid) {
		return admindaoimpl.updateOTP(oTP,gid);
	}
	@Override
	public int getValidateAdminOTP(AdminLoginModel lmodel) {
		return admindaoimpl.getValidateAdminOTP(lmodel);
	}
	@Override
	public int uploadAdminUserDahboardImagesData(AdminAddUserImagesModel adm) {
		return admindaoimpl.uploadAdminUserDahboardImagesData(adm);
	}
	@Override
	public List<AdminAddUserImagesModel> getAdminDeleteUserImages() {
		return admindaoimpl.getAdminDeleteUserImages();
	}
	@Override
	public int deleteAdminSelectedImage(String admid) {
		return admindaoimpl.deleteAdminSelectedImage(admid);
	}

@Override
public int createNewScrolllink(AddScrollLink addscroll) {
	// TODO Auto-generated method stub
	return admindaoimpl.createNewScrolllink(addscroll);
}
@Override
public List<AddScrollLink> getAllScrollLinkNames() {
	// TODO Auto-generated method stub
	return admindaoimpl.getAllScrollLinkNames();
}
@Override
public int deleteScrollLink(DeleteScrollLink deleteScrollLink) {
	// TODO Auto-generated method stub
	return admindaoimpl.deleteScrollLink(deleteScrollLink);
}
@Override
public int updateScrollLink(EditScrollLink editscrolllink) {
	// TODO Auto-generated method stub
	return admindaoimpl.updateScrollLink(editscrolllink);
}

//Insert Common Submission Data
@Override
public int insertSubmissionData(AdminSubmissionModel stdmodel) {
	return admindaoimpl.insertSubmissionData(stdmodel);
}
//Insert Abroad Data
@Override
public int insertAbroadSubmissionData(AdminSubmissionModel stdmodel) {
	return admindaoimpl.insertAbroadSubmissionData(stdmodel);
}

@Override
public int selectCountForSubmissionData(AdminSubmissionModel stdmodel) {
	return admindaoimpl.selectCountForSubmissionData(stdmodel);
}

/*View Common submission Data */
@Override
public List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey, String prevdate, String currentdate){
	return admindaoimpl.getAllViewSubmissionData(tablekey,prevdate,currentdate);
}
@Override
public List<AdminRolePermissionModel> getAllRoles() {
	return admindaoimpl.getAllRoles();
}
@Override
public List<AdminRolePermissionModel> getAllPermissions() {
	return admindaoimpl.getAllPermissions();
}
@Override
public List<AdminRolePermissionModel> getAllPermissionsBasedonRoleId(int loggedroleid) {
	return admindaoimpl.getAllPermissionsBasedonRoleId(loggedroleid);
}

@Override
public List<AdminRolePermissionModel> getNotAssignedRolePermissions(int roleid) {
	return admindaoimpl.getNotAssignedRolePermissions(roleid);
}
@Override
public String getRoleNameFromId(int roleid) {
	return admindaoimpl.getRoleNameFromId(roleid);
}
@Override
public int checkRolePermissionisAvailable(int roleid, String plistid) {
	return admindaoimpl.checkRolePermissionisAvailable(roleid, plistid);
}
@Override
public int deleteRolePermissions(int roleid, String permids) {
	return admindaoimpl.deleteRolePermissions(roleid, permids);
}
@Override
public int insertRolePermissions(int roleid, String plistid) {
	return admindaoimpl.insertRolePermissions(roleid, plistid);
}
public List<Map<String, Object>> getPermissionIsAvailable(int roleid, String permissionurl) {
	return admindaoimpl.getPermissionIsAvailable(roleid, permissionurl);
}

@Override
public int adminAddJobConsultantInfo(AdminSubmissionModel stdmodel){
	return admindaoimpl.adminAddJobConsultantInfo(stdmodel);
}
@Override
public List<AdminSubmissionModel> getAllViewConsuRefAdminPostSubmissionData(String tablekey, String prevdate, String currentdate) {
	return admindaoimpl.getAllViewConsuRefAdminPostSubmissionData(tablekey,prevdate,currentdate);
}
@Override
public int insertOperatorSubmissionData(AdminOperatorModel aom) {
	return admindaoimpl.insertOperatorSubmissionData(aom);
}
@Override
public List<CountryModel> findAllCountries() {
	return admindaoimpl.findAllCountries();
}
}

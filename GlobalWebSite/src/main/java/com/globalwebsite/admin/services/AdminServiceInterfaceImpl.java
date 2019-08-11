package com.globalwebsite.admin.services;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import com.globalwebsite.admin.model.IndustryTypeModel;
import com.globalwebsite.admin.model.StatesModel;
import com.gw.student.model.AdminSubmissionModel;


@Service("adminservices")
public class AdminServiceInterfaceImpl implements AdminSerivceInterface {
	
	@Autowired
	private AdminDaoInterfaceImpl admindaoimpl;

	@Value("${admin.viewtype}")
	private String adminViewType;
	
	@Value("${user.viewtype}")
	private String userViewType;
	
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

public int updateImageFileNameInTable(String tablename, String filename, int rowid){
	return admindaoimpl.updateImageFileNameInTable(tablename, filename, rowid);
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
public List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey, String prevdate, String currentdate, String viewType){
		return admindaoimpl.getAllViewSubmissionData(tablekey,prevdate,currentdate, viewType);
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
public int insertAdminAddJobAllJobDetailsInfo(AdminSubmissionModel stdmodel){
	return admindaoimpl.insertAdminAddJobAllJobDetailsInfo(stdmodel);
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

@Override
public List<StatesModel> findAllStates() {
	return admindaoimpl.findAllStates();
}
@Override
public List<IndustryTypeModel> findAllIndustryTypes() {
	return admindaoimpl.findAllIndustryTypes();
}

@Override
public int insertStateSubmissionData(AdminSubmissionModel stdmodel) {
	return admindaoimpl.insertStateSubmissionData(stdmodel);
}
@Override
public List<AdminSubmissionModel> getAllViewAdminAbroadData(String tablekey, String prevdate, String currentdate) {
	return admindaoimpl.getAllViewAdminAbroadData(tablekey, prevdate, currentdate);
}
@Override
public List<AdminSubmissionModel> getAllViewAdminStateWiseData(String tablekey, String prevdate, String currentdate) {
	return admindaoimpl.getAllViewAdminStateWiseData(tablekey, prevdate, currentdate);
}
public List<AdminSubmissionModel> getAllViewConsuRefAdminPostSubmissionDataById(String tablekey, int rowId) {
	return admindaoimpl.getAllViewConsuRefAdminPostSubmissionDataById(tablekey, rowId);
}
public List<AdminSubmissionModel> getAllViewSubmissionDataById(String tablekey, int rowId) {
	return admindaoimpl.getAllViewSubmissionDataById(tablekey, rowId);
}
public List<AdminSubmissionModel> getAllViewAdminAbroadDataById(String tablekey, int rowId) {
	return admindaoimpl.getAllViewAdminAbroadDataById(tablekey, rowId);
}
public List<AdminSubmissionModel> getAllViewAdminStateWiseDataById(String tablekey, int rowId) {
	return admindaoimpl.getAllViewAdminStateWiseDataById(tablekey, rowId);
}




}

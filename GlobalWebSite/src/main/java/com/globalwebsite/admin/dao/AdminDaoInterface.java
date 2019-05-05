package com.globalwebsite.admin.dao;

import java.util.List;

import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.EditScrollLink;

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



}

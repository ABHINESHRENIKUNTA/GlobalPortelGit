package com.globalwebsite.admin.services;

import java.util.List;

import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.gw.student.model.StudentDashboardModel;

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
	int insertSubmissionData(StudentDashboardModel stdmodel);

	//Select count from common Submission Data
	int selectCountForSubmissionData(StudentDashboardModel stdmodel);

}

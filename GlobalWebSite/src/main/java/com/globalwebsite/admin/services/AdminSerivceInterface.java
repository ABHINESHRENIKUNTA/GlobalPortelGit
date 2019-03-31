package com.globalwebsite.admin.services;

import java.util.List;

import com.globalwebsite.admin.model.AdminLoginModel;

public interface AdminSerivceInterface {

	List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel);

	int updateOTP(String oTP,int gid);

	int getValidateAdminOTP(AdminLoginModel lmodel);


}

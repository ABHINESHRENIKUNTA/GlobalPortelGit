package com.globalwebsite.admin.dao;

import java.util.List;

import com.globalwebsite.admin.model.AdminLoginModel;

public interface AdminDaoInterface {

	List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel);

	int updateOTP(String oTP, int gid);

	int getValidateAdminOTP(AdminLoginModel lmodel);



}

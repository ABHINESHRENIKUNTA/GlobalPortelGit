package com.globalwebsite.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.admin.dao.AdminDaoInterfaceImpl;
import com.globalwebsite.admin.model.AdminLoginModel;


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



	
}

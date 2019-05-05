package com.globalwebsite.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.admin.dao.AdminDaoInterfaceImpl;
import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;


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

	
}

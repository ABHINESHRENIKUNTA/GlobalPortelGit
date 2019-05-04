package com.globalwebsite.common.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.common.dao.UserDaoInterfaceImpl;
import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;

@Service("userServices")
public class UserServiceInterfaceImpl implements UserServiceInterface {
	
	@Autowired
	private UserDaoInterfaceImpl userdaoimpl;

	@Override
	public int getCountForAlreadyExistStudent(StudentLoginModel stud) {
		return userdaoimpl.getCountForAlreadyExistStudent(stud);
	}
	@Override
	public int insertStudentRegistrationDetails(StudentLoginModel stud) {
		return userdaoimpl.insertStudentRegistrationDetails(stud);
	}
	@Override
	public int validateStudentDetails(StudentLoginModel stud) {
		return userdaoimpl.validateStudentDetails(stud);
	}
	@Override
	public int validateEmployeeDetails(EmployeeLoginModel empl) {
		return userdaoimpl.validateEmployeeDetails(empl);
	}
	@Override
	public int getCountForAlreadyExistEmployee(EmployeeLoginModel empl) {
		return userdaoimpl.getCountForAlreadyExistEmployee(empl);
	}
	@Override
	public int insertEmployeeRegistrationDetails(EmployeeLoginModel empl) {
		return userdaoimpl.insertEmployeeRegistrationDetails(empl);
	}
	@Override
	public int validateReferalDetails(ReferalLoginModel refl) {
		return userdaoimpl.validateReferalDetails(refl);
	}
	@Override
	public int getCountForAlreadyExistReferal(ReferalLoginModel refl) {
		return userdaoimpl.getCountForAlreadyExistReferal(refl);
	}
	@Override
	public int insertReferalRegistrationDetails(ReferalLoginModel refl) {
		return userdaoimpl.insertReferalRegistrationDetails(refl);
	}

}

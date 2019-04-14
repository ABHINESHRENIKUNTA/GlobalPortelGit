package com.globalwebsite.common.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.globalwebsite.common.dao.UserDaoInterfaceImpl;
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

}

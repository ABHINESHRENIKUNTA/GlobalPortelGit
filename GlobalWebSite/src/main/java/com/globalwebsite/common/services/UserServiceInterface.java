package com.globalwebsite.common.services;

import com.globalwebsite.common.model.StudentLoginModel;

public interface UserServiceInterface {

	int getCountForAlreadyExistStudent(StudentLoginModel stud);

	int insertStudentRegistrationDetails(StudentLoginModel stud);

	int validateStudentDetails(StudentLoginModel stud);

}

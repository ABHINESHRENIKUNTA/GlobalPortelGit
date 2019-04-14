package com.globalwebsite.common.dao;

import com.globalwebsite.common.model.StudentLoginModel;

public interface UserDaoInterface {

	int getCountForAlreadyExistStudent(StudentLoginModel stud);

	int insertStudentRegistrationDetails(StudentLoginModel stud);

	int validateStudentDetails(StudentLoginModel stud);

}

package com.globalwebsite.common.dao;

import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;

public interface UserDaoInterface {

	int getCountForAlreadyExistStudent(StudentLoginModel stud);

	int insertStudentRegistrationDetails(StudentLoginModel stud);

	int validateStudentDetails(StudentLoginModel stud);

	int validateEmployeeDetails(EmployeeLoginModel empl);

	int getCountForAlreadyExistEmployee(EmployeeLoginModel empl);

	int insertEmployeeRegistrationDetails(EmployeeLoginModel empl);

	int validateReferalDetails(ReferalLoginModel refl);

	int getCountForAlreadyExistReferal(ReferalLoginModel refl);

	int insertReferalRegistrationDetails(ReferalLoginModel refl);

}

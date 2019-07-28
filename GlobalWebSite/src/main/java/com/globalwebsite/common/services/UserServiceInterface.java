package com.globalwebsite.common.services;

import java.util.List;

import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;
import com.gw.student.model.AdminSubmissionModel;

public interface UserServiceInterface {

	int getCountForAlreadyExistStudent(StudentLoginModel stud);

	int insertStudentRegistrationDetails(StudentLoginModel stud);

	int validateStudentDetails(StudentLoginModel stud);

	int validateEmployeeDetails(EmployeeLoginModel empl);

	int getCountForAlreadyExistEmployee(EmployeeLoginModel empl);

	int insertEmployeeRegistrationDetails(EmployeeLoginModel stud);

	int validateReferalDetails(ReferalLoginModel refl);

	int getCountForAlreadyExistReferal(ReferalLoginModel refl);

	int insertReferalRegistrationDetails(ReferalLoginModel refl);

	List<StudentLoginModel> getJobCategoriesDisplay();

	int getDuplicateJobCategory(StudentLoginModel stud);

	int insertOtherJobCategory(StudentLoginModel stud);

	int getmaxjocatid();

	List<AdminSubmissionModel> getActivePopularJobs(int activenum);

	List<AdminSubmissionModel> findAllViewJobInfo(int activenum, String tablekey);

	List<AdminSubmissionModel> findSelectedViewJobInfo(int jobdetailid, String tablekey);

}

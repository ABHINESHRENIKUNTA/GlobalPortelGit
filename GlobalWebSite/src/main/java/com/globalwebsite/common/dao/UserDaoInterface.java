package com.globalwebsite.common.dao;

import java.util.List;

import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.JobDetailCountModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;
import com.gw.student.model.AdminSubmissionModel;

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

	List<StudentLoginModel> getJobCategoriesDisplay();

	int getDuplicateJobCategory(StudentLoginModel stud);

	int insertOtherJobCategory(StudentLoginModel stud);

	int getmaxjocatid();

	List<AdminSubmissionModel> findAllViewJobInfo(int activenum, String tablekey);

	List<AdminSubmissionModel> findSelectedViewJobInfo(int seljobid, String tablekey);

	List<AdminSubmissionModel> getActiveStatewiseJobs(int activenum);

	List<AdminSubmissionModel> getActiveAbroadJobs(int activenum);

	List<AdminSubmissionModel> getCommonSubmissionJobsList(String tablekey, int activenum);

	List<JobDetailCountModel> getTotalIndustryCount(int activenum, String tablekey);

}

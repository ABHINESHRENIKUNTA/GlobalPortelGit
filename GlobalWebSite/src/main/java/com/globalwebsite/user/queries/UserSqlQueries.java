package com.globalwebsite.user.queries;

public class UserSqlQueries {

	public static final String GETCOUNTFOREXISTSTUDENT_QUERY = "select count(*) from global_student_details where email_id=?";
	public static final String INSERTSTUDENTREGISTRATIONDETAILS_QUERY = "INSERT INTO global_student_details(student_name,mobile_no,email_id,password,confirm_password,qualification,passing_year,resume,created_date,modified_date)values(?,?,?,?,?,?,?,?,?,?)";
	public static final String VALIDATESTUDENTDETAILS_QUERY = "select count(*) from global_student_details where email_id=? and password=?";
	public static final String VALIDATEEMPLOYEEDETAILS_QUERY = "select count(*) from global_employee_details where hr_email=? and password=?";
	public static final String GETCOUNTFORALREADYEXISTEMPLOYEE_QUERY = "select count(*) from global_employee_details where hr_email=?";
	public static final String INSERTEMPLOYEEREGISTRATIONDETAILS_QUERY = "INSERT INTO global_employee_details(comapany_name,hr_name,hr_email,password,conatact_no,comapany_website,job_position,qualification_required,job_description,created_date,modified_date) VALUES(?,?,?,?,?,?,?,?,?,?,?);";
	public static final String VALIDATEREFERALDETAILS_QUERY = "select count(*) from global_referal_details where referal_email=? and password=?";
	public static final String GETCOUNTFORALREADYEXISTREFERAL_QUERY = "select count(*) from global_referal_details where referal_email=?";
	public static final String INSERTREFERALREGISTRATIONDETAILS_QUERY = "INSERT INTO global_referal_details(company_name,referal_name,referal_email,password,contact_no,position_offering,qualification_required,job_description,created_date,modified_date)VALUES(?,?,?,?,?,?,?,?,?,?)";

}

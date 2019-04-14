package com.globalwebsite.user.queries;

public class UserSqlQueries {

	public static final String GETCOUNTFOREXISTSTUDENT_QUERY = "select count(*) from global_student_details where email_id=?";
	public static final String INSERTSTUDENTREGISTRATIONDETAILS_QUERY = "INSERT INTO global_student_details(student_name,mobile_no,email_id,password,confirm_password,qualification,passing_year,resume,created_date,modified_date)values(?,?,?,?,?,?,?,?,?,?)";
	public static final String VALIDATESTUDENTDETAILS_QUERY = "select count(*) from global_student_details where email_id=? and password=?";

}

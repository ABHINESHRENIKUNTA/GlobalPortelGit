package com.globalwebsite.user.queries;

public class UserSqlQueries {

	public static final String GETCOUNTFOREXISTSTUDENT_QUERY = "select count(*) from global_student_details where email_id=?";
	public static final String INSERTSTUDENTREGISTRATIONDETAILS_QUERY = "INSERT INTO global_student_details(student_name,mobile_no,email_id,password,confirm_password,qualification,passing_year,resume,job_category,created_date,modified_date)values(?,?,?,?,?,?,?,?,?,?,?)";
	public static final String VALIDATESTUDENTDETAILS_QUERY = "select count(*) from global_student_details where email_id=? and password=?";
	public static final String VALIDATEEMPLOYEEDETAILS_QUERY = "select count(*) from global_employee_details where hr_email=? and password=?";
	public static final String GETCOUNTFORALREADYEXISTEMPLOYEE_QUERY = "select count(*) from global_employee_details where hr_email=?";
	public static final String INSERTEMPLOYEEREGISTRATIONDETAILS_QUERY = "INSERT INTO global_employee_details(comapany_name,hr_name,hr_email,password,conatact_no,comapany_website,job_position,qualification_required,job_description,created_date,modified_date) VALUES(?,?,?,?,?,?,?,?,?,?,?);";
	public static final String VALIDATEREFERALDETAILS_QUERY = "select count(*) from global_referal_details where referal_email=? and password=?";
	public static final String GETCOUNTFORALREADYEXISTREFERAL_QUERY = "select count(*) from global_referal_details where referal_email=?";
	public static final String INSERTREFERALREGISTRATIONDETAILS_QUERY = "INSERT INTO global_referal_details(company_name,referal_name,referal_email,password,contact_no,position_offering,qualification_required,job_description,created_date,modified_date)VALUES(?,?,?,?,?,?,?,?,?,?)";
	public static final String GETJOBCATEGORIESTODISPLAY_QUERY = "select * from global_job_category";
	public static final String GETDUPLICATEJOBCATEGORY_QUERY = "SELECT count(*) FROM global_job_category where global_job_category=?";
	public static final String INSERTOTHERJOBCATEGORY_QUERY = "insert into global_job_category(global_job_category) values(?)";
	public static final String GETMAXJOCATID_QUERY = "select max(global_job_category_id) from global_job_category ";
	public static final String GETACTIVEPOPULARJOBS_QUERY = "select * from global_popular_jobsites_page where is_active=?";
	public static final String GETALLVIEWJOBINFO_QUERY = "select * from global_jobconsult_jobs where status=?";
	public static String findAllViewJobInfo_query(String tablekey) {
		return "select * from "+tablekey+" where status=?";
	}
	public static String findSelectedViewJobInfo_query(String tablekey) {
		return "select * from "+tablekey+" where id=?";
	}

}

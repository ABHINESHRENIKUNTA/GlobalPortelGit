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
	public static final String GETALLVIEWJOBINFO_QUERY = "select * from global_jobconsult_jobs where status=?";
	public static final String GETACTIVESTATEWISEJOBS_QUERY = "select sj.*, st.statename from "
			+ "global_statewisegovt_jobs sj, states st where sj.state_id=st.id and sj.is_active=?";
	public static final String GETACTIVEABROADJOBS_QUERY = "select aj.*, cn.name, cn.nicename,cn.iso3,cn.numcode,cn.phonecode "
			+ "from global_abroad_jobs aj, country cn where aj.iso=cn.iso and aj.is_active=?";
	public static String findAllViewJobInfo_query(String tablekey) {
		return "select jd.*,it.industry_name from "+tablekey+" jd, industry_type it where jd.industry_id=it.id and jd.status=? ";
	}
	public static String fetchJobDetailsByFilter_query(String tablekey, String wherecond) {
		return "select jd.*,it.industry_name from "+tablekey+" jd, industry_type it where jd.industry_id=it.id "
				+ ""+wherecond+" and jd.status=?";
	}
	public static String findSelectedViewJobInfo_query(String tablekey) {
		return "select jd.*,it.industry_name from "+tablekey+" jd, industry_type it where jd.id=? and jd.industry_id=it.id";
	}
	public static String getCommonSubmissionJobsList_query(String tablekey) {
		return "select * from "+tablekey+" where is_active=?";
	}
	public static String getTotalIndustryCount_query(String tablekey) {
		return "SELECT  industry_type.id as jobid, industry_type.industry_name as jobname, "
				+ "COUNT(jb.industry_id) AS jobscount FROM  industry_type "
				+ "LEFT JOIN "+tablekey+" jb ON industry_type.id = jb.industry_id "
				+ "and industry_type.status=? GROUP BY industry_type.id,industry_type.industry_name";
	}
	
	/*******************Job Categories Count*******************/
	public static final String GETPOPULAJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_popular_jobsites_page where is_active=?";
	public static final String GETSTATEWISEGOVTJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_statewisegovt_jobs where is_active=?";
	public static final String GETCENTRALGOVJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_centralgov_jobs where is_active=?";
	public static final String GETABROADJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_abroad_jobs where is_active=?";
	public static final String GETITJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_it_jobs where is_active=?";
	public static final String GETNONITJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_nonit_jobs where is_active=?";
	public static final String GETFREEJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_freejobtraining_jobs where is_active=?";
	public static final String GETPLACEMENTJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_trainingandplace_jobs where is_active=?";
	public static final String GETPOSTEDBYCONSULTANTSJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_jobconsult_jobs where status=?";
	public static final String GETPOSTEDBYREFERRALSJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_refpost_jobs where status=?";
	public static final String GETPOSTEDBYAADMINJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_postedbyadmin_jobs where status=?";
	public static final String GETPOSTEDBYEMPJOBSCOUNT_QUERY = "SELECT count(ifnull(id,0)) as totalcount FROM global_empposted_jobs where status=?";
	public static final String FINDUSERISAVAILABLE_QUERY = "select * from global_student_details where email_id=? and password=?";
	
	
	
	
}

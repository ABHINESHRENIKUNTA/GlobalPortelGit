package com.globalwebsite.admin.queries;

import com.gw.student.model.AdminSubmissionModel;

public class AdminSqlQueries {

	public static final String GETADMINLOGINSQL_QUERY = "select * from global_admin_login where username=? and password=?";
	public static final String GETADMINUPDATEDOTP_QUERY = "update global_admin_login set OTP=? where global_login_id=?";
	public static final String GETVALIDATEADMINOTP_QUERY = "select count(*) from global_admin_login where username=? and OTP=?";
	public static final String UPLOADDASHBOARDIMAGS_QUERY = "insert into global_userdashb_images(image_title,file_name,file_link,created_date,modified_date) values(?,?,?,?,?) ";
	public static final String GETADMINDELETEUSERIMAGES_QUERY = "select * from global_userdashb_images";
	public static final String DELETEADMINSELECTEDIMAGE_QUERY = "delete from global_userdashb_images where global_userdashb_images_id=?";
	public static final String InsertScrollLink = "insert into global_userdashb_scrolllinks(link_name,link_address,link_owner,link_addeddate,link_comments,link_emailId) values(?,?,?,?,?,?)";
	public static final String GetAllScrollLinks = "select * from global_userdashb_scrolllinks";
	public static final String UpdateScrollLink = "update global_userdashb_scrolllinks set link_address=? where link_name=?";
	public static final String deleteScrollLink = "delete from global_userdashb_scrolllinks where link_name=?";
	/*public static final String INSERTSUBMISSIONDATA_SQL = "insert into ?"
			+ "(link_name,link_address,link_owner,link_emailId,file_name,link_comments,created_date,modified_date) "
			+ "values(?,?,?,?,?,?,?,?)";*/
	public static String insertSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "insert into "+stdmodel.getTablename()+""
				+ "(link_name,link_address,link_owner,link_emailId,file_name,link_comments,is_active,created_date,modified_date) "
				+ "values(?,?,?,?,?,?,?,?,?)";
	}
	public static String selectCountForSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return "SELECT if((count(*) is null or count(*)=0),1,count(*)+1) as rowcount FROM "+stdmodel.getTablename()+"";
	}
	public static String getAllViewSubmissionData_Query(String tablename) {
		return "select * from "+tablename+"";
	}

}

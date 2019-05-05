package com.globalwebsite.admin.queries;

public class AdminSqlQueries {

	public static final String GETADMINLOGINSQL_QUERY = "select * from global_admin_login where username=? and password=?";
	public static final String GETADMINUPDATEDOTP_QUERY = "update global_admin_login set OTP=? where global_login_id=?";
	public static final String GETVALIDATEADMINOTP_QUERY = "select count(*) from global_admin_login where username=? and OTP=?";
	public static final String UPLOADDASHBOARDIMAGS_QUERY = "insert into global_userdashb_images(image_title,file_name,file_link,created_date,modified_date) values(?,?,?,?,?) ";
	public static final String GETADMINDELETEUSERIMAGES_QUERY = "select * from global_userdashb_images";
	public static final String DELETEADMINSELECTEDIMAGE_QUERY = "delete from global_userdashb_images where global_userdashb_images_id=?";
	public static final String InsertScrollLink = "insert into mysql.global_userdashb_scrolllinks(link_name,link_address,link_owner,link_addeddate,link_comments,link_emailId) values(?,?,?,?,?,?)";
	public static final String GetAllScrollLinks = "select * from mysql.global_userdashb_scrolllinks";
	public static final String UpdateScrollLink = "update mysql.global_userdashb_scrolllinks set link_address=? where link_name=?";
	public static final String deleteScrollLink = "delete from mysql.global_userdashb_scrolllinks where link_name=?";

}

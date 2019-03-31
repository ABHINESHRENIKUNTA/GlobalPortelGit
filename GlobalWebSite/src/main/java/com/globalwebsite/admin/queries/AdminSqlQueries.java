package com.globalwebsite.admin.queries;

public class AdminSqlQueries {

	public static final String GETADMINLOGINSQL_QUERY = "select * from global_admin_login where username=? and password=?";
	public static final String GETADMINUPDATEDOTP_QUERY = "update global_admin_login set OTP=? where global_login_id=?";
	public static final String GETVALIDATEADMINOTP_QUERY = "select count(*) from global_admin_login where username=? and OTP=?";

}

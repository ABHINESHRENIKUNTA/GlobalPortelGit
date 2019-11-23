package com.globalwebsite.admin.queries;

import com.gw.student.model.AdminSubmissionModel;

public class AdminSqlQueries {

	public static final String GETADMINLOGINSQL_QUERY = "select * from global_admin_login1 where username=? and password=?";
	public static final String GETADMINUPDATEDOTP_QUERY = "update global_admin_login1 set OTP=? where global_login_id=?";
	public static final String GETVALIDATEADMINOTP_QUERY = "select count(*) from global_admin_login1 where username=? and OTP=?";
	public static final String UPLOADDASHBOARDIMAGS_QUERY = "insert into global_userdashb_images(image_title,file_name,file_link,created_date,modified_date) values(?,?,?,?,?) ";
	public static final String GETADMINDELETEUSERIMAGES_QUERY = "select * from global_userdashb_images";
	public static final String DELETEADMINSELECTEDIMAGE_QUERY = "delete from global_userdashb_images where global_userdashb_images_id=?";
	public static final String InsertScrollLink = "insert into global_userdashb_scrolllinks(link_name,link_address,link_owner,link_addeddate,link_comments,link_emailId) values(?,?,?,?,?,?)";
	public static final String GetAllScrollLinks = "select * from global_userdashb_scrolllinks";
	public static final String UpdateScrollLink = "update global_userdashb_scrolllinks set link_address=? where link_name=?";
	public static final String deleteScrollLink = "delete from global_userdashb_scrolllinks where link_name=?";
	public static final String GETALLROLES_QUERY = "select * from roles";
	public static final String GETALLPERMISSIONS_QUERY = "select * from permissions";
	public static final String GETALLPERMISSIONSBASEDONROLEID_QUERY = "select rp.*,pr.permission_name, pr.description,pr.permission_url, rl.role_name from permissions pr, roles  rl, role_permission rp"
			+ " where  pr.permission_id=rp.permission_id"
			+ " and rl.role_id=rp.role_id"
			+ " and rl.role_id=?";
	public static final String GETNOTMAPPERMISSIONSBASEDONROLEID_QUERY = "select * from permissions pr where permission_id not in ("
			+ "select permission_id from role_permission where role_id=?)";
	public static final String GETROLENAMEFROMID_QUERY = "select role_name from roles where role_id=?";
	public static final String CHECKROLEPERMISSIONISAVAILABLE_QUERY = "select if((count(*) is null or count(*)=0),0,count(*)) as rowcount "
			+ "FROM role_permission where role_id=? and permission_id=?" ;
	public static final String DELETEROLEPERMISSIONS_QUERY = "delete from role_permission where role_id=? and permission_id not in(?)";
	public static final String INSERTROLEPERMISSIONS_QUERY = "insert into role_permission (role_id,permission_id) values (?,?)";
	public static final String INSERTOPERATORSUBMISSIONDATA_QUERY = "INSERT INTO global_admin_login1 "
			+ "(username, password, fullname, qualification, empdob, email, phonenumber, jobdescription, "
			+ "address, referrarname, companyname, companyurl, hrname, hremail, hrphonenumber, roleid, created_by, "
			+ "created_date, modified_date, status,org_id) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
	public static final String UPDATEOPERATORBYID_QUERY = "update global_admin_login1 set "
			+ " username=?, password=?, fullname=?, qualification=?, empdob=?, email=?, phonenumber=?, jobdescription=?, "
			+ "address=?, referrarname=?, companyname=?, companyurl=?, hrname=?, hremail=?, hrphonenumber=?, "
			+ "roleid=?, modified_date=?, status=? "
			+ "where global_login_id=?";
	public static final String FINDALLCOUNTRIES_QUERY = "select * from country order by name";
	public static final String FINDALLSTATES_QUERY = "select * from states where status=? order by statename";
	public static final String FINDALLINDUSTRYTYPES_QUERY = "select * from industry_type where status=? order by industry_name";
	public static final String GETALLOPERATORS_QUERY = "select gal.*,rl.role_name from global_admin_login1 gal, "
			+ "roles rl where rl.role_id=gal.roleid";
	public static final String GETOPERATORBYID_QUERY = "select gal.*,rl.role_name from global_admin_login1 gal, "
			+ "roles rl where rl.role_id=gal.roleid and gal.global_login_id=?";
	public static final String FINDALLORGANIZATIONS_QUERY = "select * from global_organization order by org_name";
	public static final String INSERTORGANIZATIONDATA_QUERY = "insert into global_organization (org_name,status) "
			+ "VALUES(?, ?)";
	public static final String UPDATEORGANIZATIONDATA_QUERY = "update global_organization set org_name=?, status=? where id=?";
	public static final String FINDORGANIZATIONBYID_QUERY = "select * from global_organization where id=?";
	public static final String GETADMINFORGOTPASSWORDDETAILS_QUERY = "select * from global_admin_login1 where username=? ";
	public static final String GETSTUDENTFORGOTPASSWORDDETAILS_QUERY = "select * from global_student_details where email_id=? ";
	
	
	/*public static final String INSERTSUBMISSIONDATA_SQL = "insert into ?"
			+ "(link_name,link_address,link_owner,link_emailId,file_name,link_comments,created_date,modified_date) "
			+ "values(?,?,?,?,?,?,?,?)";*/
	public static String insertSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "insert into "+stdmodel.getTablekey()+""
				+ "(link_name,link_address,link_owner,link_emailId,link_comments,is_active,created_date,modified_date,login_id) "
				+ "values(?,?,?,?,?,?,?,?,?)";
	}
	public static String updateSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "update "+stdmodel.getTablekey()+" set "
				+ "link_name=?,link_address=?,link_owner=?,link_emailId=?,link_comments=?,is_active=?,modified_date=?  "
				+ "where id=?";
	}
	public static String insertAbroadSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "insert into "+stdmodel.getTablekey()+""
				+ "(iso,statename,link_name,link_address,link_owner,link_emailId,file_name,"
				+ "link_comments,is_active,created_date,modified_date,login_id) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
	}
	public static String updateAbroadSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "update "+stdmodel.getTablekey()+" set "
				+ "iso=?,statename=?,link_name=?,link_address=?,link_owner=?,link_emailId=?,"
				+ "file_name=?,link_comments=?,is_active=?,modified_date=? "
				+ "where id=?";
	}
	public static String selectCountForSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return "SELECT if((count(*) is null or count(*)=0),1,count(*)+1) as rowcount FROM "+stdmodel.getTablekey()+"";
	}
	public static String getAllViewSubmissionData_Query(String tablekey) {
		return "select * from "+tablekey+" where created_date between ? and ?";
	}
	public static String getAllViewSubmissionDataById_Query(String tablekey) {
		return "select * from "+tablekey+" where id=?";
	}
	public static String getAllViewSubmissionDataForUser_Query(String tablekey) {
		return "select * from "+tablekey+" where is_active=?";
	}
	public static String DELETEROLEPERMISSIONS_QUERY(int roleid, String permisid) {
	String sql=null;
		if(permisid!=null){
			sql= "delete from role_permission where role_id="+roleid+" and permission_id not in("+permisid+")";
		}else{
			sql= "delete from role_permission where role_id="+roleid+"";
		}
		return sql; 
	}
	public static String insertAdminAddJobAllJobDetailsInfo_Query(AdminSubmissionModel stdmodel) {
		return "INSERT INTO "+stdmodel.getTablekey()+" (job_title, industry_id, company,experience,qualification,"
				+ " role_category, salary, no_of_positions, "
				+ "job_responsibilities, skill_set, email_id,contact_num,location, status, created_by, "
				+ "created_date,notice_period, other_info,jobtype, login_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
	}
	public static String updateAdminAddJobAllJobDetailsInfo_Query(AdminSubmissionModel stdmodel) {
		return "update "+stdmodel.getTablekey()+" set job_title=?, industry_id=?, company=?,experience=?,"
				+ "qualification=?, "
				+ " role_category=?, salary=?, no_of_positions=?, "
				+ "job_responsibilities=?, skill_set=?, email_id=?, "
				+ "contact_num=?,location=?, status=?, created_by=?, "
				+ "modified_date=?,notice_period=?, other_info=?,jobtype=? "
				+ "where id=?";
	}
	
	public static String getAllViewConsuRefAdminPostSubmissionData_Query(String tablekey) {
		return "select jd.*, it.industry_name from "+tablekey+" jd, industry_type it where "
				+ "jd.industry_id=it.id and jd.created_date between ? and ?";
	}
	public static String getAllViewConsuRefAdminPostSubmissionDataByLoginId_Query(String tablekey) {
		return "select jd.*, it.industry_name from "+tablekey+" jd, industry_type it where "
				+ "jd.industry_id=it.id and jd.created_date between ? and ? and jd.login_id=?";
	}
	public static String getAllViewConsuRefAdminPostSubmissionDataById_Query(String tablekey) {
		return "select jd.*, it.industry_name from "+tablekey+" jd, industry_type it "
				+ "where jd.industry_id=it.id and jd.id=?";
	}
	public static String insertStateSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "insert into "+stdmodel.getTablekey()+""
				+ "(state_id,link_name,link_address,link_owner,link_emailId,file_name,link_comments,"
				+ "is_active,created_date,modified_date,login_id) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?)";
	}
	public static String updateStateSubmissionData_Query(AdminSubmissionModel stdmodel) {
		return  "update "+stdmodel.getTablekey()+" set "
				+ "state_id=?,link_name=?,link_address=?,link_owner=?,link_emailId=?,"
				+ "file_name=?,link_comments=?,"
				+ "is_active=?,modified_date=? "
				+ "where id=?";
	}
	
	public static String getAllViewAdminAbroadData_Query(String tablekey) {
		return "select aj.*, cn.name, cn.phonecode from "+tablekey+" aj, country cn where "
				+ "aj.iso=cn.iso and aj.created_date between ? and ?";
	}
	public static String getAllViewAdminAbroadDataById_Query(String tablekey) {
		return "select aj.*, cn.name, cn.phonecode from "+tablekey+" aj, country cn where "
				+ "aj.iso=cn.iso and aj.id=?";
	}
	
	public static String getAllViewAdminStateWiseData_Query(String tablekey) {
		return "select sj.*, st.statename from "+tablekey+" sj, states st where "
				+ "sj.state_id = st.id and sj.created_date between ? and ?";
	}
	public static String getAllViewAdminStateWiseDataById_Query(String tablekey) {
		return "select sj.*, st.statename from "+tablekey+" sj, states st where "
				+ "sj.state_id = st.id and sj.id= ?";
	}
	

}

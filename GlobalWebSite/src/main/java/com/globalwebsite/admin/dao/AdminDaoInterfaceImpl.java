package com.globalwebsite.admin.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.globalwebsite.admin.mapper.AdminDeleteUserImageMapper;
import com.globalwebsite.admin.mapper.AdminLoginMapper;
import com.globalwebsite.admin.mapper.AdminPermissionMapper;
import com.globalwebsite.admin.mapper.AdminRoleMapper;
import com.globalwebsite.admin.mapper.AdminRolePermissionMapper;
import com.globalwebsite.admin.mapper.AdminViewConsuRefAdminPostSubmissionMapper;
import com.globalwebsite.admin.mapper.AdminViewSubmissionMapper;
import com.globalwebsite.admin.mapper.ScrollLinksTableMapper;
import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.globalwebsite.admin.queries.AdminSqlQueries;
import com.gw.student.model.AdminSubmissionModel;

@Repository
public class AdminDaoInterfaceImpl implements AdminDaoInterface {

private final static Logger logger = Logger.getLogger(AdminDaoInterfaceImpl.class);
	
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	public String getDateFromSimpleDateFormat(){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		return fmt.format(now);
	}

	@Override
	public List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel) {
		logger.info("Admin Login Query Executed");
		String sql=AdminSqlQueries.GETADMINLOGINSQL_QUERY;
		return jdbctemplate.query(sql, new Object[]{lmodel.getUsername(),lmodel.getPassword()}, new AdminLoginMapper());
	}
	@Override
	public int updateOTP(String oTP, int gid) {
		String sql=AdminSqlQueries.GETADMINUPDATEDOTP_QUERY;
		return jdbctemplate.update(sql,new Object[]{oTP,gid});
	}
	@Override
	public int getValidateAdminOTP(AdminLoginModel lmodel) {
		String sql=AdminSqlQueries.GETVALIDATEADMINOTP_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{lmodel.getUsername(),lmodel.getOtp()});
	}
	@Override
	public int uploadAdminUserDahboardImagesData(AdminAddUserImagesModel adm) {
		String sql=AdminSqlQueries.UPLOADDASHBOARDIMAGS_QUERY;
		return jdbctemplate.update(sql,new Object[]{adm.getTitle(),adm.getFilename(),adm.getLinkname(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
	}
	@Override
	public List<AdminAddUserImagesModel> getAdminDeleteUserImages() {
		String sql=AdminSqlQueries.GETADMINDELETEUSERIMAGES_QUERY;
		return jdbctemplate.query(sql, new AdminDeleteUserImageMapper());
	}
	@Override
	public int deleteAdminSelectedImage(String admid) {
		String sql=AdminSqlQueries.DELETEADMINSELECTEDIMAGE_QUERY;
		return jdbctemplate.update(sql,new Object[]{admid});
	}

	@Override
		public int createNewScrolllink(AddScrollLink addscroll) {
		String sql=AdminSqlQueries.InsertScrollLink;
		int returnvalue=jdbctemplate.update(sql, addscroll.getLinkname(),addscroll.getLinkaddress(),addscroll.getAddedby(),addscroll.getAddeddate(),addscroll.getComments(),addscroll.getEmailid());
			return returnvalue;
		}
@Override
		public List<AddScrollLink> getAllScrollLinkNames() {
		String sql=AdminSqlQueries.GetAllScrollLinks;
		System.out.println(sql);
		List<AddScrollLink> listObj=jdbctemplate.query(sql, new ScrollLinksTableMapper());
		
			return listObj;
		}	
	@Override
		public int updateScrollLink(EditScrollLink editscrolllink) {
		System.out.println(editscrolllink);
		String sql=AdminSqlQueries.UpdateScrollLink;
		return jdbctemplate .update(sql, editscrolllink.getModifiedlink(),editscrolllink.getLinktobemodified());
		
		}
	@Override
		public int deleteScrollLink(DeleteScrollLink deleteScrollLink) {
			String sql=AdminSqlQueries.deleteScrollLink;
			return jdbctemplate.update(sql, deleteScrollLink.getLinktobedeleted());
			
		}

	/* (non-Javadoc)
	 * @see com.globalwebsite.admin.dao.AdminDaoInterface#insertSubmissionData(com.gw.student.model.StudentDashboardModel)
	 * Common Submission Data
	 */
	@Override
	public int insertSubmissionData(AdminSubmissionModel stdmodel) {
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.insertSubmissionData_Query(stdmodel);
			isinserted= jdbctemplate.update(sql,new Object[]{stdmodel.getLinkname()
					,stdmodel.getLinkaddress(),stdmodel.getLoggedowner(),stdmodel.getEmailid(),
					stdmodel.getFilename(), stdmodel.getComments(),stdmodel.isIsactive(), getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
			System.out.println("insertSubmissionData: "+sql);
			logger.info("insertSubmissionData: "+sql);
		} catch (Exception e) {
			System.out.println("insertSubmissionData: "+e);
			logger.info("insertSubmissionData: "+e);
		}
	return isinserted;
	}
	
	/* (non-Javadoc)
	 * @see com.globalwebsite.admin.dao.AdminDaoInterface#selectCountForSubmissionData(com.gw.student.model.StudentDashboardModel)
	 */
	@Override
	public int selectCountForSubmissionData(AdminSubmissionModel stdmodel){
		String sql=AdminSqlQueries.selectCountForSubmissionData_Query(stdmodel);
		int selectcnt = 0;
      try {
    	  selectcnt = jdbctemplate.queryForInt(sql);
    	  logger.info("selectCountForSubmissionData: "+sql);
		
	} catch (Exception e) {
		System.out.println("selectCountForSubmissionData: "+e);
		logger.info("selectCountForSubmissionData: "+e);
	}
      return selectcnt;
	}
	
	/* (non-Javadoc)
	 * @see com.globalwebsite.admin.dao.AdminDaoInterface#selectViewSubmissionData(com.gw.student.model.AdminSubmissionModel)
	 */
	@Override
	public List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey, String prevdate, String currentdate){
		String sql=AdminSqlQueries.getAllViewSubmissionData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 00:00:00"}, new AdminViewSubmissionMapper());
			logger.info("getAllViewSubmissionData: "+sql);
			
		} catch (Exception e) {
			System.out.println("getAllViewSubmissionData: "+e);
			logger.info("selectViewSubmissionData: "+e);
		}
		return listdata;
	}

	@Override
	public List<AdminRolePermissionModel> getAllRoles() {
		String sql=AdminSqlQueries.GETALLROLES_QUERY;
		List<AdminRolePermissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new AdminRoleMapper());
			logger.info("getAllRoles: "+sql);
			
		} catch (Exception e) {
			System.out.println("getAllRoles: "+e);
			logger.info("getAllRoles: "+e);
		}
		return listdata;
	}

	@Override
	public List<AdminRolePermissionModel> getAllPermissions() {
		String sql=AdminSqlQueries.GETALLPERMISSIONS_QUERY;
		List<AdminRolePermissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new AdminPermissionMapper());
			logger.info("getAllPermissions: "+sql);
			
		} catch (Exception e) {
			System.out.println("getAllPermissions: "+e);
			logger.info("getAllPermissions: "+e);
		}
		return listdata;
	}
	@Override
	public List<AdminRolePermissionModel> getNotAssignedRolePermissions(int roleid) {
		String sql=AdminSqlQueries.GETNOTMAPPERMISSIONSBASEDONROLEID_QUERY;
		List<AdminRolePermissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql,new Object[]{roleid}, new AdminPermissionMapper());
			logger.info("getNotAssignedRolePermissions: "+sql);
			
		} catch (Exception e) {
			System.out.println("getNotAssignedRolePermissions: "+e);
			logger.info("getNotAssignedRolePermissions: "+e);
		}
		return listdata;
	}

	@Override
	public List<AdminRolePermissionModel> getAllPermissionsBasedonRoleId(int loggedroleid) {
		String sql=AdminSqlQueries.GETALLPERMISSIONSBASEDONROLEID_QUERY;
		List<AdminRolePermissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{loggedroleid}, new AdminRolePermissionMapper());
			logger.info("getAllPermissionsBasedonRoleId: "+sql);
			
		} catch (Exception e) {
			System.out.println("getAllPermissionsBasedonRoleId: "+e);
			logger.info("getAllPermissionsBasedonRoleId: "+e);
		}
		return listdata;
	}

	@Override
	public String getRoleNameFromId(int roleid) {
		String sql=AdminSqlQueries.GETROLENAMEFROMID_QUERY;
		String rolename = null;
		try {
			rolename = jdbctemplate.queryForObject(sql, new Object[]{roleid}, String.class);
			logger.info("getRoleNameFromId: "+sql);
			
		} catch (Exception e) {
			System.out.println("getRoleNameFromId: "+e);
			logger.info("getRoleNameFromId: "+e);
		}
		return rolename;
	}

	@Override
	public int checkRolePermissionisAvailable(int roleid, String plistid) {
		String sql=AdminSqlQueries.CHECKROLEPERMISSIONISAVAILABLE_QUERY;
		int updatecnt=0;
		try {
			updatecnt = jdbctemplate.queryForInt(sql, new Object[]{roleid,plistid});
			logger.info("checkRolePermissionisAvailable: "+sql);
			
		} catch (Exception e) {
			System.out.println("checkRolePermissionisAvailable: "+e);
			logger.info("checkRolePermissionisAvailable: "+e);
		}
		return updatecnt;
	}

	@Override
	public int deleteRolePermissions(int roleid, String permids) {
		String sql=AdminSqlQueries.DELETEROLEPERMISSIONS_QUERY(roleid, permids);
		int updatecnt=0;
		try {
			updatecnt = jdbctemplate.update(sql);
			logger.info("deleteRolePermissions: "+sql);
			
		} catch (Exception e) {
			System.out.println("deleteRolePermissions: "+e);
			logger.info("deleteRolePermissions: "+e);
		}
		return updatecnt;
	}

	@Override
	public int insertRolePermissions(int roleid, String plistid) {
		String sql=AdminSqlQueries.INSERTROLEPERMISSIONS_QUERY;
		int updatecnt=0;
		try {
			updatecnt = jdbctemplate.update(sql, new Object[]{roleid,plistid});
			logger.info("insertRolePermissions: "+sql);
			
		} catch (Exception e) {
			System.out.println("insertRolePermissions: "+e);
			logger.info("insertRolePermissions: "+e);
		}
		return updatecnt;
	}

	public List<Map<String, Object>> getPermissionIsAvailable(int roleid, String permissionurl) {
		String sql="select * from role_permission where permission_id="
				+ "(select permission_id from permissions where permission_url='"+permissionurl+"') "
						+ "and role_id='"+roleid+"'";
		System.out.println("getPermissionIsAvailable: "+sql);
		return jdbctemplate.queryForList(sql);
	}

	public int adminAddJobConsultantInfo(AdminSubmissionModel stdmodel) {
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.adminAddJobConsultantInfo_Query(stdmodel);
			isinserted= jdbctemplate.update(sql,new Object[]{stdmodel.getJobtitle()
					,stdmodel.getIndustry(),stdmodel.getRolecategory(),stdmodel.getSalary(),
					stdmodel.getNoofpossitions(), stdmodel.getJobresponsibilities(),
					stdmodel.getSkillreq(),stdmodel.getContactinfo(), stdmodel.isIsactive(), stdmodel.getLoggedowner(),  
					getDateFromSimpleDateFormat()});
			System.out.println("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+sql);
			logger.info("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+sql);
		} catch (Exception e) {
			System.out.println("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+e);
			logger.info("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+e);
		}
	return isinserted;
	}

	public List<AdminSubmissionModel> getAllViewConsuRefAdminPostSubmissionData(String tablekey, String prevdate, String currentdate) {
		String sql=AdminSqlQueries.getAllViewConsuRefAdminPostSubmissionData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 00:00:00"}, new AdminViewConsuRefAdminPostSubmissionMapper());
			System.out.println("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
			logger.info("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
			
		} catch (Exception e) {
			System.out.println("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
			logger.info("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
		}
		return listdata;
	}


	
	
	
}

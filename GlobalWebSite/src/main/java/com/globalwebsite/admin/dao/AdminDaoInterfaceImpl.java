package com.globalwebsite.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.globalwebsite.admin.mapper.AdminDeleteUserImageMapper;
import com.globalwebsite.admin.mapper.AdminLoginMapper;
import com.globalwebsite.admin.mapper.AdminPermissionMapper;
import com.globalwebsite.admin.mapper.AdminRoleMapper;
import com.globalwebsite.admin.mapper.AdminRolePermissionMapper;
import com.globalwebsite.admin.mapper.AdminStateWiseMapper;
import com.globalwebsite.admin.mapper.AdminViewConsuRefAdminPostSubmissionMapper;
import com.globalwebsite.admin.mapper.CountryMapper;
import com.globalwebsite.admin.mapper.AdminAbroadMapper;
import com.globalwebsite.admin.mapper.AdminCommonViewSubmitMapper;
import com.globalwebsite.admin.mapper.ScrollLinksTableMapper;
import com.globalwebsite.admin.mapper.StateMapper;
import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.AdminOperatorModel;
import com.globalwebsite.admin.model.AdminRolePermissionModel;
import com.globalwebsite.admin.model.CountryModel;
import com.globalwebsite.admin.model.DeleteScrollLink;
import com.globalwebsite.admin.model.EditScrollLink;
import com.globalwebsite.admin.model.StatesModel;
import com.globalwebsite.admin.queries.AdminSqlQueries;
import com.gw.student.model.AdminSubmissionModel;

@Repository
public class AdminDaoInterfaceImpl implements AdminDaoInterface {

private final static Logger logger = Logger.getLogger(AdminDaoInterfaceImpl.class);
	
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	@Value("${admin.viewtype}")
	private String adminViewType;
	
	@Value("${user.viewtype}")
	private String userViewType;
	
	
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
		//System.out.println(sql);
		logger.info("getAllScrollLinkNames:: "+sql);
		List<AddScrollLink> listObj=jdbctemplate.query(sql, new ScrollLinksTableMapper());
		
			return listObj;
		}	
	@Override
		public int updateScrollLink(EditScrollLink editscrolllink) {
		//System.out.println(editscrolllink);
		logger.info(editscrolllink);
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
	/*@Override
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
	}*/
	
	 //Fetch insertStateSubmissionData Auto Generated Key
		public int insertSubmissionData(AdminSubmissionModel stdmodel) {
		    int isinserted=0;
		    try {
			KeyHolder holder = new GeneratedKeyHolder();
			jdbctemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String INSERT_SQL = AdminSqlQueries.insertSubmissionData_Query(stdmodel);
					PreparedStatement ps = connection.prepareStatement(INSERT_SQL,  Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, stdmodel.getLinkname());
					ps.setString(2, stdmodel.getLinkaddress());
					ps.setString(3, stdmodel.getLoggedowner());
					ps.setString(4, stdmodel.getEmailid());
					ps.setString(5, stdmodel.getComments());
					ps.setBoolean(6, stdmodel.isIsactive());
					ps.setString(7, getDateFromSimpleDateFormat());
					ps.setString(8, getDateFromSimpleDateFormat());
					return ps;
				}
			}, holder);

			 isinserted = holder.getKey().intValue();
			//System.out.println("insertSubmissionData: "+isinserted);
			logger.info("insertSubmissionData: "+isinserted);
			}
			 catch (Exception e) {
				//System.out.println("insertSubmissionData: "+e);
				logger.info("insertSubmissionData: "+e);
			}
		    return isinserted;
		}
	/*@Override
	public int insertAbroadSubmissionData(AdminSubmissionModel stdmodel) {
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.insertAbroadSubmissionData_Query(stdmodel);
			isinserted= jdbctemplate.update(sql,new Object[]{stdmodel.getCountryiso(), stdmodel.getLinkname()
					,stdmodel.getLinkaddress(),stdmodel.getLoggedowner(),stdmodel.getEmailid(),
					stdmodel.getFilename(), stdmodel.getComments(),stdmodel.isIsactive(), getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
			System.out.println("insertAbroadSubmissionData: "+sql);
			logger.info("insertAbroadSubmissionData: "+sql);
		} catch (Exception e) {
			System.out.println("insertAbroadSubmissionData: "+e);
			logger.info("insertAbroadSubmissionData: "+e);
		}
		return isinserted;
	}*/
	
	   //Fetch Auto Generated Key
		public int insertAbroadSubmissionData(AdminSubmissionModel stdmodel) {
		    int isinserted=0;
		    try {
			KeyHolder holder = new GeneratedKeyHolder();
			jdbctemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
					String INSERT_SQL = AdminSqlQueries.insertAbroadSubmissionData_Query(stdmodel);
					PreparedStatement ps = connection.prepareStatement(INSERT_SQL,  Statement.RETURN_GENERATED_KEYS);
					ps.setString(1, stdmodel.getCountryiso());
					ps.setString(2, stdmodel.getCountrystate());
					ps.setString(3, stdmodel.getLinkname());
					ps.setString(4, stdmodel.getLinkaddress());
					ps.setString(5, stdmodel.getLoggedowner());
					ps.setString(6, stdmodel.getEmailid());
					ps.setString(7, stdmodel.getFilename());
					ps.setString(8, stdmodel.getComments());
					ps.setBoolean(9, stdmodel.isIsactive());
					ps.setString(10, getDateFromSimpleDateFormat());
					ps.setString(11, getDateFromSimpleDateFormat());
					return ps;
				}
			}, holder);

			 isinserted = holder.getKey().intValue();
			//System.out.println("insertAbroadSubmissionData_Query: "+isinserted);
			logger.info("insertAbroadSubmissionData_Query: "+isinserted);
			}
			 catch (Exception e) {
				//System.out.println("insertAbroadSubmissionData_Query: "+e);
				logger.info("insertAbroadSubmissionData_Query: "+e);
			}
		    return isinserted;
		}
		
		@Override
		public int updateImageFileNameInTable(String tablename, String filename, int rowid){
			 int updatepath = 0;
			try {
				String updatesql ="update "+tablename+" set file_name=? where id=?";
				updatepath = jdbctemplate.update(updatesql, new Object[]{filename, rowid});
			} catch (DataAccessException e) {
				//System.out.println("updateImageFileNameInTable: "+e);
				logger.info("updateImageFileNameInTable: "+e);
			}
			return updatepath;
		}
	
	/*@Override
	public int insertStateSubmissionData(AdminSubmissionModel stdmodel) {
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.insertStateSubmissionData_Query(stdmodel);
			isinserted= jdbctemplate.update(sql,new Object[]{stdmodel.getStateid(), stdmodel.getLinkname()
					,stdmodel.getLinkaddress(),stdmodel.getLoggedowner(),stdmodel.getEmailid(),
					stdmodel.getFilename(), stdmodel.getComments(),stdmodel.isIsactive(), getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
			System.out.println("insertStateSubmissionData: "+sql);
			logger.info("insertStateSubmissionData: "+sql);
		} catch (Exception e) {
			System.out.println("insertStateSubmissionData: "+e);
			logger.info("insertStateSubmissionData: "+e);
		}
		return isinserted;
	}*/
	
	 //Fetch insertStateSubmissionData Auto Generated Key
	public int insertStateSubmissionData(AdminSubmissionModel stdmodel) {
	    int isinserted=0;
	    try {
		KeyHolder holder = new GeneratedKeyHolder();
		jdbctemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				String INSERT_SQL = AdminSqlQueries.insertStateSubmissionData_Query(stdmodel);
				PreparedStatement ps = connection.prepareStatement(INSERT_SQL,  Statement.RETURN_GENERATED_KEYS);
				ps.setInt(1, stdmodel.getStateid());
				ps.setString(2, stdmodel.getLinkname());
				ps.setString(3, stdmodel.getLinkaddress());
				ps.setString(4, stdmodel.getLoggedowner());
				ps.setString(5, stdmodel.getEmailid());
				ps.setString(6, stdmodel.getFilename());
				ps.setString(7, stdmodel.getComments());
				ps.setBoolean(8, stdmodel.isIsactive());
				ps.setString(9, getDateFromSimpleDateFormat());
				ps.setString(10, getDateFromSimpleDateFormat());
				return ps;
			}
		}, holder);

		 isinserted = holder.getKey().intValue();
		//System.out.println("insertStateSubmissionData_Query: "+isinserted);
		logger.info("insertStateSubmissionData_Query: "+isinserted);
		}
		 catch (Exception e) {
			//System.out.println("insertStateSubmissionData_Query: "+e);
			logger.info("insertStateSubmissionData_Query: "+e);
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
		//System.out.println("selectCountForSubmissionData: "+e);
		logger.info("selectCountForSubmissionData: "+e);
	}
      return selectcnt;
	}
	
	/* (non-Javadoc)
	 * @see com.globalwebsite.admin.dao.AdminDaoInterface#selectViewSubmissionData(com.gw.student.model.AdminSubmissionModel)
	 */
	@Override
	public List<AdminSubmissionModel> getAllViewSubmissionData(String tablekey, String prevdate, String currentdate, String viewType){
		String sql=AdminSqlQueries.getAllViewSubmissionData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 23:59:59"}, new AdminCommonViewSubmitMapper());
			logger.info("getAllViewSubmissionData: "+sql);
			
		} catch (Exception e) {
			//System.out.println("getAllViewSubmissionData: "+e);
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
			//System.out.println("getAllRoles: "+e);
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
			//System.out.println("getAllPermissions: "+e);
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
			//System.out.println("getNotAssignedRolePermissions: "+e);
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
			//System.out.println("getAllPermissionsBasedonRoleId: "+e);
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
			//System.out.println("getRoleNameFromId: "+e);
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
			//System.out.println("checkRolePermissionisAvailable: "+e);
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
			//System.out.println("insertRolePermissions: "+e);
			logger.info("insertRolePermissions: "+e);
		}
		return updatecnt;
	}

	@Override
	public List<Map<String, Object>> getPermissionIsAvailable(int roleid, String permissionurl) {
		String sql="select * from role_permission where permission_id="
				+ "(select permission_id from permissions where permission_url='"+permissionurl+"') "
						+ "and role_id='"+roleid+"'";
		//System.out.println("getPermissionIsAvailable: "+sql);
		logger.info("getPermissionIsAvailable: "+sql);
		return jdbctemplate.queryForList(sql);
	}

	/*Job Consultants, Referral and Posted By Administrator Jobs*/
	@Override
	public int adminAddJobConsultantInfo(AdminSubmissionModel stdmodel) {
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.adminAddJobConsultantInfo_Query(stdmodel);
			isinserted= jdbctemplate.update(sql,new Object[]{stdmodel.getJobtitle()
					,stdmodel.getIndustry(), stdmodel.getCompany(), stdmodel.getExperience(),
					stdmodel.getQualification(), stdmodel.getRolecategory(),stdmodel.getSalary(),
					stdmodel.getNoofpossitions(), stdmodel.getJobresponsibilities(),
					stdmodel.getSkillreq(),stdmodel.getEmailid(), stdmodel.getContactnum(), 
					stdmodel.getLocation(), stdmodel.isIsactive(), stdmodel.getLoggedowner(),  
					getDateFromSimpleDateFormat(), stdmodel.getNoticeperiod(), stdmodel.getOtherinfo(), stdmodel.getJobtype()});
			//System.out.println("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+sql);
			logger.info("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+sql);
		} catch (Exception e) {
			//System.out.println("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+e);
			logger.info("adminAddJobConsultantInfo: "+ stdmodel.getTablekey()+": "+e);
		}
	return isinserted;
	}

	/*Job Consultants, Referral and Posted By Administrator Jobs*/
	@Override
	public List<AdminSubmissionModel> getAllViewConsuRefAdminPostSubmissionData(String tablekey, String prevdate, String currentdate) {
		String sql=AdminSqlQueries.getAllViewConsuRefAdminPostSubmissionData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 23:59:59"}, new AdminViewConsuRefAdminPostSubmissionMapper());
			//System.out.println("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
			logger.info("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+sql);
			
		} catch (Exception e) {
			//System.out.println("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+e);
			logger.info("getAllViewConsuRefAdminPostSubmissionData: "+ tablekey+": "+e);
		}
		return listdata;
	}
	
	/*Abroad Jobs*/
	@Override
	public List<AdminSubmissionModel> getAllViewAdminAbroadData(String tablekey, String prevdate, String currentdate) {
		String sql=AdminSqlQueries.getAllViewAdminAbroadData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 23:59:59"}, new AdminAbroadMapper());
			//System.out.println("getAllViewAdminAbroadData: "+ tablekey+": "+sql);
			logger.info("getAllViewAdminAbroadData: "+ tablekey+": "+sql);
			
		} catch (Exception e) {
			//System.out.println("getAllViewAdminAbroadData: "+ tablekey+": "+e);
			logger.info("getAllViewAdminAbroadData: "+ tablekey+": "+e);
		}
		return listdata;
	}
	
	/*State-Wise Jobs*/
	@Override
	public List<AdminSubmissionModel> getAllViewAdminStateWiseData(String tablekey, String prevdate, String currentdate) {
		String sql=AdminSqlQueries.getAllViewAdminStateWiseData_Query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{prevdate+" 00:00:00", currentdate+" 23:59:59"}, new AdminStateWiseMapper());
			//System.out.println("getAllViewAdminStateWiseData: "+ tablekey+": "+sql);
			logger.info("getAllViewAdminStateWiseData: "+ tablekey+": "+sql);
			
		} catch (Exception e) {
			//System.out.println("getAllViewAdminStateWiseData: "+ tablekey+": "+e);
			logger.info("getAllViewAdminStateWiseData: "+ tablekey+": "+e);
		}
		return listdata;
	}


	
	//Fetch Auto Generated Key
	/*public int create(AdminOperatorModel aom) {
		KeyHolder holder = new GeneratedKeyHolder();
		jdbctemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				String INSERT_SQL = null;
				PreparedStatement ps = connection.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS);
				return ps;
			}
		}, holder);

		int newUserId = holder.getKey().intValue();
		return newUserId;
	}*/
	
	@Override
	public int insertOperatorSubmissionData(AdminOperatorModel aom){
		int isinserted=0;
		try {
			String sql=AdminSqlQueries.INSERTOPERATORSUBMISSIONDATA_QUERY;
			isinserted= jdbctemplate.update(sql,new Object[]{ aom.getUsername(), aom.getPassword(), aom.getFullname(),
					aom.getQualification(), aom.getEmpdob(), aom.getEmail(), aom.getPhonenumber(), aom.getJobdescription(),
					aom.getAddress(), aom.getReferrarname(), aom.getCompanyname(), aom.getCompanyurl(), aom.getHrname(),
					aom.getHremail(), aom.getHrphonenumber(), aom.getRoleid(),aom.getCreatedby(), getDateFromSimpleDateFormat(),
					getDateFromSimpleDateFormat(), aom.isStatus()  
					});
			//System.out.println("insertOperatorSubmissionData: "+ aom);
			logger.info("insertOperatorSubmissionData: "+ aom);
		} catch (Exception e) {
			//System.out.println("insertOperatorSubmissionData: "+ aom+": "+e);
			logger.info("insertOperatorSubmissionData: "+ aom+": "+e);
		}
	return isinserted;
	}
	
	@Override
	public List<CountryModel> findAllCountries(){
		String sql=AdminSqlQueries.FINDALLCOUNTRIES_QUERY;
		List<CountryModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new CountryMapper());
			//System.out.println("findAllCountries: "+listdata);
			logger.info("findAllCountries: "+ sql);
			
		} catch (Exception e) {
			//System.out.println("findAllCountries: "+ listdata);
			logger.info("findAllCountries: "+ sql);
		}
		return listdata;
		
	}
	@Override
	public List<StatesModel> findAllStates(){
		String sql=AdminSqlQueries.FINDALLSTATES_QUERY;
		List<StatesModel> listdata = null;
		boolean statestatus=true;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{statestatus}, new StateMapper());
			//System.out.println("findAllStates: "+listdata);
			logger.info("findAllStates: "+ sql);
			
		} catch (Exception e) {
			//System.out.println("findAllStates: "+ listdata);
			logger.info("findAllStates: "+ e);
			logger.info("findAllStates: "+ sql);
		}
		return listdata;
		
	}
	
}

package com.globalwebsite.common.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.globalwebsite.admin.mapper.AdminAbroadMapper;
import com.globalwebsite.admin.mapper.AdminCommonViewSubmitMapper;
import com.globalwebsite.admin.mapper.AdminStateWiseMapper;
import com.globalwebsite.admin.mapper.AdminViewConsuRefAdminPostSubmissionMapper;
import com.globalwebsite.common.mapper.getJobCategoriesMapper;
import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.user.queries.UserSqlQueries;
import com.gw.student.model.AdminSubmissionModel;

@Repository
public class UserDaoInterfaceImpl implements UserDaoInterface {

	private final static Logger logger = Logger.getLogger(UserDaoInterfaceImpl.class);

	@Autowired
	private JdbcTemplate jdbctemplate;
	
	public String getDateFromSimpleDateFormat(){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		return fmt.format(now);
	}

	@Override
	public int getCountForAlreadyExistStudent(StudentLoginModel stud) {
		String sql=UserSqlQueries.GETCOUNTFOREXISTSTUDENT_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{stud.getEmailid()});
	}
	@Override
	public int insertStudentRegistrationDetails(StudentLoginModel stud) {
		String sql=UserSqlQueries.INSERTSTUDENTREGISTRATIONDETAILS_QUERY;
		return jdbctemplate.update(sql,new Object[]{stud.getName(),stud.getMobileno(),stud.getEmailid(),stud.getPassword(),stud.getConfirmpassword(),stud.getQualification(),stud.getPassingyear(),stud.getUploadresume(),stud.getJobcategory(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
	}
	@Override
	public int validateStudentDetails(StudentLoginModel stud) {
		String sql=UserSqlQueries.VALIDATESTUDENTDETAILS_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{stud.getUsername(),stud.getPassword()});
	}
	@Override
	public int validateEmployeeDetails(EmployeeLoginModel empl) {
		String sql=UserSqlQueries.VALIDATEEMPLOYEEDETAILS_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{empl.getEmpemail(),empl.getEmppassword()});
	}
	@Override
	public int getCountForAlreadyExistEmployee(EmployeeLoginModel empl) {
		String sql=UserSqlQueries.GETCOUNTFORALREADYEXISTEMPLOYEE_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{empl.getHremail()});
	}
	@Override
	public int insertEmployeeRegistrationDetails(EmployeeLoginModel empl) {
		String sql=UserSqlQueries.INSERTEMPLOYEEREGISTRATIONDETAILS_QUERY;
		return jdbctemplate.update(sql,new Object[]{empl.getCompanyname(),empl.getHrname(),empl.getHremail(),empl.getPassword(),empl.getHrcontactnumber(),empl.getCompanywebsite(),empl.getJobposition(),empl.getQualification(),empl.getJobdescription(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
	}
	@Override
	public int validateReferalDetails(ReferalLoginModel refl) {
		String sql=UserSqlQueries.VALIDATEREFERALDETAILS_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{refl.getReferalemail(),refl.getPassword()});
	}
	@Override
	public int getCountForAlreadyExistReferal(ReferalLoginModel refl) {
		String sql=UserSqlQueries.GETCOUNTFORALREADYEXISTREFERAL_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{refl.getReferalemail()});
	}
	@Override
	public int insertReferalRegistrationDetails(ReferalLoginModel refl) {
		String sql=UserSqlQueries.INSERTREFERALREGISTRATIONDETAILS_QUERY;
		return jdbctemplate.update(sql,new Object[]{refl.getCompanyname(),refl.getReferalname(),refl.getReferalemail(),refl.getPassword(),refl.getReferalcontactno(),refl.getPositionoffering(),refl.getQualification(),refl.getJobdescription(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
	}
	@Override
	public List<StudentLoginModel> getJobCategoriesDisplay() {
		String sql=UserSqlQueries.GETJOBCATEGORIESTODISPLAY_QUERY;
		return jdbctemplate.query(sql, new getJobCategoriesMapper());
	}
	@Override
	public int getDuplicateJobCategory(StudentLoginModel stud) {
		String sql=UserSqlQueries.GETDUPLICATEJOBCATEGORY_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[] {stud.getJobcategory()});
	}
	@Override
	public int insertOtherJobCategory(StudentLoginModel stud) {
		String sql=UserSqlQueries.INSERTOTHERJOBCATEGORY_QUERY;
		return jdbctemplate.update(sql,new Object[] {stud.getJobcategory()});
	}
	@Override
	public int getmaxjocatid() {
		String sql=UserSqlQueries.GETMAXJOCATID_QUERY;
		return jdbctemplate.queryForInt(sql);
	}

	@Override
	public List<AdminSubmissionModel> getActivePopularJobs(String tablekey, int activenum) {
		String sql=UserSqlQueries.getActivePopularJobs_query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminCommonViewSubmitMapper());
			logger.info("getActivePopularJobs: "+sql);
			
		} catch (Exception e) {
			//System.out.println("getActivePopularJobs: "+e);
			logger.info("getActivePopularJobs: "+e);
		}
		return listdata;
	}
	@Override
	public List<AdminSubmissionModel> getActiveStatewiseJobs(int activenum) {
		String sql=UserSqlQueries.GETACTIVESTATEWISEJOBS_QUERY;
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminStateWiseMapper());
			logger.info("getActiveStatewiseJobs: "+sql);
			
		} catch (Exception e) {
			//System.out.println("getActiveStatewiseJobs: "+e);
			logger.info("getActiveStatewiseJobs: "+e);
		}
		return listdata;
	}
	@Override
	public List<AdminSubmissionModel> getActiveAbroadJobs(int activenum) {
		String sql=UserSqlQueries.GETACTIVEABROADJOBS_QUERY;
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminAbroadMapper());
			logger.info("getActiveAbroadJobs: "+sql);
			
		} catch (Exception e) {
			//System.out.println("getActiveAbroadJobs: "+e);
			logger.info("getActiveAbroadJobs: "+e);
		}
		return listdata;
	}
	@Override
	public List<AdminSubmissionModel> findAllViewJobInfo(int activenum, String tablekey) {
		String sql=UserSqlQueries.findAllViewJobInfo_query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminViewConsuRefAdminPostSubmissionMapper());
			logger.info("findAllViewJobInfo: "+sql);
			
		} catch (Exception e) {
			//System.out.println("findAllViewJobInfo: "+e);
			logger.info("findAllViewJobInfo: "+e);
		}
		return listdata;
	}
	@Override
	public List<AdminSubmissionModel> findSelectedViewJobInfo(int seljobid, String tablekey) {
		String sql=UserSqlQueries.findSelectedViewJobInfo_query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{seljobid},  new AdminViewConsuRefAdminPostSubmissionMapper());
			logger.info("findSelectedViewJobInfo: "+sql);
			
		} catch (Exception e) {
			//System.out.println("findSelectedViewJobInfo: "+e);
			logger.info("findSelectedViewJobInfo: "+e);
		}
		return listdata;
	}
	
}

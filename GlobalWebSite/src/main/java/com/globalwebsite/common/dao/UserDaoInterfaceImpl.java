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
import com.globalwebsite.common.mapper.JobDetailCountMapper;
import com.globalwebsite.common.mapper.StudentLoginMapper;
import com.globalwebsite.common.mapper.getJobCategoriesMapper;
import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.JobDetailCountModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.common.model.UserSuggestionsModel;
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
	public List<AdminSubmissionModel> getCommonSubmissionJobsList(String tablekey, int activenum) {
		String sql=UserSqlQueries.getCommonSubmissionJobsList_query(tablekey);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminCommonViewSubmitMapper());
			logger.info("getCommonSubmissionJobsList: "+sql);
			
		} catch (Exception e) {
			//System.out.println("getActivePopularJobs: "+e);
			logger.info("getCommonSubmissionJobsList: "+e);
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
	@Override
	public List<JobDetailCountModel> getTotalIndustryCount(int activenum, String tablekey) {
		String sql=UserSqlQueries.getTotalIndustryCount_query(tablekey);
		List<JobDetailCountModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new JobDetailCountMapper());
			logger.info("getTotalIndustryCount: "+sql);
			
		} catch (Exception e) {
			logger.info("getTotalIndustryCount: "+"Table Name: "+tablekey+" Exception: "+e);
		}
		return listdata;
	}
	
	@Override
	public int getPopulaJobsCount(int activenum){
		String sql = UserSqlQueries.GETPOPULAJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("getPopulaJobsCount: "+totalcount);
		} catch (Exception e) {
			logger.info("getPopulaJobsCount: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getStatewiseGovtJobsCount(int activenum){
		String sql = UserSqlQueries.GETSTATEWISEGOVTJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETSTATEWISEGOVTJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETSTATEWISEGOVTJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getCentralGovJobsCount(int activenum){
		String sql = UserSqlQueries.GETCENTRALGOVJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETCENTRALGOVJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETCENTRALGOVJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getAbroadJobsCount(int activenum){
		String sql = UserSqlQueries.GETABROADJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETABROADJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETABROADJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getItJobsCount(int activenum){
		String sql = UserSqlQueries.GETITJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETITJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETITJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getNonItJobsCount(int activenum){
		String sql = UserSqlQueries.GETNONITJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETNONITJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETNONITJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getFreeJobsCount(int activenum){
		String sql = UserSqlQueries.GETFREEJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETFREEJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETFREEJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getPlacementJobsCount(int activenum){
		String sql = UserSqlQueries.GETPLACEMENTJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETPLACEMENTJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETPLACEMENTJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getPostedByConsultantsjobscount(int activenum){
		String sql = UserSqlQueries.GETPOSTEDBYCONSULTANTSJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETPOSTEDBYCONSULTANTSJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETPOSTEDBYCONSULTANTSJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getPostedByReferralsJobsCount(int activenum){
		String sql = UserSqlQueries.GETPOSTEDBYREFERRALSJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETPOSTEDBYREFERRALSJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETPOSTEDBYREFERRALSJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getPostedByAdminJobsCount(int activenum){
		String sql = UserSqlQueries.GETPOSTEDBYAADMINJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETPOSTEDBYAADMINJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETPOSTEDBYAADMINJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}
	@Override
	public int getPostedbyEmpJobsCount(int activenum){
		String sql = UserSqlQueries.GETPOSTEDBYEMPJOBSCOUNT_QUERY;
		int totalcount=0;
		try {
			totalcount = jdbctemplate.queryForInt(sql, new Object[]{activenum});
			logger.info("GETPOSTEDBYEMPJOBSCOUNT_QUERY: "+totalcount);
		} catch (Exception e) {
			logger.info("GETPOSTEDBYEMPJOBSCOUNT_QUERY: Exception: "+e);
		}
		
		return totalcount;
	}

	public List<AdminSubmissionModel> fetchJobDetailsByFilter(String tablekey, String wherecond, int activenum) {
		String sql=UserSqlQueries.fetchJobDetailsByFilter_query(tablekey, wherecond);
		List<AdminSubmissionModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{activenum},  new AdminViewConsuRefAdminPostSubmissionMapper());
			logger.info("fetchJobDetailsByFilter: "+sql);
			
		} catch (Exception e) {
			logger.info("fetchJobDetailsByFilter: "+e);
		}
		return listdata;
	}

	public List<StudentLoginModel> findUserIsAvailable(String username, String pwd) {
		String sql = UserSqlQueries.FINDUSERISAVAILABLE_QUERY;
		List<StudentLoginModel> listdata = null;
		try {
			listdata = jdbctemplate.query(sql, new Object[]{username.trim(), pwd.trim()},  new StudentLoginMapper());
			logger.info("findUserIsAvailable: "+sql);
			
		} catch (Exception e) {
			logger.info("findUserIsAvailable: "+e);
		}
		return listdata;
	}

	public int applyUserJob(String username, int userloginid, String tablekey, String jobid) {
		String sql = UserSqlQueries.APPLYUSERJOB_QUERY;
		int stuData = 0;
		try {
			stuData = jdbctemplate.update(sql, new Object[]{username, userloginid,tablekey,jobid,getDateFromSimpleDateFormat()});
			logger.info("applyUserJob: "+sql);
			
		} catch (Exception e) {
			logger.info("applyUserJob: "+e);
		}
		return stuData;
	}
	
	public int insertUserSuggestions(UserSuggestionsModel usm) {
		String sql = UserSqlQueries.INSERTUSERSUGGESTIONS_QUERY;
		int stuData = 0;
		try {
			stuData = jdbctemplate.update(sql, new Object[]{usm.getFristname(), usm.getLastname(),
					  usm.getEmail(),usm.getPhoneno(),usm.getMessage(), getDateFromSimpleDateFormat()});
			logger.info("insertUserSuggestions: "+sql);
			
		} catch (Exception e) {
			logger.info("insertUserSuggestions: "+e);
		}
		return stuData;
	}
	
}

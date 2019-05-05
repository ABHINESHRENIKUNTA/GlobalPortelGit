package com.globalwebsite.common.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.globalwebsite.common.model.EmployeeLoginModel;
import com.globalwebsite.common.model.ReferalLoginModel;
import com.globalwebsite.common.model.StudentLoginModel;
import com.globalwebsite.user.queries.UserSqlQueries;

@Repository
public class UserDaoInterfaceImpl implements UserDaoInterface {

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
		return jdbctemplate.update(sql,new Object[]{stud.getName(),stud.getMobileno(),stud.getEmailid(),stud.getPassword(),stud.getConfirmpassword(),stud.getQualification(),stud.getPassingyear(),stud.getUploadresume(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
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
	
}

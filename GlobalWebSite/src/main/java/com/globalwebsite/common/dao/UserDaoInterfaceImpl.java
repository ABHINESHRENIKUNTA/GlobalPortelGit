package com.globalwebsite.common.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
	
}

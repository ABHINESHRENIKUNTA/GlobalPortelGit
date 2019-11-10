package com.globalwebsite.common.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.common.model.StudentLoginModel;

public class StudentLoginMapper implements RowMapper<StudentLoginModel> {

	@Override
	public StudentLoginModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		StudentLoginModel slm = new StudentLoginModel();
		slm.setUserloginid(rs.getInt("global_student_details_id"));
		slm.setEmailid(rs.getString("email_id"));
		slm.setPassword(rs.getString("password"));
		slm.setName(rs.getString("student_name"));
		return slm;
	}

}

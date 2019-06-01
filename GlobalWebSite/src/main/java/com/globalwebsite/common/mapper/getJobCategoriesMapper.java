package com.globalwebsite.common.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.common.model.StudentLoginModel;

public class getJobCategoriesMapper implements RowMapper<StudentLoginModel> {

	@Override
	public StudentLoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
		StudentLoginModel st=new StudentLoginModel();
		st.setJobcategory(rs.getString("global_job_category"));
		st.setJobcategoryid(rs.getInt("global_job_category_id"));
		
		return st;
	}

}

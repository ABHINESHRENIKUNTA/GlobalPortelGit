package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.gw.student.model.AdminSubmissionModel;

public class AdminViewConsuRefAdminPostSubmissionMapper implements RowMapper<AdminSubmissionModel> {

	@Override
	public AdminSubmissionModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminSubmissionModel asm = new AdminSubmissionModel();
		asm.setRowid(rs.getInt("id"));
		asm.setJobtitle(rs.getString("job_title"));
		asm.setIndustry(rs.getString("industry"));
		asm.setRolecategory(rs.getString("role_category"));
		asm.setSalary(rs.getString("salary"));
		asm.setNoofpossitions(rs.getInt("no_of_positions"));
		asm.setJobresponsibilities(rs.getString("job_responsibilities"));
		asm.setSkillreq(rs.getString("skill_set"));
		asm.setContactinfo(rs.getString("contact_info"));
		asm.setIsactive(rs.getBoolean("status"));
		asm.setAddedby(rs.getString("created_by"));
		asm.setAddeddate(rs.getString("created_date"));
		
		return asm;
	}

}

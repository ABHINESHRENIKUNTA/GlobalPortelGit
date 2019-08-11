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
		asm.setIndustry(rs.getString("industry_name"));
		asm.setCompany(rs.getString("company"));
		asm.setExperience(rs.getString("experience"));
		asm.setQualification(rs.getString("qualification"));
		asm.setRolecategory(rs.getString("role_category"));
		asm.setSalary(rs.getString("salary"));
		asm.setNoofpossitions(rs.getInt("no_of_positions"));
		asm.setJobresponsibilities(rs.getString("job_responsibilities"));
		asm.setSkillreq(rs.getString("skill_set"));
		asm.setContactnum(rs.getString("contact_num"));
		asm.setEmailid(rs.getString("email_id"));
		asm.setLocation(rs.getString("location"));
		asm.setIsactive(rs.getBoolean("status"));
		asm.setAddedby(rs.getString("created_by"));
		asm.setAddeddate(rs.getString("created_date"));
		asm.setModifieddate(rs.getString("modified_date"));
		asm.setNoticeperiod(rs.getString("notice_period"));
		asm.setOtherinfo(rs.getString("other_info"));
		asm.setJobtype(rs.getString("jobtype"));
		return asm;
	}

}

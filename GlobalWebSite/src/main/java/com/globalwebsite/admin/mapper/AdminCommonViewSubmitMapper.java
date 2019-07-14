package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.gw.student.model.AdminSubmissionModel;

public class AdminCommonViewSubmitMapper implements RowMapper<AdminSubmissionModel> {

	@Override
	public AdminSubmissionModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminSubmissionModel asm = new AdminSubmissionModel();
		asm.setRowid(rs.getInt("id"));
		asm.setLinkname(rs.getString("link_name"));
		asm.setLinkaddress(rs.getString("link_address"));
		asm.setEmailid(rs.getString("link_emailId"));
		asm.setComments(rs.getString("link_comments"));
		asm.setFilename(rs.getString("file_name"));
		asm.setIsactive(rs.getBoolean("is_active"));
		asm.setAddedby(rs.getString("link_owner"));
		asm.setAddeddate(rs.getString("created_date"));
		asm.setModifieddate(rs.getString("modified_date"));
		return asm;
	}

}

package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminOperatorModel;

public class AdminOperatorMapper implements RowMapper<AdminOperatorModel> {

	@Override
	public AdminOperatorModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminOperatorModel aom = new AdminOperatorModel();
		aom.setUsername(rs.getString("username"));
		aom.setPassword(rs.getString("password"));
		aom.setFullname(rs.getString("fullname"));
		aom.setQualification(rs.getString("qualification"));
		aom.setEmpdob(rs.getString("empdob"));
		aom.setEmail(rs.getString("email"));
		aom.setPhonenumber(rs.getString("phonenumber"));
		aom.setJobdescription(rs.getString("jobdescription"));
		aom.setAddress(rs.getString("address"));
		aom.setReferrarname(rs.getString("referrarname"));
		aom.setCompanyname(rs.getString("companyname"));
		aom.setCompanyurl(rs.getString("companyurl"));
		aom.setHrname(rs.getString("hrname"));
		aom.setHremail(rs.getString("hremail"));
		aom.setHrphonenumber(rs.getString("hrphonenumber"));
		aom.setRoleid(rs.getInt("roleid"));
		aom.setCreatedby(rs.getString("created_by"));
		aom.setRolename(rs.getString("role_name"));
		aom.setStatus(rs.getBoolean("status"));
		aom.setRowid(rs.getInt("global_login_id"));
		aom.setOrgid(rs.getInt("org_id"));
		return aom;
	}

}

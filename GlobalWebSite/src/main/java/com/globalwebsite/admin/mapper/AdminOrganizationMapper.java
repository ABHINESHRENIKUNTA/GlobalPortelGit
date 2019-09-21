/**
 * 
 */
package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminOrganizationModel;

/**
 * @author PRANEEL VARMA
 *
 */
public class AdminOrganizationMapper implements RowMapper<AdminOrganizationModel> {

	/* (non-Javadoc)
	 * @see org.springframework.jdbc.core.RowMapper#mapRow(java.sql.ResultSet, int)
	 */
	@Override
	public AdminOrganizationModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminOrganizationModel aom = new AdminOrganizationModel();
		aom.setOrgid(rs.getInt("id"));
		aom.setOrgname(rs.getString("org_name"));
		aom.setIsactive(rs.getBoolean("status"));
		return aom;
	}

}

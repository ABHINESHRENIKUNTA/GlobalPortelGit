package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminRolePermissionModel;

public class AdminRoleMapper implements RowMapper<AdminRolePermissionModel> {

	@Override
	public AdminRolePermissionModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminRolePermissionModel arp = new AdminRolePermissionModel();
		arp.setRoleid(rs.getInt("role_id"));
		arp.setRolename(rs.getString("role_name"));
		
		return arp;
	}

}

package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminRolePermissionModel;

public class AdminPermissionMapper implements RowMapper<AdminRolePermissionModel> {

	@Override
	public AdminRolePermissionModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		AdminRolePermissionModel arp = new AdminRolePermissionModel();
		arp.setPermid(rs.getInt("permission_id"));
		arp.setPermname(rs.getString("permission_name"));
		arp.setPermdesc("description");
		arp.setPermurl("permission_url");
		
		return arp;
	}

}

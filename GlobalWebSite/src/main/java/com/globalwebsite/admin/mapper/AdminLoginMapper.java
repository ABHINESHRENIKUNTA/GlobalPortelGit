package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminLoginModel;

public class AdminLoginMapper implements RowMapper<AdminLoginModel> {

	@Override
	public AdminLoginModel mapRow(ResultSet rs, int arg1) throws SQLException {
		AdminLoginModel adm=new AdminLoginModel();
		adm.setUsername(rs.getString("username"));
		adm.setPassword(rs.getString("password"));
		adm.setGlobalid(rs.getInt("global_login_id"));
		adm.setRoleid(rs.getString("roleid"));
		return adm;
	}


}

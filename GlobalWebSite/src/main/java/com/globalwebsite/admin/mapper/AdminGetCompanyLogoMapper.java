package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AdminAddUserImagesModel;

public class AdminGetCompanyLogoMapper implements RowMapper<AdminAddUserImagesModel> {

	@Override
	public AdminAddUserImagesModel mapRow(ResultSet rs, int arg1) throws SQLException {
		AdminAddUserImagesModel adm=new AdminAddUserImagesModel();
		adm.setFilename(rs.getString("file_name"));
		adm.setLinkname(rs.getString("file_link"));
		adm.setTitle(rs.getString("image_title"));
		adm.setImageid(rs.getInt("id"));
		return adm;
	}

}

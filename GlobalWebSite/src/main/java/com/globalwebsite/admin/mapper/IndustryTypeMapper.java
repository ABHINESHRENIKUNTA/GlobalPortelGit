package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.IndustryTypeModel;

public class IndustryTypeMapper implements RowMapper<IndustryTypeModel> {

	@Override
	public IndustryTypeModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		IndustryTypeModel itm = new IndustryTypeModel();
		itm.setId(rs.getInt("id"));
		itm.setIndusryname(rs.getString("industry_name"));
		itm.setStatus(rs.getString("status"));
		
		return itm;
	}

}

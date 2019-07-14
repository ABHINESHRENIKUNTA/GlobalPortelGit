package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.CountryModel;

public class CountryMapper implements RowMapper<CountryModel> {

	@Override
	public CountryModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		CountryModel cm = new CountryModel();
		cm.setId(rs.getInt("id"));
		cm.setIso(rs.getString("iso"));
		cm.setIso3(rs.getString("iso3"));
		cm.setName(rs.getString("name"));
		cm.setNicename(rs.getString("nicename"));
		cm.setNumcode(rs.getInt("numcode"));
		cm.setPhonecode(rs.getInt("phonecode"));
		
		return cm;
	}

}

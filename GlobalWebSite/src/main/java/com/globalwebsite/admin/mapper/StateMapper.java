package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.StatesModel;

public class StateMapper implements RowMapper<StatesModel> {

	@Override
	public StatesModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		StatesModel sm = new StatesModel();
		sm.setId(rs.getInt("id"));
		sm.setStatename(rs.getString("statename"));
		sm.setStatus(rs.getString("status"));
		
		return sm;
	}

}

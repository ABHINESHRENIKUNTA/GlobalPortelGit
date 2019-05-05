package com.globalwebsite.admin.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.admin.model.AddScrollLink;

public class ScrollLinksTableMapper implements RowMapper<AddScrollLink> {
	@Override
	public AddScrollLink mapRow(ResultSet rs, int rowNum) throws SQLException {
	AddScrollLink getAllLinkNames=new AddScrollLink();
	getAllLinkNames.setLinkname(rs.getString("link_name"));
	getAllLinkNames.setLinkaddress(rs.getString("link_address"));
	
		return getAllLinkNames;
	}

}

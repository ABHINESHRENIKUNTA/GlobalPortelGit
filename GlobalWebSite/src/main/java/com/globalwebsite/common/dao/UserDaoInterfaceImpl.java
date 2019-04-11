package com.globalwebsite.common.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoInterfaceImpl implements UserDaoInterface {

	@Autowired
	private JdbcTemplate jdbctemplate;
	
	public String getDateFromSimpleDateFormat(){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		return fmt.format(now);
	}
	
}

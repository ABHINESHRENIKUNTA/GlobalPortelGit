package com.globalwebsite.admin.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.globalwebsite.admin.mapper.AdminLoginMapper;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.queries.AdminSqlQueries;


@Repository
public class AdminDaoInterfaceImpl implements AdminDaoInterface {

private final static Logger logger = Logger.getLogger(AdminDaoInterfaceImpl.class);
	
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	public String getDateFromSimpleDateFormat(){
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		return fmt.format(now);
	}

	@Override
	public List<AdminLoginModel> getAdminLoginDetails(AdminLoginModel lmodel) {
		logger.info("Admin Login Query Executed");
		String sql=AdminSqlQueries.GETADMINLOGINSQL_QUERY;
		return jdbctemplate.query(sql, new Object[]{lmodel.getUsername(),lmodel.getPassword()}, new AdminLoginMapper());
	}
	@Override
	public int updateOTP(String oTP, int gid) {
		String sql=AdminSqlQueries.GETADMINUPDATEDOTP_QUERY;
		return jdbctemplate.update(sql,new Object[]{oTP,gid});
	}
	@Override
	public int getValidateAdminOTP(AdminLoginModel lmodel) {
		String sql=AdminSqlQueries.GETVALIDATEADMINOTP_QUERY;
		return jdbctemplate.queryForInt(sql,new Object[]{lmodel.getUsername(),lmodel.getOtp()});
	}

	
	
}

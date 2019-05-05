package com.globalwebsite.admin.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.globalwebsite.admin.mapper.AdminDeleteUserImageMapper;
import com.globalwebsite.admin.mapper.AdminLoginMapper;
import com.globalwebsite.admin.mapper.ScrollLinksTableMapper;
import com.globalwebsite.admin.model.AddScrollLink;
import com.globalwebsite.admin.model.AdminAddUserImagesModel;
import com.globalwebsite.admin.model.AdminLoginModel;
import com.globalwebsite.admin.model.EditScrollLink;
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
	@Override
	public int uploadAdminUserDahboardImagesData(AdminAddUserImagesModel adm) {
		String sql=AdminSqlQueries.UPLOADDASHBOARDIMAGS_QUERY;
		return jdbctemplate.update(sql,new Object[]{adm.getTitle(),adm.getFilename(),adm.getLinkname(),getDateFromSimpleDateFormat(),getDateFromSimpleDateFormat()});
	}
	@Override
	public List<AdminAddUserImagesModel> getAdminDeleteUserImages() {
		String sql=AdminSqlQueries.GETADMINDELETEUSERIMAGES_QUERY;
		return jdbctemplate.query(sql, new AdminDeleteUserImageMapper());
	}
	@Override
	public int deleteAdminSelectedImage(String admid) {
		String sql=AdminSqlQueries.DELETEADMINSELECTEDIMAGE_QUERY;
		return jdbctemplate.update(sql,new Object[]{admid});
	}

	@Override
		public int createNewScrolllink(AddScrollLink addscroll) {
		String sql=AdminSqlQueries.InsertScrollLink;
		int returnvalue=jdbctemplate.update(sql, addscroll.getLinkname(),addscroll.getLinkaddress(),addscroll.getAddedby(),addscroll.getAddeddate(),addscroll.getComments(),addscroll.getEmailid());
			return returnvalue;
		}
@Override
		public List<AddScrollLink> getAllScrollLinkNames() {
		String sql=AdminSqlQueries.GetAllScrollLinks;
		System.out.println(sql);
		List<AddScrollLink> listObj=jdbctemplate.query(sql, new ScrollLinksTableMapper());
		
			return listObj;
		}	
	@Override
		public int updateScrollLink(EditScrollLink editscrolllink) {
		System.out.println(editscrolllink);
			return 1;
		}
}

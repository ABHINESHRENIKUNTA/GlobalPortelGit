package com.globalwebsite.common.controller;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author PRANEEL VARMA
 *
 */
public class DatabaseTableNames {
	
	/**
	 * @param tablename
	 * @return
	 */
	protected String searchSelectedTableName(String tablename){
		
		switch (tablename) {
		case "student_home_page":
			break;

		default:
			tablename = "Given page is not found in our database! Please contact administrator.";
			break;
		}
		return tablename;
	}
	
	
	/**
	 * @return
	 * @throws Exception
	 */
	protected Map<String, String> tableReferenceData() {
		Map<String,String> tablelist = new LinkedHashMap<String,String>();
		tablelist.put("global_admin_home_page", "Admin DashBoard Page");
		tablelist.put("global_popular_jobsites_page", "Popular Job Sites");
		tablelist.put("global_userdashb_page", "User Home Page");
		return tablelist;
	}

}

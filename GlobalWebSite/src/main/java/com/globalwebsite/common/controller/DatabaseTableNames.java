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
		tablelist.put("global_userdashb_image", "Admin DashBoard Page");
		tablelist.put("student_home_page", "Student Home Page");
		tablelist.put("global_userdashb_images", "User Home Page");
		return tablelist;
	}

}

package com.globalwebsite.common.controller;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author PRANEEL VARMA
 *
 */
public class DatabaseTableNames {
		
	/**
	 * @return
	 * @throws Exception
	 */
	protected Map<String, String> tableReferenceData() {
		Map<String,String> tablelist = new LinkedHashMap<String,String>();
		tablelist.put("global_admin_home_page", "Admin DashBoard Page");
		tablelist.put("global_popular_jobsites_page", "Popular Job Sites");
		tablelist.put("global_statewisegovt_jobs", "State-Wise Govt. Jobs");
		tablelist.put("global_centralgov_jobs", "Central Government Jobs");
		tablelist.put("global_it_jobs", "IT Jobs");
		tablelist.put("global_nonit_jobs", "Non IT Jobs");
		tablelist.put("global_jobconsult_jobs", "Job Consultants");
		tablelist.put("global_refpost_jobs", "Referral PostedJobs");
		tablelist.put("global_postedbyadmin_jobs", "Jobs Posted By Admin");
		tablelist.put("global_trainingandplace_jobs", "Training & Placement Institutions");
		tablelist.put("global_freejobtraining_jobs", "Free Job Training Institutions");
		return tablelist;
	}

}

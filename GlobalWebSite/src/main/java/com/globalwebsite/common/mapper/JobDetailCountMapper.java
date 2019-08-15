package com.globalwebsite.common.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.globalwebsite.common.model.JobDetailCountModel;

public class JobDetailCountMapper implements RowMapper<JobDetailCountModel> {

	@Override
	public JobDetailCountModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		JobDetailCountModel jcm = new JobDetailCountModel();
		jcm.setJobid(rs.getInt("jobid"));
		jcm.setJobname(rs.getString("jobname"));
		jcm.setJobscount(rs.getInt("jobscount"));
		return jcm;
	}

}

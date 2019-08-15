package com.globalwebsite.common.model;

public class JobDetailCountModel {
	
	private int jobid;
	private String jobname;
	private int jobscount;
	
	public int getJobid() {
		return jobid;
	}
	public void setJobid(int jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public int getJobscount() {
		return jobscount;
	}
	public void setJobscount(int jobscount) {
		this.jobscount = jobscount;
	}
	@Override
	public String toString() {
		return "JobDetailCountModel [jobid=" + jobid + ", jobname=" + jobname + ", jobscount=" + jobscount + "]";
	}
	
	

}

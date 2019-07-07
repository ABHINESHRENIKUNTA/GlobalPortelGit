package com.gw.student.model;

import org.hibernate.validator.constraints.NotEmpty;

public class AdminSubmissionModel {
	
	@NotEmpty(message="Author should not be empty")
	private String addedby;
	private String addeddate;
	private int rowid;
	private String modifieddate;
	@NotEmpty(message="Comments should not be empty")
	private String comments;
	@NotEmpty(message="Email should not be empty")
	private String emailid;
	@NotEmpty(message="LinkName should not be empty")
	private String linkname;
	@NotEmpty(message="Url should not be empty")
	private String linkaddress;
	@NotEmpty(message="Image should not be empty")
	private String filename;
	@NotEmpty(message="page should not be empty")
    private String tablename;
	private String tablekey;
    private int totvalintable;
    private String loggedowner;
    private boolean isactive;
    private String jobtitle;
    private String industry;
    private String jobtype;
    private String rolecategory;
    private String salary;
    private int noofpossitions;
    private String jobresponsibilities;
    private String contactinfo;
    private String skillreq;
    private String daterange;
    
    public String getSkillreq() {
		return skillreq;
	}

	public void setSkillreq(String skillreq) {
		this.skillreq = skillreq;
	}

	public void setJobresponsibilities(String jobresponsibilities) {
		this.jobresponsibilities = jobresponsibilities;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getJobtype() {
		return jobtype;
	}

	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	public String getRolecategory() {
		return rolecategory;
	}

	public void setRolecategory(String rolecategory) {
		this.rolecategory = rolecategory;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public int getNoofpossitions() {
		return noofpossitions;
	}

	public void setNoofpossitions(int noofpossitions) {
		this.noofpossitions = noofpossitions;
	}

	public String getJobresponsibilities() {
		return jobresponsibilities;
	}

	public void setJonresponsibilities(String jobresponsibilities) {
		this.jobresponsibilities = jobresponsibilities;
	}

	public String getContactinfo() {
		return contactinfo;
	}

	public void setContactinfo(String contactinfo) {
		this.contactinfo = contactinfo;
	}

	public boolean isIsactive() {
		return isactive;
	}

	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}




	public int getTotvalintable() {
		return totvalintable;
	}

	public void setTotvalintable(int totvalintable) {
		this.totvalintable = totvalintable;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getAddedby() {
		return addedby;
	}

	public void setAddedby(String addedby) {
		this.addedby = addedby;
	}

	public String getAddeddate() {
		return addeddate;
	}

	public void setAddeddate(String addeddate) {
		this.addeddate = addeddate;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getEmailid() {
		return emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getLinkname() {
		return linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public String getLinkaddress() {
		return linkaddress;
	}

	public void setLinkaddress(String linkaddress) {
		this.linkaddress = linkaddress;
	}

	public String getLoggedowner() {
		return loggedowner;
	}

	public void setLoggedowner(String loggedowner) {
		this.loggedowner = loggedowner;
	}

	public int getRowid() {
		return rowid;
	}

	public void setRowid(int rowid) {
		this.rowid = rowid;
	}

	public String getModifieddate() {
		return modifieddate;
	}

	public void setModifieddate(String modifieddate) {
		this.modifieddate = modifieddate;
	}

	public String getTablekey() {
		return tablekey;
	}

	public void setTablekey(String tablekey) {
		this.tablekey = tablekey;
	}

	public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	public String getDaterange() {
		return daterange;
	}

	public void setDaterange(String daterange) {
		this.daterange = daterange;
	}
	

}

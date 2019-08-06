package com.gw.student.model;

import org.hibernate.validator.constraints.NotEmpty;

public class AdminSubmissionModel {
	private static final long serialversionUID =  129348938L; 
	
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
    private String contactnum;
    private String skillreq;
    private String daterange;
    private String countryiso;
    private String countryname;
    private int stateid;
    private String statename;
    private String countrystate;
    private String location;
    private String experience;
    private String company;
    private String qualification;
    private String noticeperiod;
    private String otherinfo;
    
    
    public String getOtherinfo() {
		return otherinfo;
	}

	public void setOtherinfo(String otherinfo) {
		this.otherinfo = otherinfo;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public int getStateid() {
		return stateid;
	}

	public void setStateid(int stateid) {
		this.stateid = stateid;
	}

	public String getStatename() {
		return statename;
	}

	public void setStatename(String statename) {
		this.statename = statename;
	}

	public String getCountryiso() {
		return countryiso;
	}

	public void setCountryiso(String countryiso) {
		this.countryiso = countryiso;
	}

	public String getCountryname() {
		return countryname;
	}

	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}

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

	
	public boolean isIsactive() {
		return isactive;
	}

	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}




	public String getContactnum() {
		return contactnum;
	}

	public void setContactnum(String contactnum) {
		this.contactnum = contactnum;
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

	public String getCountrystate() {
		return countrystate;
	}

	public void setCountrystate(String countrystate) {
		this.countrystate = countrystate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getNoticeperiod() {
		return noticeperiod;
	}

	public void setNoticeperiod(String noticeperiod) {
		this.noticeperiod = noticeperiod;
	}

	@Override
	public String toString() {
		return "AdminSubmissionModel [addedby=" + addedby + ", addeddate=" + addeddate + ", rowid=" + rowid
				+ ", modifieddate=" + modifieddate + ", comments=" + comments + ", emailid=" + emailid + ", linkname="
				+ linkname + ", linkaddress=" + linkaddress + ", filename=" + filename + ", tablename=" + tablename
				+ ", tablekey=" + tablekey + ", totvalintable=" + totvalintable + ", loggedowner=" + loggedowner
				+ ", isactive=" + isactive + ", jobtitle=" + jobtitle + ", industry=" + industry + ", jobtype="
				+ jobtype + ", rolecategory=" + rolecategory + ", salary=" + salary + ", noofpossitions="
				+ noofpossitions + ", jobresponsibilities=" + jobresponsibilities + ", contactnum=" + contactnum
				+ ", skillreq=" + skillreq + ", daterange=" + daterange + ", countryiso=" + countryiso
				+ ", countryname=" + countryname + ", stateid=" + stateid + ", statename=" + statename
				+ ", countrystate=" + countrystate + ", location=" + location + ", experience=" + experience
				+ ", company=" + company + ", qualification=" + qualification + ", noticeperiod=" + noticeperiod
				+ ", otherinfo=" + otherinfo + "]";
	}
	
	

}

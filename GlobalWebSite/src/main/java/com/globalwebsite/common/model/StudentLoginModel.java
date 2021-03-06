package com.globalwebsite.common.model;

public class StudentLoginModel {
	
	private String username;	
	private String name;
	private String mobileno;
	private String emailid;
	private String password;
	private String confirmpassword;
	private String qualification;
	private String passingyear;
	private String uploadresume;
	private int jobcategoryid;
	
	private String jobcategory;
	private String otherjobcategory;
	private int userloginid;
	private String errorcode;
	private String errormsg;
	
	
	
	public int getJobcategoryid() {
		return jobcategoryid;
	}
	public void setJobcategoryid(int jobcategoryid) {
		this.jobcategoryid = jobcategoryid;
	}
	
	public String getOtherjobcategory() {
		return otherjobcategory;
	}
	public void setOtherjobcategory(String otherjobcategory) {
		this.otherjobcategory = otherjobcategory;
	}
	public String getJobcategory() {
		return jobcategory;
	}
	public void setJobcategory(String jobcategory) {
		this.jobcategory = jobcategory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getPassingyear() {
		return passingyear;
	}
	public void setPassingyear(String passingyear) {
		this.passingyear = passingyear;
	}
	public String getUploadresume() {
		return uploadresume;
	}
	public void setUploadresume(String uploadresume) {
		this.uploadresume = uploadresume;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserloginid() {
		return userloginid;
	}
	public void setUserloginid(int userloginid) {
		this.userloginid = userloginid;
	}
	public String getErrorcode() {
		return errorcode;
	}
	public void setErrorcode(String errorcode) {
		this.errorcode = errorcode;
	}
	public String getErrormsg() {
		return errormsg;
	}
	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	

}

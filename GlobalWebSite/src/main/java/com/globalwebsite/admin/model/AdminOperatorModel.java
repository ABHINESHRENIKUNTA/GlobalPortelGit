package com.globalwebsite.admin.model;

public class AdminOperatorModel {
	
	private long roleid;
	private String rolename;
	private String username;
	private String password;
	private String fullname;
	private String qualification;
	private String empdob;
	private String email;
	private String phonenumber;
	private String jobdescription;
	private String address;
	private String referrarname;
	private String companyname;
	private String companyurl;
	private String hrname;
	private String hremail;
	private String hrphonenumber;
	private String comments;
	private String createdby;
	private boolean status;
	private int rowid;


	
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getEmpdob() {
		return empdob;
	}
	public void setEmpdob(String empdob) {
		this.empdob = empdob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getJobdescription() {
		return jobdescription;
	}
	public void setJobdescription(String jobdescription) {
		this.jobdescription = jobdescription;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getReferrarname() {
		return referrarname;
	}
	public void setReferrarname(String referrarname) {
		this.referrarname = referrarname;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getCompanyurl() {
		return companyurl;
	}
	public void setCompanyurl(String companyurl) {
		this.companyurl = companyurl;
	}
	public String getHrname() {
		return hrname;
	}
	public void setHrname(String hrname) {
		this.hrname = hrname;
	}
	public String getHremail() {
		return hremail;
	}
	public void setHremail(String hremail) {
		this.hremail = hremail;
	}
	public String getHrphonenumber() {
		return hrphonenumber;
	}
	public void setHrphonenumber(String hrphonenumber) {
		this.hrphonenumber = hrphonenumber;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	public AdminOperatorModel(long roleid, String rolename, String username, String password, String fullname,
			String qualification, String empdob, String email, String phonenumber, String jobdescription,
			String address, String referrarname, String companyname, String companyurl, String hrname, String hremail,
			String hrphonenumber, String comments, String createdby, boolean status) {
		super();
		this.setRoleid(roleid);
		this.rolename = rolename;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.qualification = qualification;
		this.empdob = empdob;
		this.email = email;
		this.phonenumber = phonenumber;
		this.jobdescription = jobdescription;
		this.address = address;
		this.referrarname = referrarname;
		this.companyname = companyname;
		this.companyurl = companyurl;
		this.hrname = hrname;
		this.hremail = hremail;
		this.hrphonenumber = hrphonenumber;
		this.comments = comments;
		this.createdby = createdby;
		this.status = status;
	}
	public AdminOperatorModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getRoleid() {
		return roleid;
	}
	public void setRoleid(long roleid) {
		this.roleid = roleid;
	}
	public int getRowid() {
		return rowid;
	}
	public void setRowid(int rowid) {
		this.rowid = rowid;
	}
	
	

}

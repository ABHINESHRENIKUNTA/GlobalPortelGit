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
	

}

package com.globalwebsite.admin.model;


import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component 
public class AddScrollLink {
	
	
	
	
	
	@NotEmpty(message="Author should not be empty")
	private String addedby;
	private String addeddate;
	@NotEmpty(message="Comments should not be empty")
	private String comments;
	@NotEmpty(message="Email should not be empty")
	private String emailid;
	@NotEmpty(message="LinkName should not be empty")
	private String linkname;
	@NotEmpty(message="Url should not be empty")
	private String linkaddress;
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
	@Override
	public String toString() {
		return "AddScrollLink [addedby=" + addedby + ", addeddate=" + addeddate + ", comments=" + comments
				+ ", emailid=" + emailid + ", linkname=" + linkname + ", linkaddress=" + linkaddress + "]";
	}
	

}

package com.globalwebsite.admin.model;


import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component 
public class AddScrollLink {
	
	@NotEmpty(message="LinkName should not be empty")
	private String LinkName;
	@NotEmpty(message="Url should not be empty")
	private String LinkAddress;
	@NotEmpty(message="Author should not be empty")
	private String AddedBy;
	private String addedDate;
	@NotEmpty(message="Comments should not be empty")
	private String Comments;
	@NotEmpty(message="Email should not be empty")
	private String EmailID;
	public String getEmailID() {
		return EmailID;
	}
	public void setEmailID(String emailID) {
		EmailID = emailID;
	}
	
	public String getLinkName() {
		return LinkName;
	}
	public void setLinkName(String linkName) {
		LinkName = linkName;
	}
	public String getLinkAddress() {
		return LinkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		LinkAddress = linkAddress;
	}
	public String getAddedBy() {
		return AddedBy;
	}
	public void setAddedBy(String addedBy) {
		AddedBy = addedBy;
	}
	public String getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(String addedDate) {
		this.addedDate = addedDate;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	@Override
	public String toString() {
		return "AddScrollLink [LinkName=" + LinkName + ", LinkAddress=" + LinkAddress + ", AddedBy=" + AddedBy
				+ ", addedDate=" + addedDate + ", Comments=" + Comments + ", EmailID=" + EmailID + "]";
	}
	

}

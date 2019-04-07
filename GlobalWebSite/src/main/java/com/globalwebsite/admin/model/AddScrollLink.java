package com.globalwebsite.admin.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component 
public class AddScrollLink {
	
	private String LinkName;
	private String LinkAddress;
	private String AddedBy;
	private Date addedDate;
	private String Comments;
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
	public Date getAddedDate() {
		return addedDate;
	}
	public void setAddedDate(Date addedDate) {
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
				+ ", addedDate=" + addedDate + ", Comments=" + Comments + "]";
	}
	

}

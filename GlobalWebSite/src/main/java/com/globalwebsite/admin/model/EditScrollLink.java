package com.globalwebsite.admin.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EditScrollLink {
	
	private String LinkTobeModified;
	private Date Modifieddate;
	private String ModifiedLink;
	private String Author;
	private String Comments;
	public String getLinkTobeModified() {
		return LinkTobeModified;
	}
	public void setLinkTobeModified(String linkTobeModified) {
		LinkTobeModified = linkTobeModified;
	}
	public Date getModifieddate() {
		return Modifieddate;
	}
	public void setModifieddate(Date modifieddate) {
		Modifieddate = modifieddate;
	}
	public String getModifiedLink() {
		return ModifiedLink;
	}
	public void setModifiedLink(String modifiedLink) {
		ModifiedLink = modifiedLink;
	}
	public String getAuthor() {
		return Author;
	}
	public void setAuthor(String author) {
		Author = author;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	@Override
	public String toString() {
		return "EditScrollLink [LinkTobeModified=" + LinkTobeModified + ", Modifieddate=" + Modifieddate
				+ ", ModifiedLink=" + ModifiedLink + ", Author=" + Author + ", Comments=" + Comments + "]";
	}
	
	

}

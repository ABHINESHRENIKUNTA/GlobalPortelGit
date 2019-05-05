package com.globalwebsite.admin.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class EditScrollLink {
	
	private String linktobemodified;
	
	private Date modifieddate;
	private String modifiedlink;
	public String getLinktobemodified() {
		return linktobemodified;
	}
	public void setLinktobemodified(String linktobemodified) {
		this.linktobemodified = linktobemodified;
	}
	public Date getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(Date modifieddate) {
		this.modifieddate = modifieddate;
	}
	public String getModifiedlink() {
		return modifiedlink;
	}
	public void setModifiedlink(String modifiedlink) {
		this.modifiedlink = modifiedlink;
	}
	@Override
	public String toString() {
		return "EditScrollLink [linktobemodified=" + linktobemodified + ", modifieddate=" + modifieddate
				+ ", modifiedlink=" + modifiedlink + "]";
	}
	
}

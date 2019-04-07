package com.globalwebsite.admin.model;

import org.springframework.stereotype.Component;

@Component
public class DeleteScrollLink {
	
	private String LinkToBeDeleted;
	private String Link;
	private String DeletedBy;
	private String columns;
	public String getLinkToBeDeleted() {
		return LinkToBeDeleted;
	}
	public void setLinkToBeDeleted(String linkToBeDeleted) {
		LinkToBeDeleted = linkToBeDeleted;
	}
	public String getLink() {
		return Link;
	}
	public void setLink(String link) {
		Link = link;
	}
	public String getDeletedBy() {
		return DeletedBy;
	}
	public void setDeletedBy(String deletedBy) {
		DeletedBy = deletedBy;
	}
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	@Override
	public String toString() {
		return "DeleteScrollLink [LinkToBeDeleted=" + LinkToBeDeleted + ", Link=" + Link + ", DeletedBy=" + DeletedBy
				+ ", columns=" + columns + "]";
	}
	

}

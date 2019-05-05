package com.globalwebsite.admin.model;

import org.springframework.stereotype.Component;

@Component
public class DeleteScrollLink {
	
	private String linktobedeleted;
	private String link;
	private String deletedby;
	private String columns;
	
	public String getColumns() {
		return columns;
	}
	public void setColumns(String columns) {
		this.columns = columns;
	}
	public String getLinktobedeleted() {
		return linktobedeleted;
	}
	public void setLinktobedeleted(String linktobedeleted) {
		this.linktobedeleted = linktobedeleted;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDeletedby() {
		return deletedby;
	}
	public void setDeletedby(String deletedby) {
		this.deletedby = deletedby;
	}
	@Override
	public String toString() {
		return "DeleteScrollLink [linktobedeleted=" + linktobedeleted + ", link=" + link + ", deletedby=" + deletedby
				+ ", columns=" + columns + "]";
	}
	

}

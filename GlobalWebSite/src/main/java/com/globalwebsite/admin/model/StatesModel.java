package com.globalwebsite.admin.model;

public class StatesModel {
	
	private int id;
	private String statename;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStatename() {
		return statename;
	}
	public void setStatename(String statename) {
		this.statename = statename;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "StatesModel [id=" + id + ", statename=" + statename + ", status=" + status + "]";
	}
	

}

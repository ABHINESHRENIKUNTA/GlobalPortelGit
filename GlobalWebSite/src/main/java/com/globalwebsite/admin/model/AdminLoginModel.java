package com.globalwebsite.admin.model;

public class AdminLoginModel {
	
	private String username;
	private String password;
	private String otp;
	private int globalid;
	private String roleid;
	
	
	public int getGlobalid() {
		return globalid;
	}
	public void setGlobalid(int globalid) {
		this.globalid = globalid;
	}
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
	public String getOtp() {
		return otp;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

}

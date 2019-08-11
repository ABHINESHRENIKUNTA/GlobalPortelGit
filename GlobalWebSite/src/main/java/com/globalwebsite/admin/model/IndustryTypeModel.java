/**
 * 
 */
package com.globalwebsite.admin.model;

/**
 * @author PRANEEL VARMA
 *
 */
public class IndustryTypeModel {
	
	private int id;
	private String indusryname;
	private String status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIndusryname() {
		return indusryname;
	}
	public void setIndusryname(String indusryname) {
		this.indusryname = indusryname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "IndustryTypeModel [id=" + id + ", indusryname=" + indusryname + ", status=" + status + "]";
	}
	
	

}

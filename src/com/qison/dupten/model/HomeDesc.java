package com.qison.dupten.model;

public class HomeDesc {
	private long id;
	private String shortDesc;
	private String location;
	private String month;
	private String dayRange;
	public HomeDesc() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HomeDesc(long id,String shortDesc, String location, String month,
			String dayRange) {
		super();
		this.setId(id);
		this.shortDesc = shortDesc;
		this.location = location;
		this.month = month;
		this.dayRange = dayRange;
	}
	public String getShortDesc() {
		return shortDesc;
	}
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDayRange() {
		return dayRange;
	}
	public void setDayRange(String dayRange) {
		this.dayRange = dayRange;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
}

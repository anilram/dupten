package com.ar.dupten.model;

public class TrendingEvents {
	private String title;
	private String location;
	private String date;
	private int numPeople;
	public TrendingEvents(){
		super();
	}
	
	public TrendingEvents(String title, String location, String date,
			int numPeople) {
		super();
		this.title = title;
		this.location = location;
		this.date = date;
		this.numPeople = numPeople;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}
	/**
	 * @param location the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the numPeople
	 */
	public int getNumPeople() {
		return numPeople;
	}
	/**
	 * @param numPeople the numPeople to set
	 */
	public void setNumPeople(int numPeople) {
		this.numPeople = numPeople;
	}
	

}

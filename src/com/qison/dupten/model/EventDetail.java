package com.qison.dupten.model;



import com.google.android.gms.maps.model.LatLng;
public class EventDetail{
	private String month;
	private String dateRange;
	private String shortDesc;
	private Address address;
	private LatLng destLatLng;
	private String Description;
	private Organiser organiser;
	public EventDetail(String month, String dateRange, String shortDesc,
			Address address, LatLng destLatLng, String description,
			Organiser organiser) {
		super();
		this.month = month;
		this.dateRange = dateRange;
		this.shortDesc = shortDesc;
		this.address = address;
		this.destLatLng = destLatLng;
		Description = description;
		this.organiser = organiser;
	}
	/**
	 * @return the month
	 */
	public String getMonth() {
		return month;
	}
	/**
	 * @param month the month to set
	 */
	public void setMonth(String month) {
		this.month = month;
	}
	/**
	 * @return the dateRange
	 */
	public String getDateRange() {
		return dateRange;
	}
	/**
	 * @param dateRange the dateRange to set
	 */
	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}
	/**
	 * @return the shortDesc
	 */
	public String getShortDesc() {
		return shortDesc;
	}
	/**
	 * @param shortDesc the shortDesc to set
	 */
	public void setShortDesc(String shortDesc) {
		this.shortDesc = shortDesc;
	}
	/**
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(Address address) {
		this.address = address;
	}
	/**
	 * @return the destLatLng
	 */
	public LatLng getDestLatLng() {
		return destLatLng;
	}
	/**
	 * @param destLatLng the destLatLng to set
	 */
	public void setDestLatLng(LatLng destLatLng) {
		this.destLatLng = destLatLng;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return Description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		Description = description;
	}
	/**
	 * @return the organiser
	 */
	public Organiser getOrganiser() {
		return organiser;
	}
	/**
	 * @param organiser the organiser to set
	 */
	public void setOrganiser(Organiser organiser) {
		this.organiser = organiser;
	}
	
}

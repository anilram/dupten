package com.ar.dupten.model;

public class NavDrawerItem {
	
	private String title;
	private int icon;
	public NavDrawerItem(){}
	public NavDrawerItem(String titile,int icon){
		this.setTitle(titile);
		this.setIcon(icon);
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getIcon() {
		return icon;
	}
	public void setIcon(int icon) {
		this.icon = icon;
	}
	
}

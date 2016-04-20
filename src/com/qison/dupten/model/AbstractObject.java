package com.qison.dupten.model;

public class AbstractObject implements BaseObject{
	private long id;
	
	@Override
	public long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setId(long id) {
		this.id = id;
		
	}

}

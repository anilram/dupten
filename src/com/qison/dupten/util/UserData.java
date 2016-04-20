package com.qison.dupten.util;
import android.os.Parcel;
import android.os.Parcelable;

public class UserData implements Parcelable {
    private long id;
//    private int age;
    private boolean registered;
    private String phone;    
    private String name;
    private String email;
    private String comapany;
    private String designation;
    private String company;
    private String country;
    private String city;
    private String img;
    

    /**
	 * @return the id
	 */
	public long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * @return the registered
	 */
	public boolean isRegistered() {
		return registered;
	}

	/**
	 * @param registered the registered to set
	 */
	public void setRegistered(boolean registered) {
		this.registered = registered;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the comapany
	 */
	public String getComapany() {
		return comapany;
	}

	/**
	 * @param comapany the comapany to set
	 */
	public void setComapany(String comapany) {
		this.comapany = comapany;
	}

	/**
	 * @return the designation
	 */
	public String getDesignation() {
		return designation;
	}

	/**
	 * @param designation the designation to set
	 */
	public void setDesignation(String designation) {
		this.designation = designation;
	}

	/**
	 * @return the company
	 */
	public String getCompany() {
		return company;
	}

	/**
	 * @param company the company to set
	 */
	public void setCompany(String company) {
		this.company = company;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the creator
	 */
	public static Parcelable.Creator<UserData> getCreator() {
		return CREATOR;
	}

	// No-arg Ctor
    public UserData(){}

    // all getters and setters go here //...

    /** Used to give additional hints on how to process the received parcel.*/
    @Override
    public int describeContents() {
	// ignore for now
	return 0;
    }

    @Override
    public void writeToParcel(Parcel pc, int flags) {
    	pc.writeLong(id);
		pc.writeString(name);
		pc.writeString(email);
		pc.writeString(comapany);
		pc.writeString(designation);
		pc.writeString(company);
		pc.writeString(country);
		pc.writeString(city);
		pc.writeString(phone);
		pc.writeInt( registered ? 1 :0 );
		pc.writeString(img);
   }

   /** Static field used to regenerate object, individually or as arrays */
  public static final Parcelable.Creator<UserData> CREATOR = new Parcelable.Creator<UserData>() {
         public UserData createFromParcel(Parcel pc) {
             return new UserData(pc);
         }
         public UserData[] newArray(int size) {
             return new UserData[size];
         }
   };

   /**Ctor from Parcel, reads back fields IN THE ORDER they were written */
   public UserData(Parcel pc){
		id = pc.readLong();
		name = pc.readString();
		email = pc.readString();
		comapany = pc.readString();
		designation = pc.readString();
		company = pc.readString();
		country = pc.readString();
		city = pc.readString();
		phone = pc.readString();
		registered = (pc.readInt() == 1);
		img = pc.readString();
  }

public String getImg() {
	return img;
}

public void setImg(String img) {
	this.img = img;
}

}

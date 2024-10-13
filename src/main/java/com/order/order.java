package com.order;

public class order {
	
	private int oid;
	private String fullname;
	private String phone;
	private String date;
	private String address;
	private String city;
	private String region;
	private String zip;
	private String country;
	
	public order(int oid, String fullname, String phone, String date, String address, String city, String region,String zip, String country) {
		
		this.oid = oid;
		this.fullname = fullname;
		this.phone = phone;
		this.date = date;
		this.address = address;
		this.city = city;
		this.region = region;
		this.zip = zip;
		this.country = country;
	}
	public int getOid() {
		return oid;
	}
	
	public String getFullname() {
		return fullname;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getDate() {
		return date;
	}

	public String getAddress() {
		return address;
	}
	
	public String getCity() {
		return city;
	}
	
	public String getRegion() {
		return region;
	}
	
	public String getZip() {
		return zip;
	}
	
	public String getCountry() {
		return country;
	}
	
	
	

}

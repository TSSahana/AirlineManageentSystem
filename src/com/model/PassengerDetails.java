package com.model;

public class PassengerDetails {
	private String passengerName;
	private String age;
	private String gender;
	private String aadharNo;
	private String passportNo;
	private String phoneNo;
	private String emailId;
	private String payment;
	private String nationality;
	private int flightId;

	public String getPassengerName() {
		return passengerName;
	}

	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public String getPassportNo() {
		return passportNo;
	}

	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}

	@Override
	public String toString() {
		return "PassengerDetails [passengerName=" + passengerName + ", age=" + age + ", gender=" + gender
				+ ", aadharNo=" + aadharNo + ", passportNo=" + passportNo + ", phoneNo=" + phoneNo + ", emailId="
				+ emailId + ", payment=" + payment + ", nationality=" + nationality + ", flightId=" + flightId + "]";
	}

	public PassengerDetails(String passengerName, String age, String gender, String aadharNo, String passportNo,
			String phoneNo, String emailId, String payment, String nationality, int flightId) {
		super();
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.aadharNo = aadharNo;
		this.passportNo = passportNo;
		this.phoneNo = phoneNo;
		this.emailId = emailId;
		this.payment = payment;
		this.nationality = nationality;
		this.flightId = flightId;
	}

	public PassengerDetails() {
		super();
	}

}

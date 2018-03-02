package com.cqt.entity;

import java.io.Serializable;
import java.util.Date;

public class Employee implements Serializable{
	private static final long serialVersionUID = -6945569271416818600L;

	private Long employeeId;

    private String empNumber;

    private String relName;

    private String idNumber;

    private String timeCard;

    private Boolean sex;

    private Date birth;

    private String nation;

    private String political;

    private Boolean marriage;

    private String nativePlace;

    private String homeAddress;

    private String contacts;
    
    private String contactsPhone;

    private String personalHobby;

    private String phone;

    private String email;

    private String workerType;

    private String post;

    private Boolean status;

    private String remarks;

    private Long schoolId;

	public Long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(Long employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}

	public String getRelName() {
		return relName;
	}

	public void setRelName(String relName) {
		this.relName = relName;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getTimeCard() {
		return timeCard;
	}

	public void setTimeCard(String timeCard) {
		this.timeCard = timeCard;
	}

	public Boolean getSex() {
		return sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPolitical() {
		return political;
	}

	public void setPolitical(String political) {
		this.political = political;
	}

	public Boolean getMarriage() {
		return marriage;
	}

	public void setMarriage(Boolean marriage) {
		this.marriage = marriage;
	}

	public String getNativePlace() {
		return nativePlace;
	}

	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}

	public String getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getContactsPhone() {
		return contactsPhone;
	}

	public void setContactsPhone(String contactsPhone) {
		this.contactsPhone = contactsPhone;
	}

	public String getPersonalHobby() {
		return personalHobby;
	}

	public void setPersonalHobby(String personalHobby) {
		this.personalHobby = personalHobby;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWorkerType() {
		return workerType;
	}

	public void setWorkerType(String workerType) {
		this.workerType = workerType;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Long getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}
   
}
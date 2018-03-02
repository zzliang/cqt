package com.cqt.entity;

import java.io.Serializable;
import java.util.Date;

public class Student implements Serializable{
	private static final long serialVersionUID = 3533358956864716396L;

	private Long studentId;

    private String stuName;

    private String petname;

    private Date birth;

    private Integer wstg;

    private Byte sex;

    private Integer height;

    private String nation;

    private Integer age;

    private String homeAddress;

    private String stuNumber;

    private Long schoolId;

    private Long classId;

    private Integer leftVision;

    private Integer rightVision;

    private String nature;

    private String constitution;

    private String contacts;

    private String contactsPhone;

    private String contactsEmail;

    private String shuttleType;

    private String shuttleSupplement;

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName == null ? null : stuName.trim();
    }

    public String getPetname() {
        return petname;
    }

    public void setPetname(String petname) {
        this.petname = petname == null ? null : petname.trim();
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public Integer getWstg() {
        return wstg;
    }

    public void setWstg(Integer wstg) {
        this.wstg = wstg;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation == null ? null : nation.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getHomeAddress() {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) {
        this.homeAddress = homeAddress == null ? null : homeAddress.trim();
    }

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber == null ? null : stuNumber.trim();
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Integer getLeftVision() {
        return leftVision;
    }

    public void setLeftVision(Integer leftVision) {
        this.leftVision = leftVision;
    }

    public Integer getRightVision() {
        return rightVision;
    }

    public void setRightVision(Integer rightVision) {
        this.rightVision = rightVision;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature == null ? null : nature.trim();
    }

    public String getConstitution() {
        return constitution;
    }

    public void setConstitution(String constitution) {
        this.constitution = constitution == null ? null : constitution.trim();
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getContactsPhone() {
        return contactsPhone;
    }

    public void setContactsPhone(String contactsPhone) {
        this.contactsPhone = contactsPhone == null ? null : contactsPhone.trim();
    }

    public String getContactsEmail() {
        return contactsEmail;
    }

    public void setContactsEmail(String contactsEmail) {
        this.contactsEmail = contactsEmail == null ? null : contactsEmail.trim();
    }

    public String getShuttleType() {
        return shuttleType;
    }

    public void setShuttleType(String shuttleType) {
        this.shuttleType = shuttleType == null ? null : shuttleType.trim();
    }

    public String getShuttleSupplement() {
        return shuttleSupplement;
    }

    public void setShuttleSupplement(String shuttleSupplement) {
        this.shuttleSupplement = shuttleSupplement == null ? null : shuttleSupplement.trim();
    }
}
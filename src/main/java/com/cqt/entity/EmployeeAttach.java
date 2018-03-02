package com.cqt.entity;

import java.io.Serializable;
import java.util.Date;

public class EmployeeAttach implements Serializable{
	private static final long serialVersionUID = 4731526427395712646L;

	private Long employeeAttachId;

    private Long employeeId;

    private String accountAddress;

    private String qualificationCert;

    private String education;

    private String degree;

    private String graduateSchool;

    private String fileAddress;

    private String major;

    private Date graduateTime;

    private Boolean stationLevel;

    private String technicalTitle;

    public Long getEmployeeAttachId() {
        return employeeAttachId;
    }

    public void setEmployeeAttachId(Long employeeAttachId) {
        this.employeeAttachId = employeeAttachId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getAccountAddress() {
        return accountAddress;
    }

    public void setAccountAddress(String accountAddress) {
        this.accountAddress = accountAddress == null ? null : accountAddress.trim();
    }

    public String getQualificationCert() {
        return qualificationCert;
    }

    public void setQualificationCert(String qualificationCert) {
        this.qualificationCert = qualificationCert == null ? null : qualificationCert.trim();
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education == null ? null : education.trim();
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public String getGraduateSchool() {
        return graduateSchool;
    }

    public void setGraduateSchool(String graduateSchool) {
        this.graduateSchool = graduateSchool == null ? null : graduateSchool.trim();
    }

    public String getFileAddress() {
        return fileAddress;
    }

    public void setFileAddress(String fileAddress) {
        this.fileAddress = fileAddress == null ? null : fileAddress.trim();
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major == null ? null : major.trim();
    }

    public Date getGraduateTime() {
        return graduateTime;
    }

    public void setGraduateTime(Date graduateTime) {
        this.graduateTime = graduateTime;
    }

    public Boolean getStationLevel() {
        return stationLevel;
    }

    public void setStationLevel(Boolean stationLevel) {
        this.stationLevel = stationLevel;
    }

    public String getTechnicalTitle() {
        return technicalTitle;
    }

    public void setTechnicalTitle(String technicalTitle) {
        this.technicalTitle = technicalTitle == null ? null : technicalTitle.trim();
    }
}
package com.cqt.entity;

import java.io.Serializable;
import java.util.Date;

public class EmployeeExtend implements Serializable{
	private static final long serialVersionUID = 5658578599275180525L;

	private Long employeeExtendId;

    private Long employeeId;

    private Date internshipStart;

    private Date internshipEnd;

    private Date trialStart;

    private Date trialEnd;

    private Date correctionDate;

    private Date entryDate;

    private Date postsDate;

    private Date titleDate;

    private Date contractStart;

    private Date contractEnd;

    private Date leaveDate;

    private String leaveType;

    private String leaveReasons;

    public Long getEmployeeExtendId() {
        return employeeExtendId;
    }

    public void setEmployeeExtendId(Long employeeExtendId) {
        this.employeeExtendId = employeeExtendId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Date getInternshipStart() {
        return internshipStart;
    }

    public void setInternshipStart(Date internshipStart) {
        this.internshipStart = internshipStart;
    }

    public Date getInternshipEnd() {
        return internshipEnd;
    }

    public void setInternshipEnd(Date internshipEnd) {
        this.internshipEnd = internshipEnd;
    }

    public Date getTrialStart() {
        return trialStart;
    }

    public void setTrialStart(Date trialStart) {
        this.trialStart = trialStart;
    }

    public Date getTrialEnd() {
        return trialEnd;
    }

    public void setTrialEnd(Date trialEnd) {
        this.trialEnd = trialEnd;
    }

    public Date getCorrectionDate() {
        return correctionDate;
    }

    public void setCorrectionDate(Date correctionDate) {
        this.correctionDate = correctionDate;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getPostsDate() {
        return postsDate;
    }

    public void setPostsDate(Date postsDate) {
        this.postsDate = postsDate;
    }

    public Date getTitleDate() {
        return titleDate;
    }

    public void setTitleDate(Date titleDate) {
        this.titleDate = titleDate;
    }

    public Date getContractStart() {
        return contractStart;
    }

    public void setContractStart(Date contractStart) {
        this.contractStart = contractStart;
    }

    public Date getContractEnd() {
        return contractEnd;
    }

    public void setContractEnd(Date contractEnd) {
        this.contractEnd = contractEnd;
    }

    public Date getLeaveDate() {
        return leaveDate;
    }

    public void setLeaveDate(Date leaveDate) {
        this.leaveDate = leaveDate;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType == null ? null : leaveType.trim();
    }

    public String getLeaveReasons() {
        return leaveReasons;
    }

    public void setLeaveReasons(String leaveReasons) {
        this.leaveReasons = leaveReasons == null ? null : leaveReasons.trim();
    }
}
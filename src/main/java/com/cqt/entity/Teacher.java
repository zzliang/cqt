package com.cqt.entity;

import java.io.Serializable;

public class Teacher implements Serializable{
	private static final long serialVersionUID = -3169017706923682389L;

	private Long teacherId;

    private Long employeeId;

    private String teacherName;

    private Boolean isHeadmaster;

    private Long schoolId;

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

    public Boolean getIsHeadmaster() {
        return isHeadmaster;
    }

    public void setIsHeadmaster(Boolean isHeadmaster) {
        this.isHeadmaster = isHeadmaster;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }
}
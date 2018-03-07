package com.cqt.entity;

import java.io.Serializable;
import java.util.List;

public class CourseSchedule implements Serializable{
	private static final long serialVersionUID = 998094790843567796L;

	private String courseScheduleId;

    private String title;

    private String eTitle;

    private String className;

    private String courseDate;

    private Long schoolId;

    private Long classesId;
    
    private List<CourseItem> lstCourseItem;
    
    private List<List<CourseItem>> courseRowsAndCols;
    
    private Integer configStatus;

    public String getCourseScheduleId() {
        return courseScheduleId;
    }

    public void setCourseScheduleId(String courseScheduleId) {
        this.courseScheduleId = courseScheduleId == null ? null : courseScheduleId.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String geteTitle() {
        return eTitle;
    }

    public void seteTitle(String eTitle) {
        this.eTitle = eTitle == null ? null : eTitle.trim();
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public String getCourseDate() {
        return courseDate;
    }

    public void setCourseDate(String courseDate) {
        this.courseDate = courseDate == null ? null : courseDate.trim();
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

	public Long getClassesId() {
		return classesId;
	}

	public void setClassesId(Long classesId) {
		this.classesId = classesId;
	}

	public List<CourseItem> getLstCourseItem() {
		return lstCourseItem;
	}

	public void setLstCourseItem(List<CourseItem> lstCourseItem) {
		this.lstCourseItem = lstCourseItem;
	}

	public List<List<CourseItem>> getCourseRowsAndCols() {
		return courseRowsAndCols;
	}

	public void setCourseRowsAndCols(List<List<CourseItem>> courseRowsAndCols) {
		this.courseRowsAndCols = courseRowsAndCols;
	}

	public Integer getConfigStatus() {
		return configStatus;
	}

	public void setConfigStatus(Integer configStatus) {
		this.configStatus = configStatus;
	}
}
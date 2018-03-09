package com.cqt.entity;

import java.io.Serializable;

public class CourseItem implements Serializable{
	private static final long serialVersionUID = 8260428964437654244L;

	private String courseItemId;

    private String courseScheduleId;

    private Integer zIndex;

    private String startTime;

    private String endTime;

    private String courseName;

    private String courseEname;

    private String teacherName;
    
    private String headmaster;
    
    private Integer week;
    
    /*增加班级名称，不对应到数据库表*/
    private String className;

    public String getCourseItemId() {
        return courseItemId;
    }

    public void setCourseItemId(String courseItemId) {
        this.courseItemId = courseItemId == null ? null : courseItemId.trim();
    }

    public String getCourseScheduleId() {
        return courseScheduleId;
    }

    public void setCourseScheduleId(String courseScheduleId) {
        this.courseScheduleId = courseScheduleId == null ? null : courseScheduleId.trim();
    }

    public Integer getzIndex() {
        return zIndex;
    }

    public void setzIndex(Integer zIndex) {
        this.zIndex = zIndex;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public String getCourseEname() {
        return courseEname;
    }

    public void setCourseEname(String courseEname) {
        this.courseEname = courseEname == null ? null : courseEname.trim();
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName == null ? null : teacherName.trim();
    }

	public Integer getWeek() {
		return week;
	}

	public void setWeek(Integer week) {
		this.week = week;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getHeadmaster() {
		return headmaster;
	}

	public void setHeadmaster(String headmaster) {
		this.headmaster = headmaster;
	}
}
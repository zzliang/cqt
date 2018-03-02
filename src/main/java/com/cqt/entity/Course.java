package com.cqt.entity;

import java.io.Serializable;

public class Course implements Serializable{
	private static final long serialVersionUID = -5577763289371866755L;

	private Long courseId;

    private String courseName;

    private CourseGroup courseGroup;
    
    private Long schoolId;

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

	public CourseGroup getCourseGroup() {
		return courseGroup;
	}

	public void setCourseGroup(CourseGroup courseGroup) {
		this.courseGroup = courseGroup;
	}

	public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }
}
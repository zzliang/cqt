package com.cqt.entity;

import java.io.Serializable;

public class CourseGroup implements Serializable{
	private static final long serialVersionUID = 3344561636929342325L;

	private Long courseGroupId;

    private String courseGroupName;
 
    public Long getCourseGroupId() {
		return courseGroupId;
	}

	public void setCourseGroupId(Long courseGroupId) {
		this.courseGroupId = courseGroupId;
	}

	public String getCourseGroupName() {
        return courseGroupName;
    }

    public void setCourseGroupName(String courseGroupName) {
        this.courseGroupName = courseGroupName == null ? null : courseGroupName.trim();
    }
}
package com.cqt.entity;

import java.io.Serializable;
import java.util.Date;

public class CourseConfig implements Serializable{
	private static final long serialVersionUID = -7896670449842684277L;

	private Long courseConfigId;

    private String courseDate;

    private Date startDate;

    private Date endDate;

    private Integer weeks;
    
    private boolean isEdit;
    public Long getCourseConfigId() {
        return courseConfigId;
    }

    public void setCourseConfigId(Long courseConfigId) {
        this.courseConfigId = courseConfigId;
    }

    public String getCourseDate() {
		return courseDate;
	}

	public void setCourseDate(String courseDate) {
		this.courseDate = courseDate;
	}

	public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getWeeks() {
        return weeks;
    }

    public void setWeeks(Integer weeks) {
        this.weeks = weeks;
    }

	public boolean isEdit() {
		return isEdit;
	}

	public void setEdit(boolean isEdit) {
		this.isEdit = isEdit;
	}
}
package com.cqt.entity.util;

public class WeekInfo {
	private String weekDesc;
	private String weekDate;
	
	public WeekInfo() {
	}
	
	public WeekInfo(String weekDesc) {
		super();
		this.weekDesc = weekDesc;
	}

	public String getWeekDesc() {
		return weekDesc;
	}

	public void setWeekDesc(String weekDesc) {
		this.weekDesc = weekDesc;
	}

	public String getWeekDate() {
		return weekDate;
	}

	public void setWeekDate(String weekDate) {
		this.weekDate = weekDate;
	}
}

package com.cqt.entity.util;

import java.util.List;

public class WeekOfMonth {
	private String dateStr;
	private String weekStr;
	private List<WeekInfo> weekInfo;
	
	public String getDateStr() {
		return dateStr;
	}
	public void setDateStr(String dateStr) {
		this.dateStr = dateStr;
	}
	public String getWeekStr() {
		return weekStr;
	}
	public void setWeekStr(String weekStr) {
		this.weekStr = weekStr;
	}
	public List<WeekInfo> getWeekInfo() {
		return weekInfo;
	}
	public void setWeekInfo(List<WeekInfo> weekInfo) {
		this.weekInfo = weekInfo;
	}
}



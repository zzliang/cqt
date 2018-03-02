package com.cqt.entity.system;

import java.io.Serializable;

public class Dictionaries implements Serializable{
	private static final long serialVersionUID = 7939329807222043447L;

	private String zdId;

    private String zdName;

    private String bianma;

    private Integer orderBy;

    private String parentId;

    private Integer jb;

    private String pBm;

    public String getZdId() {
        return zdId;
    }

    public void setZdId(String zdId) {
        this.zdId = zdId == null ? null : zdId.trim();
    }

    public String getZdName() {
        return zdName;
    }

    public void setZdName(String zdName) {
        this.zdName = zdName == null ? null : zdName.trim();
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma == null ? null : bianma.trim();
    }

    public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId == null ? null : parentId.trim();
    }

    public Integer getJb() {
        return jb;
    }

    public void setJb(Integer jb) {
        this.jb = jb;
    }

    public String getpBm() {
        return pBm;
    }

    public void setpBm(String pBm) {
        this.pBm = pBm == null ? null : pBm.trim();
    }
}
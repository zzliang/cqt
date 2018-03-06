package com.cqt.entity.system;

import java.io.Serializable;

public class Identity implements Serializable{
	private static final long serialVersionUID = 7341007853011600444L;

	private Long id;

    private String identityName;

    private String identityCode;

    private String type;

    private String remarks;
    
    private boolean hasIdentity = false;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIdentityName() {
        return identityName;
    }

    public void setIdentityName(String identityName) {
        this.identityName = identityName == null ? null : identityName.trim();
    }

    public String getIdentityCode() {
        return identityCode;
    }

    public void setIdentityCode(String identityCode) {
        this.identityCode = identityCode == null ? null : identityCode.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }

	public boolean isHasIdentity() {
		return hasIdentity;
	}

	public void setHasIdentity(boolean hasIdentity) {
		this.hasIdentity = hasIdentity;
	}
}
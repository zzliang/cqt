package com.cqt.entity.system;

import java.io.Serializable;

/**  
 * <p>Title: Role</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class Role implements Serializable{
	private static final long serialVersionUID = 8146130217381878716L;
	private String roleId;
	private String roleName;
	private String rights;
	private String identityRights;
	private String parentId;
	private int level;
	
	private String parentName;
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRights() {
		return rights;
	}
	public void setRights(String rights) {
		this.rights = rights;
	}
	public String getIdentityRights() {
		return identityRights;
	}
	public void setIdentityRights(String identityRights) {
		this.identityRights = identityRights;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
}

package com.cqt.entity.system;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.cqt.plugin.paging.Page;

/**  
 * <p>Title: User</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class User implements Serializable{
	private static final long serialVersionUID = 3535006208718155730L;
	private String userId;		//用户id
	private String userName;	//用户名
	private String password; 	//密码
	private String userType;	//用户类型:student,workers,system,super
	private String typeId;		//类型ID:studentId,workersId
	private String idNumber;	//身份证号
	private String relName;		//姓名
	private String phone;		//手机号
	private String email;		//邮箱
	private String status;		//状态
	private String loginIp;		//用户登录ip地址
	private String lastLogin;	//最后登录时间
	private String skin;		//皮肤
	private String bz; 			//备注
	private String orgId;		//机构ID
	private String orgBm; 		//机构编码
	private Long schoolId;		//学校ID
	private String orgName; 	//机构编码名称
	private List<Role> roles;	//角色列表
	private Page page;			//分页对象
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getRelName() {
		return relName;
	}
	public void setRelName(String relName) {
		this.relName = relName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String getSkin() {
		return skin;
	}
	public void setSkin(String skin) {
		this.skin = skin;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getOrgBm() {
		return orgBm;
	}
	public void setOrgBm(String orgBm) {
		this.orgBm = orgBm;
	}
	public Long getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
}

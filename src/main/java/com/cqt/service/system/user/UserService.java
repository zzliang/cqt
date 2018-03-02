package com.cqt.service.system.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;

/**  
 * <p>Title: UserService</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Service("userService")
public class UserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/** 通过用户名，密码获取单个用户信息 */
	public User getUserByNameAndPwd(PageData pd)throws Exception{
		return (User)dao.findForObject("UserMapper.getUserByNameAndPwd", pd);
	}
	
	/** 通过用户名，密码获取多个用户信息列表 */
	public List<User> getUserListByNameAndPwd(PageData pd)throws Exception{
		return (List<User>)dao.findForList("UserMapper.getUserListByNameAndPwd", pd);
	}
	
	/** 通过id获取用户对象 */
	public User getUserById(String userId) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserById", userId);
	}
	
	/** 通过id获取带角色信息的用户对象 */
	public User getUserAndRoleById(String userId) throws Exception {
		return (User) dao.findForObject("UserMapper.getUserAndRoleById", userId);
	}
	
	/** 根据输入信息查找用户 */
	public List<User> getUserByPd(PageData pd)throws Exception{
		return (List<User>)dao.findForList("UserMapper.getUserByPd", pd);
	}
	
	/** 根据输入信息查找用户 */
	public boolean isExisUser(PageData pd)throws Exception{
		List<User> userList = (List<User>)dao.findForList("UserMapper.isExisUser", pd);
		if(null != userList && !userList.isEmpty()){
			return true;
		}
		return false;
	}
	//======================================================================================
	
	
	
	
	
	/*
	* 保存用户
	*/
	public void saveU(PageData pd)throws Exception{
		dao.save("UserMapper.saveUser", pd);
	}
	
	/*
	* 保存用户角色关系
	*/
	public void saveUserRoles(PageData pd)throws Exception{
		dao.save("UserMapper.saveUserRoles", pd);
	}
	
	/*
	* 修改用户
	*/
	public void editU(PageData pd)throws Exception{
		dao.update("UserMapper.editU", pd);
	}
	/*
	* 换皮肤
	*/
	public void setSKIN(PageData pd)throws Exception{
		dao.update("UserMapper.setSKIN", pd);
	}
	/*
	* 删除用户
	*/
	public void deleteU(PageData pd)throws Exception{
		dao.delete("UserMapper.deleteUser", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("UserMapper.deleteAllU", USER_IDS);
	}
	
	/*
	* 批量用户与角色的对关系
	*/
	public void deleteUserRoles(String userId)throws Exception{
		dao.delete("UserMapper.deleteUserRoles", userId);
	}
	
	/*
	*用户列表(用户组)
	*/
	public List<User> userListPage(Page page)throws Exception{
		return (List<User>) dao.findForList("UserMapper.userListPage", page);
	}
	
	/*
	*查看分校下的用户列表
	*/
	public List<User> userListPageByOrgId(Page page)throws Exception{
		return (List<User>) dao.findForList("UserMapper.userListPageByOrgId", page);
	}
	
	/*
	*用户列表(全部)
	*/
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.listAllUser", pd);
	}
	
	/*
	*用户列表(供应商用户)
	*/
	public List<PageData> listGPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("UserMapper.userGlistPage", page);
	}
	/*
	* 保存用户IP
	*/
	public void saveIP(PageData pd)throws Exception{
		dao.update("UserMapper.saveIP", pd);
	}
	
	/*
	* 更新lastLogin时间
	* 更新loginIp
	* 更新机构orgId,orgBm,bmName
	*/
	public void updateUserByPd(PageData pd)throws Exception{
		dao.update("UserMapper.updateUserByPd", pd);
	}
	
	
}

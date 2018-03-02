package com.cqt.service.system.role;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.system.Role;
import com.cqt.plugin.paging.PageData;

/**  
 * <p>Title: RoleService</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Service("roleService")
public class RoleService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<Role> listAllERRoles(String PARENT_ID) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listAllERRoles", PARENT_ID);
	}
	
	public List<Role> listSelectRoles(String userId) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listSelectRoles", userId);
	}
	
	public List<Role> listAllRoles() throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listAllRoles", null);
	}
	
	//列出此角色下的所有用户
	public List<PageData> listAllUserByRid(String roleId) throws Exception {
		return (List<PageData>) dao.findForList("RoleMapper.listAllUserByRid", roleId);
	}
	
	/**
	 * 列出此部门的所有下级
	 */
	public List<Role> listAllRolesByLevel(PageData pd) throws Exception {
		return (List<Role>) dao.findForList("RoleMapper.listAllRolesByLevel", pd);
	}
	
	//通过当前登录用的角色id获取管理权限数据
	public PageData findGLbyrid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("RoleMapper.findGLbyrid", pd);
	}
	
	//通过当前登录用的角色id获取用户权限数据
	public PageData findYHbyrid(PageData pd) throws Exception {
		return (PageData) dao.findForObject("RoleMapper.findYHbyrid", pd);
	}
	
	//删除K权限表里对应的数据
	public void deleteKeFuById(String ROLE_ID) throws Exception {
		dao.delete("RoleMapper.deleteKeFuById", ROLE_ID);
	}
	
	//删除G权限表里对应的数据
	public void deleteGById(String ROLE_ID) throws Exception {
		dao.delete("RoleMapper.deleteGById", ROLE_ID);
	}
	
	public void deleteRoleById(String ROLE_ID) throws Exception {
		dao.delete("RoleMapper.deleteRoleById", ROLE_ID);
		
	}

	public Role getRoleById(String roleId) throws Exception {
		return (Role) dao.findForObject("RoleMapper.getRoleById", roleId);
		
	}

	public void updateRoleRights(Role role) throws Exception {
		dao.update("RoleMapper.updateRoleRights", role);
	}
	
	/**
	 * Gc权限
	 */
	public void gysqxc(String msg,PageData pd) throws Exception {
		dao.update("RoleMapper."+msg, pd);
	}
	
	/**
	 * 给全部子职位加菜单权限
	 */
	public void setAllRights(PageData pd) throws Exception {
		dao.update("RoleMapper.setAllRights", pd);
		
	}
	
	/**
	 * 添加
	 */
	public void saveRole(PageData pd) throws Exception {
		dao.findForList("RoleMapper.saveRole", pd);
	}
	
	/**
	 * 保存客服权限
	 */
	public void saveKeFu(PageData pd) throws Exception {
		dao.findForList("RoleMapper.saveKeFu", pd);
	}
	
	/**
	 * 保存G权限
	 */
	public void saveGYSQX(PageData pd) throws Exception {
		dao.findForList("RoleMapper.saveGYSQX", pd);
	}
	
	/**
	 * 通过id查找
	 */
	public PageData findObjectById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("RoleMapper.findObjectById", pd);
	}
	
	/**
	 * 编辑角色
	 */
	public PageData edit(PageData pd) throws Exception {
		return (PageData)dao.findForObject("RoleMapper.edit", pd);
	}
	
	/**
	 * 权限(增删改查)
	 */
	public void updateQx(String msg,PageData pd) throws Exception {
		dao.update("RoleMapper."+msg, pd);
	}
	
	/**
	 * 客服权限
	 */
	public void updateKFQx(String msg,PageData pd) throws Exception {
		dao.update("RoleMapper."+msg, pd);
	}

}

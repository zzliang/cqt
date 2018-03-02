package com.cqt.service.system.menu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.system.Menu;
import com.cqt.plugin.paging.PageData;

/**  
 * <p>Title: MenuService</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Service("menuService")
public class MenuService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/** 获取菜单的嵌套的事个树形结构 */	
	public List<Menu> listAllMenu() throws Exception {
		List<Menu> rl = this.listAllParentMenu();
		for(Menu menu : rl){
			List<Menu> subList = this.listSubMenuByParentId(menu.getMenuId());
			menu.setSubMenus(subList);
		}
		return rl;
	}
	
	
	
	//=================================================================================================================
	public void deleteMenuById(String MENU_ID) throws Exception {
		dao.save("MenuMapper.deleteMenuById", MENU_ID);
	}

	public Menu getMenuById(PageData pd) throws Exception {
		return (Menu) dao.findForObject("MenuMapper.getMenuById", pd);
	}

	//取最大id
	public PageData findMaxId(PageData pd) throws Exception {
		return (PageData) dao.findForObject("MenuMapper.findMaxId", pd);
		
	}
	
	public List<Menu> listAllParentMenu() throws Exception {
		return (List<Menu>) dao.findForList("MenuMapper.listAllParentMenu", null);
		
	}

	public void saveMenu(Menu menu) throws Exception {
		if(menu.getMenuId()!=null && menu.getMenuId() != ""){
			//dao.update("MenuMapper.updateMenu", menu);
			dao.save("MenuMapper.insertMenu", menu);
		}else{
			dao.save("MenuMapper.insertMenu", menu);
		}
	}

	public List<Menu> listSubMenuByParentId(String parentId) throws Exception {
		return (List<Menu>) dao.findForList("MenuMapper.listSubMenuByParentId", parentId);
		
	}
	

	public List<Menu> listAllSubMenu() throws Exception{
		return (List<Menu>) dao.findForList("MenuMapper.listAllSubMenu", null);
		
	}
	
	/**
	 * 编辑
	 */
	public PageData edit(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MenuMapper.updateMenu", pd);
	}
	/**
	 * 保存菜单图标 (顶部菜单)
	 */
	public PageData editicon(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MenuMapper.editicon", pd);
	}
	
	/**
	 * 更新子菜单类型菜单
	 */
	public PageData editType(PageData pd) throws Exception {
		return (PageData)dao.findForObject("MenuMapper.editType", pd);
	}
}

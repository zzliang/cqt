package com.cqt.entity.system;

import java.io.Serializable;
import java.util.List;

/**  
 * <p>Title: Menu</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
public class Menu implements Serializable{
	
	private static final long serialVersionUID = 3122057031308175595L;
	private String menuId;
	private String menuName;
	private String menuUrl;
	private String parentId;
	private String menuOrder;
	private String menuIcon;
	private String menuType;
	private String menuStatus;
	
	private Menu parentMenu;
	private List<Menu> subMenus;
	private boolean hasMenu = false;
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getMenuOrder() {
		return menuOrder;
	}
	public void setMenuOrder(String menuOrder) {
		this.menuOrder = menuOrder;
	}
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public String getMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}
	public Menu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}
	public List<Menu> getSubMenus() {
		return subMenus;
	}
	public void setSubMenus(List<Menu> subMenus) {
		this.subMenus = subMenus;
	}
	public boolean isHasMenu() {
		return hasMenu;
	}
	public void setHasMenu(boolean hasMenu) {
		this.hasMenu = hasMenu;
	}
}

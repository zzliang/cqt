package com.cqt.commons;

import java.util.List;

import org.apache.shiro.session.Session;

import com.cqt.entity.system.Identity;
import com.cqt.entity.system.Menu;
import com.cqt.util.RightsHelper;
import com.cqt.util.Tools;

/**
 * <p>Title: Jurisdiction</p>  
 * <p>Description: 权限处理（管辖权）</p>  
 * @author onetime  
 * @date 2018年1月6日
 */
public class Jurisdiction {

	/**
	 * 访问权限及初始化按钮权限(控制按钮的显示)
	 * @param menuUrl  菜单路径
	 * @return
	 */
	public static boolean hasJurisdiction(String menuUrl){
		//判断是否拥有访问的菜单权限
		/**
		 * 防止用户直接输入没有权限访问的菜单URL地址
		 */
		Session session = SessionContext.getCurSession();
		Boolean b = true;
		List<Menu> menuList = (List)session.getAttribute(Const.SESSION_allmenuList); //获取菜单列表
		
		for(Menu root : menuList){
			for(Menu sub : root.getSubMenus()){
				if(sub.getMenuUrl().split(".do")[0].equals(menuUrl.split(".do")[0])){
					if(!sub.isHasMenu()){
						return false;
					}
				}
			}
		}
		return true;
	}
	
	/**
	 * <p>Title: handlerMenuList</p>  
	 * <p>Description: 使用权限值来初始化菜单的权限</p>  
	 * @param menuList
	 * @param rights
	 * @return
	 */
	public static List<Menu> handlerMenuList(List<Menu> menuList,String rights){
		if(Tools.notEmpty(rights)){
			for(Menu menu : menuList){
				menu.setHasMenu(RightsHelper.testRights(rights, menu.getMenuId()));
				if(menu.isHasMenu()){
					List<Menu> subMenuList = menu.getSubMenus();
					for(Menu sub : subMenuList){
						sub.setHasMenu(RightsHelper.testRights(rights, sub.getMenuId()));
					}
				}
			}
		}
		return menuList;
	}
	
	/**
	 * <p>Title: handlerIdentityList</p>  
	 * <p>Description: 使用权限值来初始化身份的权限</p>  
	 * @param identityList
	 * @param rights
	 * @return
	 */
	public static List<Identity> handlerIdentityList(List<Identity> identityList,String rights){
		if(Tools.notEmpty(rights)){
			for(Identity identity : identityList){
				identity.setHasIdentity(RightsHelper.testRights(rights, identity.getId().intValue()));
			}
		}
		return identityList;
	}
	
}

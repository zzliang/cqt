package com.cqt.util;

import com.cqt.commons.Const;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.role.RoleService;
import com.cqt.service.system.user.UserService;



/**
 * @author Administrator
 * 获取Spring容器中的service bean
 */
public final class ServiceHelper {
	
	public static Object getService(String serviceName){
		//WebApplicationContextUtils.
		return Const.WEB_APP_CONTEXT.getBean(serviceName);
	}
	
	public static UserService getUserService(){
		return (UserService) getService("userService");
	}
	
	public static RoleService getRoleService(){
		return (RoleService) getService("roleService");
	}
	
	public static MenuService getMenuService(){
		return (MenuService) getService("menuService");
	}
}

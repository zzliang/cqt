package com.cqt.commons;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.cqt.entity.system.Menu;
import com.cqt.entity.system.Role;
import com.cqt.entity.system.User;

public class SessionContext {
	/**
	 * <p>Title: getCurSession</p>  
	 * <p>Description: 获取当前Session</p>  
	 * @return session
	 */
	public static Session getCurSession(){
		Subject currentUser = SecurityUtils.getSubject();  
		Session session = currentUser.getSession();
		return session;
	}
	
	/**
	 * <p>Title: getUser</p>  
	 * <p>Description: 获取当前的用户对象</p>  
	 * @return
	 */
	public static User getUser(){
		User user = (User)getCurSession().getAttribute(Const.SESSION_USER);
		return user;
	}
	
	/**
	 * <p>Title: getUserRole</p>  
	 * <p>Description: 获取当前包含角色信息的用户对象</p>  
	 * @return
	 */
	public static User getUserRole(){
		User userRole = (User)getCurSession().getAttribute(Const.SESSION_USERROLE);
		return userRole;
	}
	
	/**
	 * <p>Title: getUserType</p>  
	 * <p>Description: 获取当前用户类型</p>  
	 * @return
	 */
	public static String getUserType(){
		return getUser().getUserType();
	}
	
	/**
	 * <p>Title: getUserMaxRoleLevel</p>  
	 * <p>Description: 获取当前用户的最高角色级别，数值越小级别越大</p>  
	 * @return
	 */
	public static int getUserMaxRoleLevel(){
		User userRole = (User)getCurSession().getAttribute(Const.SESSION_USERROLE);
		int level = 10;
		for(Role role : userRole.getRoles()){
			if(level>role.getLevel()) level=role.getLevel();
		}
		return level;
	}
	
	public static int getUserRoleLevel(){
		User userRole = (User)getCurSession().getAttribute(Const.SESSION_USERROLE);
		int level = userRole.getRoles().get(0).getLevel();
		return level;
	}
	
	/**
	 * <p>Title: getUserRoleRights</p>  
	 * <p>Description: 获取用户中的多个角色的权限叠加权限</p>  
	 * @return
	 */
	public static String getUserSumRights(){
		User userRole = getUserRole();
		BigInteger b = new BigInteger("0");
		if(null != userRole.getRoles()){
			for(Role r : userRole.getRoles()){
				String rights = r.getRights();
				if(null!=rights && !"".equals(rights)){
					b = b.or(new BigInteger(r.getRights()));
				}
			}
		}
		return b.toString();
	}
	
	/**
	 * <p>Title: getUserRoleRight</p>  
	 * <p>Description: 获取用户的角色权限值</p>  
	 * @return
	 */
	public static String getUserRoleRight(){
		return getCurSession().getAttribute(Const.SESSION_ROLE_RIGHTS).toString();
	}
	
	/**
	 * <p>Title: getUserName</p>  
	 * <p>Description: 获取当前用户的名称</p>  
	 * @return
	 */
	public static String getUserName(){
		return getCurSession().getAttribute(Const.SESSION_USERNAME).toString();
	}
	
	/**
	 * <p>Title: getMenuList</p>  
	 * <p>Description: 获取当前用户的有权限访问的菜单列表</p>  
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Menu> getMenuList(){
		return (List<Menu>)getCurSession().getAttribute(Const.SESSION_allmenuList);
	}
	
	/**
	 * <p>Title: isMuserList</p>  
	 * <p>Description: 是否是用户</p>  
	 * @return
	 */
	public static boolean isMuserList(){
		return getMUserList().isEmpty()?false:true;
	}
	
	/**
	 * <p>Title: getMUserList</p>  
	 * <p>Description: 获取多用户列表</p>  
	 * @return
	 */
	public static List<User> getMUserList(){
		Object obj = getCurSession().getAttribute(Const.M_USER_LIST);
		List<User> mUserList = new ArrayList<User>();
		if(null != obj){
			mUserList = (List<User>)obj;
		}
		return mUserList;
	}
	
	
	/**
	 * <p>Title: get</p>  
	 * <p>Description: 从会话中获取数据</p>  
	 * @param key
	 * @return
	 */
	public static Object get(Object key){
		return getCurSession().getAttribute(key);
	}
	
	/**
	 * <p>Title: set</p>  
	 * <p>Description: 保存数据到会话</p>  
	 * @param key
	 * @param value
	 */
	public static void set(Object key,Object value){
		getCurSession().setAttribute(key, value);
	}
	
	/**
	 * <p>Title: remove</p>  
	 * <p>Description: 从会话移出数据</p>  
	 * @param key
	 */
	public static void remove(Object key){
		getCurSession().removeAttribute(key);
	}
	
	/**
	 * <p>Title: logout</p>  
	 * <p>Description: 登出</p>
	 */
	public static void logout(){
		Subject currentUser = SecurityUtils.getSubject(); 
		currentUser.logout();
	}
	
	/**
	 * <p>Title: clearSession</p>  
	 * <p>Description: 会话清理</p>
	 */
	public static void clearSession(){
		SessionContext.remove(Const.SESSION_USER);
		SessionContext.remove(Const.SESSION_USERROLE);
		SessionContext.remove(Const.SESSION_ROLE_RIGHTS);
		SessionContext.remove(Const.SESSION_allmenuList);
		SessionContext.remove(Const.SESSION_menuList);
		SessionContext.remove(Const.SESSION_userpds);
		//SessionContext.remove(Const.SESSION_USERNAME);
		SessionContext.remove("changeMenu");
	}
	
	/**
	 * 计算加密密码
	 */
	public static String getEncryPassword(String userName,String passWord){
		return new SimpleHash("SHA-1", userName, passWord).toString();
	}
}

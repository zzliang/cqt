package com.cqt.controller.system.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.Const;
import com.cqt.commons.Jurisdiction;
import com.cqt.commons.SessionContext;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.Menu;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.role.RoleService;
import com.cqt.service.system.user.UserService;
import com.cqt.util.DateUtil;
import com.cqt.util.Tools;


/**  
 * <p>Title: LoginController</p>  
 * <p>Description: 用户登录处理</p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
public class LoginController extends BaseController {

	@Resource(name="userService")
	private UserService userService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	/**
	 * 访问登录页
	 * @return
	 */
	@RequestMapping(value="/login_toLogin")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 请求登录，验证用户
	 */
	@RequestMapping(value="/login_login" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object login()throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq359291651fh", "").replaceAll("QQ359291651fh", "").split(",fh,");
		
		if(null != KEYDATA && KEYDATA.length == 3){
			String sessionCode = (String)SessionContext.get(Const.SESSION_SECURITY_CODE);		//获取session中的验证码
			
			String code = KEYDATA[2];
			if(null == code || "".equals(code)){
				errInfo = "nullcode"; //验证码为空
			}else{
				String USERNAME = KEYDATA[0];
				String PASSWORD  = KEYDATA[1];
				pd.put("USER_NAME", USERNAME);
				if(Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)){
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();	//密码加密
					pd.put("PASSWORD", passwd);
					User loginUser = null;
					//根据用户名与密码获取用户信息
					List<User> uList = new ArrayList<User>();
					if(Const.DEFAULT_ADMIN.equals(USERNAME)){
						loginUser = userService.getUserByNameAndPwd(pd);
					}else{
						uList = userService.getUserListByNameAndPwd(pd);
						if(!uList.isEmpty()){
							loginUser = uList.get(0);
							if(uList.size()>1){//多用户
								SessionContext.set(Const.M_USER_LIST, uList);
							}
						}
					}
					
					if(loginUser != null){
						//更新用户登录信息
						pd.put("userId",loginUser.getUserId());
						pd.put("lastLogin",DateUtil.getTime().toString());
						pd.put("loginIp", this.getRemortIP());
						userService.updateUserByPd(pd);
						SessionContext.set(Const.SESSION_USER, loginUser);
						SessionContext.remove(Const.SESSION_SECURITY_CODE);
						
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject(); 
					    UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD); 
					    try { 
					        subject.login(token); 
					    } catch (AuthenticationException e) { 
					    	errInfo = "身份验证失败！";
					    }
					}else{
						errInfo = "usererror"; 				//用户名或密码有误
					}
				}else{
					errInfo = "codeerror";				 	//验证码输入有误
				}
				if(Tools.isEmpty(errInfo)){
					errInfo = "success";					//验证成功
				}
			}
		}else{
			errInfo = "error";								//缺少参数
		}
		map.put("result", errInfo);
		return map;
		//return AppUtil.returnObject(new PageData(), map);
	}
	
	/**
	 * 访问系统首页
	 */
	@RequestMapping(value="/main/{changeMenu}")
	public ModelAndView login_index(@PathVariable("changeMenu") String changeMenu,
			@RequestParam(value="userId",required=false,defaultValue="") String userId){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			
			/*切换校区处理*/
			User user = (User)SessionContext.getUser();
			if(null != user && changeMenu.equals(Const.M_USER_LIST)){
				List<User> mUserList = SessionContext.getMUserList(); 	//当前登录账号的所有用户身份
				List<User> _mUserList = new ArrayList<User>();			//当前登录账号的能切换的用户身份（所有身份减去在使用的身份）
				//userId:为当前要切换的用户id.从所有用户身份中获取切换的用户对象并存入当前会话，并将其它用户对象身份存入到多用户列表中
				if(Tools.notEmpty(userId) && null!=mUserList && !mUserList.isEmpty()){
					for(User u : mUserList){
						if(u.getUserId().equals(userId)){
							user = u;
							SessionContext.clearSession();
							SessionContext.set(Const.SESSION_USER, user);
						}else{
							_mUserList.add(u);
						}
					}
					//更新最后登录时间
					pd.put("userId",userId);
					pd.put("lastLogin",DateUtil.getTime().toString());
					pd.put("loginIp", this.getRemortIP());
					userService.updateUserByPd(pd);
				}
				mv.addObject(Const.M_USER_LIST, _mUserList);
			}
			
			
			if (user != null) {
				User userr = (User)SessionContext.getUserRole();
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUserId());
					SessionContext.set(Const.SESSION_USERROLE, user);
				}else{
					user = userr;
				}
				
				String roleRights = SessionContext.getUserSumRights();			//获取用户多角色的权限叠加权限
				SessionContext.set(Const.SESSION_ROLE_RIGHTS, roleRights); 		//将角色权限存入session
				
				String roleIdentity = SessionContext.getUserSumIdentity();		//获取用户多角色的身份叠加
				SessionContext.set(Const.SESSION_ROLE_IDENTITY, roleIdentity); 	//将角色身份存入session
				
				SessionContext.set(Const.SESSION_USERNAME, user.getUserName());	//放入用户名
				
				List<Menu> allmenuList = new ArrayList<Menu>();
				if(null == SessionContext.get(Const.SESSION_allmenuList)){
					allmenuList = menuService.listAllMenu();
					Jurisdiction.handlerMenuList(allmenuList, roleRights);
					SessionContext.set(Const.SESSION_allmenuList, allmenuList);	//菜单权限放入session中
				}else{
					allmenuList = (List<Menu>)SessionContext.get(Const.SESSION_allmenuList);
				}
				
				//切换菜单=====
				List<Menu> menuList = new ArrayList<Menu>();
				if(null == SessionContext.get(Const.SESSION_menuList) || ("yes".equals(changeMenu))){
					List<Menu> menuList1 = new ArrayList<Menu>();
					/*List<Menu> menuList2 = new ArrayList<Menu>();
					List<Menu> menuList3 = new ArrayList<Menu>();*/
					//拆分菜单(0_系统菜单,1_员工菜单,2_学生菜单)
					for(int i=0;i<allmenuList.size();i++){
						/*Menu menu = allmenuList.get(i);
						switch (menu.getMenuType()) {
						case "0":
							menuList1.add(menu);//系统菜单
							break;
						case "1":
							menuList2.add(menu);//员工菜单
							break;
						case "2":
							menuList3.add(menu);//学生菜单
							break;
						default:
							break;
						}*/
						
						Menu menu = allmenuList.get(i);
						menuList1.add(menu);//系统菜单
					}
					
					SessionContext.remove(Const.SESSION_menuList);
					/*if("2".equals(SessionContext.get("changeMenu"))){
						SessionContext.set(Const.SESSION_menuList, menuList2);
						SessionContext.remove("changeMenu");
						SessionContext.set("changeMenu", "2");
						menuList = menuList2;
					}else{*/
						//还未确定是否将不同用户的菜单权限分开显示，目前先整合到一起显示
						SessionContext.set(Const.SESSION_menuList, menuList1);
						SessionContext.remove("changeMenu");
						SessionContext.set("changeMenu", "0");
						menuList = menuList1;
					//}
				}else{
					menuList = (List<Menu>)SessionContext.get(Const.SESSION_menuList);
				}
				//切换菜单=====
				
				//FusionCharts 报表
			 	//String strXML = "<graph caption='前12个月订单销量柱状图' xAxisName='月份' yAxisName='值' decimalPrecision='0' formatNumberScale='0'><set name='2013-05' value='4' color='AFD8F8'/><set name='2013-04' value='0' color='AFD8F8'/><set name='2013-03' value='0' color='AFD8F8'/><set name='2013-02' value='0' color='AFD8F8'/><set name='2013-01' value='0' color='AFD8F8'/><set name='2012-01' value='0' color='AFD8F8'/><set name='2012-11' value='0' color='AFD8F8'/><set name='2012-10' value='0' color='AFD8F8'/><set name='2012-09' value='0' color='AFD8F8'/><set name='2012-08' value='0' color='AFD8F8'/><set name='2012-07' value='0' color='AFD8F8'/><set name='2012-06' value='0' color='AFD8F8'/></graph>" ;
			 	//mv.addObject("strXML", "");
			 	//FusionCharts 报表
			 	
			 	//读取websocket配置
			 	String strWEBSOCKET = Tools.readTxtFile(Const.WEBSOCKET);//读取WEBSOCKET配置
			 	if(null != strWEBSOCKET && !"".equals(strWEBSOCKET)){
					String strIW[] = strWEBSOCKET.split(",fh,");
					if(strIW.length == 4){
						pd.put("WIMIP", strIW[0]);
						pd.put("WIMPORT", strIW[1]);
						pd.put("OLIP", strIW[2]);
						pd.put("OLPORT", strIW[3]);
					}
				}
			 	//读取websocket配置
			 	
				mv.setViewName("system/admin/index");
				mv.addObject("user", user);
				mv.addObject("menuList", menuList);
			}else {
				mv.setViewName("system/admin/login");//session失效后跳转登录页面
			}
		} catch(Exception e){
			mv.setViewName("system/admin/login");
			logger.error(e.getMessage(), e);
		}
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/login_default")
	public String defaultPage(){
		return "system/admin/default";
	}
	
	/**
	 * 用户注销
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/logout")
	public ModelAndView logout(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		
		SessionContext.remove(Const.SESSION_USER);
		SessionContext.remove(Const.SESSION_ROLE_RIGHTS);
		SessionContext.remove(Const.SESSION_allmenuList);
		SessionContext.remove(Const.SESSION_menuList);
		SessionContext.remove(Const.SESSION_QX);
		SessionContext.remove(Const.SESSION_userpds);
		SessionContext.remove(Const.SESSION_USERNAME);
		SessionContext.remove(Const.SESSION_USERROLE);
		SessionContext.remove("changeMenu");
		
		SessionContext.logout();
		
		pd = this.getPageData();
		String  msg = pd.getString("msg");
		pd.put("msg", msg);
		
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("system/admin/login");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 获取登录用户的IP
	 * @throws Exception 
	 */
	public String getRemortIP2() throws Exception {  
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		return ip;
	}
	
	public String getRemortIP() { 
		HttpServletRequest request = this.getRequest();
		String ip = request.getHeader("x-forwarded-for"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("Proxy-Client-IP"); 
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
		} 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); 
		} 
		return ip; 
	}
}

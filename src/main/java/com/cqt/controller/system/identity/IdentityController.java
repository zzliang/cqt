package com.cqt.controller.system.identity;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.controller.base.BaseController;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.dictionaries.DictionariesService;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.role.RoleService;
import com.cqt.service.system.user.UserService;

/**  
 * <p>Title: IdentityController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/identity")
public class IdentityController extends BaseController {
	
	String menuUrl = "user/listIdentity.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	
	/**
	 * 显示身份列表(用户组)
	 */
	@RequestMapping(value="/listIdentity")
	public ModelAndView listIdentity(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String userKey = pd.getString("userKey");	//关键词检索 
		if(null != userKey && !"".equals(userKey)){
			userKey = userKey.trim();
			pd.put("userName", userKey);
		}
		return mv;
	}
	
	

}

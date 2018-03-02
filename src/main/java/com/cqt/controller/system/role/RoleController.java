package com.cqt.controller.system.role;

import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.accept.ServletPathExtensionContentNegotiationStrategy;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.E;
import com.cqt.commons.Jurisdiction;
import com.cqt.commons.SessionContext;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.Menu;
import com.cqt.entity.system.Role;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.role.RoleService;
import com.cqt.util.RightsHelper;
import com.cqt.util.Tools;

import net.sf.json.JSONArray;

/**  
 * <p>Title: RoleController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/role")
public class RoleController extends BaseController {
	
	String menuUrl = "role.do"; //菜单地址(权限用)
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	/**
	 * 列表
	 */
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		String uType = SessionContext.getUserType();
		if(E.USER_TYPES.SUPER.name().toLowerCase().equals(uType)){
			Role role = SessionContext.getUserRole().getRoles().get(0);
			pd.put("level", role.getLevel());
			List<Role> roleList = roleService.listAllRolesByLevel(pd);		//列出此角色的所有下级
			String roleId = role.getRoleId();
			pd.put("roleId", roleId);
			pd.put("userType", uType);
			mv.addObject("pd", pd);
			mv.addObject("roleList", roleList);
			mv.setViewName("system/role/role_list");
		}else{
			mv.addObject("userType", "error");
			mv.setViewName("system/admin/login");
		}
		return mv;
	}
	
	/**
	 * 添加角色
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String uType = SessionContext.getUserType();
			//只允许超级管理员能添加角色，如果其它人员通过URL方式访问进来后直接跳转到登录页
			if(E.USER_TYPES.SUPER.name().toLowerCase().equals(uType)){
				mv.setViewName("system/role/role_add");
			}else{
				mv.setViewName("system/admin/login");
			}
			mv.addObject("pd", pd);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存新增信息
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView add()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String UUID = this.get32UUID();
			pd.put("roleId", UUID);
			pd.put("roleName", pd.getString("roleName"));
			pd.put("parentId", pd.getString("parentId"));//当前角色id为新增角色的父类ID
			pd.put("level", SessionContext.getUserRoleLevel()+1);
			if(Jurisdiction.hasJurisdiction(menuUrl)){
				roleService.saveRole(pd);
				mv.addObject("msg","success");
			}else{
				mv.addObject("msg","failed");
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 请求编辑
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit( String roleId )throws Exception{
		ModelAndView mv = this.getModelAndView();
		try{
			Role role = null;
			String uType = SessionContext.getUserType();
			//只允许超级管理员能添加角色，如果其它人员通过URL方式访问进来后直接跳转到登录页
			if(E.USER_TYPES.SUPER.name().toLowerCase().equals(uType)){
				if(Tools.notEmpty(roleId)){
					role = roleService.getRoleById(roleId);
				}
				mv.setViewName("system/role/role_edit");
			}else{
				mv.setViewName("system/admin/login");
			}
			mv.addObject("pd", role);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 编辑
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(Jurisdiction.hasJurisdiction(menuUrl)){pd = roleService.edit(pd);};
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 请求角色菜单授权页面
	 */
	@RequestMapping(value="/auth")
	public String auth(@RequestParam String roleId,Model model)throws Exception{
		try{
			List<Menu> menuList = menuService.listAllMenu();
			Role role = roleService.getRoleById(roleId);
			String roleRights = role.getRights();
			Jurisdiction.handlerMenuList(menuList, roleRights);
			JSONArray arr = JSONArray.fromObject(menuList);
			String json = arr.toString();
			json = json.replaceAll("menuId", "id").replaceAll("menuName", "name").replaceAll("subMenus", "nodes").replaceAll("hasMenu", "checked");
			model.addAttribute("zTreeNodes", json);
			model.addAttribute("roleId", roleId);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return "system/authorization";
	}
	
	/**
	 * 保存角色菜单权限
	 */
	@RequestMapping(value="/auth/save")
	public void saveAuth(@RequestParam String ROLE_ID,@RequestParam String menuIds,PrintWriter out)throws Exception{
		PageData pd = new PageData();
		try{
			if(Jurisdiction.hasJurisdiction(menuUrl)){
				if(null != menuIds && !"".equals(menuIds.trim())){
					BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
					Role role = roleService.getRoleById(ROLE_ID);
					role.setRights(rights.toString());
					roleService.updateRoleRights(role);
					pd.put("rights",rights.toString());
				}else{
					Role role = new Role();
					role.setRights("");
					role.setRoleId(ROLE_ID);
					roleService.updateRoleRights(role);
					pd.put("rights","");
				}
					
					/*修改了角色菜单权限后，不需要将此角色的子角色的权限修改为此角色权限
					pd.put("roleId", ROLE_ID);
					roleService.setAllRights(pd);*/
			}
			out.write("success");
			out.flush();
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public Object deleteRole(@RequestParam String roleId)throws Exception{
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "";
		try{
			List<Role> roleList_z = roleService.listAllERRoles(roleId);		//列出此部门的所有下级
			if(roleList_z.size() > 0){
				errInfo = "false1";	//此角色存在下级不允许删除
			}else{
				List<PageData> userlist = roleService.listAllUserByRid(roleId);	//查询使用此角色的用户Id
				if(userlist.size() > 0){
					errInfo = "false2";	//此角色有用户使用不允许删除
				}else{
					if(Jurisdiction.hasJurisdiction(menuUrl)){roleService.deleteRoleById(roleId);};
					errInfo = "success";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);
		return map;
	}
}

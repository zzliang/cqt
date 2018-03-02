package com.cqt.controller.system.identity;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.Const;
import com.cqt.commons.E;
import com.cqt.commons.IO;
import com.cqt.commons.Jurisdiction;
import com.cqt.commons.SessionContext;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.Role;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.dictionaries.DictionariesService;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.role.RoleService;
import com.cqt.service.system.user.UserService;
import com.cqt.util.FileDownload;
import com.cqt.util.FileUpload;
import com.cqt.util.GetPinyin;
import com.cqt.util.ObjectExcelRead;
import com.cqt.util.ObjectExcelView;
import com.cqt.util.PathUtil;
import com.cqt.util.Tools;

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

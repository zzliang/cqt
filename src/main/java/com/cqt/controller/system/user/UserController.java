package com.cqt.controller.system.user;

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
import com.cqt.entity.School;
import com.cqt.entity.system.Role;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.school.SchoolService;
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
 * <p>Title: UserController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/user")
public class UserController extends BaseController {
	
	String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="roleService")
	private RoleService roleService;
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@Resource(name="schoolService")
	private SchoolService schoolService;
	
	
	/**
	 * 显示用户列表(用户组)
	 */
	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String userKey = pd.getString("userKey");	//关键词检索 
		if(null != userKey && !"".equals(userKey)){
			userKey = userKey.trim();
			pd.put("userName", userKey);
		}
		
		/** 日期的检索 */
		String lastLoginStart = pd.getString("lastLoginStart");
		String lastLoginEnd = pd.getString("lastLoginEnd");
		if(lastLoginStart != null && !"".equals(lastLoginStart)){
			lastLoginStart = lastLoginStart+" 00:00:00";
			pd.put("lastLoginStart", lastLoginStart);
		}
		if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
			lastLoginEnd = lastLoginEnd+" 00:00:00";
			pd.put("lastLoginEnd", lastLoginEnd);
		} 
		
		String userType = SessionContext.getUserType();
		String orgId = SessionContext.getUser().getOrgId();
		pd.put("userType", userType);
		pd.put("orgId", orgId);
		page.setPd(pd);
		List<User> userList = userService.userListPageByOrgId(page);	//列出用户列表
		
		pd.put("level", SessionContext.getUserRoleLevel());
		List<Role> roleList = roleService.listAllRolesByLevel(pd);
		
		//当前角色ID,系统管理人员
		String curRoleId = SessionContext.getUserRole().getRoles().get(0).getRoleId();
		pd.put("roleId", curRoleId);
		mv.setViewName("system/user/user_list");
		mv.addObject("userList", userList);
		mv.addObject("roleList", roleList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 去新增用户页面
	 */
	@RequestMapping(value="/goAddU")
	public ModelAndView goAddU()throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<School> listSchool = schoolService.listSchool();
		mv.setViewName("system/user/user_edit");
		mv.addObject("listSchool",listSchool);
		mv.addObject("schoolId","");
		mv.addObject("msg", "saveU");
		return mv;
	}
	
	/**
	 * 保存用户
	 */
	@RequestMapping(value="/saveU")
	public ModelAndView saveU(PrintWriter out) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		pd.put("userId", this.get32UUID());	//ID
		pd.put("userType", E.USER_TYPES.SYSTEM.name().toLowerCase());
		String userName = pd.getString("userName");
		String passWord = pd.getString("password");
		pd.put("password", SessionContext.getEncryPassword(userName, passWord));
		
		PageData p1 = new PageData();
		p1.put("userName", userName);
		p1.put("idNumber", pd.getString("idNumber"));
		p1.put("email", pd.getString("email"));
		p1.put("phone", pd.getString("phone"));
		if(!userService.isExisUser(p1)){
			if(Jurisdiction.hasJurisdiction(menuUrl)){//判断新增权限
				userService.saveU(pd);
				mv.addObject("msg","success");
			}else{
				mv.addObject("msg","failed");
			}
		}else{
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 去修改用户页面
	 */
	@RequestMapping(value="/goEditU")
	public ModelAndView goEditU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//顶部修改个人资料
		String fx = pd.getString("fx");
		
		//System.out.println(fx);
		
		if("head".equals(fx)){
			mv.addObject("fx", "head");
		}else{
			mv.addObject("fx", "user");
		}
		
		//String curRoleId = SessionContext.getUserRole().getRoles().get(0).getRoleId();
		//List<Role> roleList = roleService.listAllERRoles(curRoleId);	//列出所有二级角色
		
		String userId = pd.getString("userId");
		User user = null;
		if(Tools.notEmpty(userId)){
			user = userService.getUserById(userId);	//根据ID读取
		}
		
		List<School> listSchool = schoolService.listSchool();
		mv.setViewName("system/user/user_edit");
		mv.addObject("msg", "editU");
		mv.addObject("user", user);
		mv.addObject("schoolId", user.getSchoolId());
		mv.addObject("listSchool", listSchool);
		
		return mv;
	}
	
	/**
	 * 修改用户
	 */
	@RequestMapping(value="/editU")
	public ModelAndView editU() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(pd.getString("password") != null && !"".equals(pd.getString("password"))){
			pd.put("password", new SimpleHash("SHA-1", pd.getString("userName"), pd.getString("password")).toString());
		}
		if(Jurisdiction.hasJurisdiction(menuUrl)){userService.updateUserByPd(pd);}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 判断用户名是否存在
	 */
	@RequestMapping(value="/hasU")
	@ResponseBody
	public Object hasU(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String idNumber = pd.getString("idNumber");
			String userName = pd.getString("userName");
			if(Tools.notEmpty(idNumber) && Tools.notEmpty(userName)){
				List<User> userList = userService.getUserByPd(pd);
				if(null != userList && !userList.isEmpty()){
					errInfo = "error";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return map;
	}
	
	/**
	 * 判断邮箱是否存在
	 */
	@RequestMapping(value="/hasE")
	@ResponseBody
	public Object hasE(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
			String email = pd.getString("email");
			String idNumber = pd.getString("idNumber");
			if(Tools.notEmpty(email) && Tools.notEmpty(idNumber)){
				List<User> userList = userService.getUserByPd(pd);
				if(null != userList && !userList.isEmpty()){
					errInfo = "error";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return map;
	}
	
	/**
	 * 判断身份证号是否存在
	 */
	/*@RequestMapping(value="/hasN")
	@ResponseBody
	public Object hasN(){
		Map<String,String> map = new HashMap<String,String>();
		String errInfo = "success";
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String idNumber = pd.getString("idNumber");
			String userName = pd.getString("userName");
			if(Tools.notEmpty(number) && Tools.notEmpty(userName)){
				List<User> userList = userService.getUserByPd(pd);
				if(null == userList || userList.isEmpty()){
					errInfo = "error";
				}
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		map.put("result", errInfo);				//返回结果
		return AppUtil.returnObject(new PageData(), map);
	}*/
	
	
	/**
	 * 去编辑角色
	 */
	@RequestMapping(value="/goEditRole")
	public ModelAndView goEditRole() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		String userId = pd.getString("userId");
		String roleId = "1";
		List<Role> roleList = roleService.listAllERRoles(roleId);			//列出所有二级角色
		List<Role> selectRoleList = roleService.listSelectRoles(userId);	//根据ID读取
		//mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		mv.addObject("selectRoleList", selectRoleList);
		mv.setViewName("system/user/user_role");
		
		return mv;
	}
	
	/**
	 * 保存角色
	 */
	@RequestMapping(value="/saveUserRole")
	public ModelAndView saveUserRole() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//if(Jurisdiction.hasJurisdiction(menuUrl)){userService.saveRoles(pd);}
		String userId = pd.getString("userId");
		String roleIds = pd.getString("roleIds");
		//删除原来用户的角色
		userService.deleteUserRoles(userId);
		//新增新的角色信息
		PageData pd2 = new PageData();
		pd2.put("userId", userId);
		pd2.put("roleIds", roleIds.split(","));
		userService.saveUserRoles(pd2);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 显示用户列表(tab方式)
	 */
	@RequestMapping(value="/listtabUsers")
	public ModelAndView listtabUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData>	userList = userService.listAllUser(pd);			//列出用户列表
		mv.setViewName("system/user/user_tb_list");
		mv.addObject("userList", userList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value="/deleteU")
	public void deleteU(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			if(Jurisdiction.hasJurisdiction(menuUrl)){
				userService.deleteU(pd);
			}
			System.out.println("====");
			out.write("success");
			out.close();
		} catch(Exception e){
			System.out.println(e.getStackTrace());
			logger.error(e.toString(), e);
		}finally{
			IO.close(out);
		}
		
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAllU")
	@ResponseBody
	public Object deleteAllU() {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String USER_IDS = pd.getString("USER_IDS");
			
			if(null != USER_IDS && !"".equals(USER_IDS)){
				String ArrayUSER_IDS[] = USER_IDS.split(",");
				if(Jurisdiction.hasJurisdiction(menuUrl)){userService.deleteAllU(ArrayUSER_IDS);}
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return map;
	}
	//===================================================================================================
	
	
	
	/*
	 * 导出用户信息到EXCEL
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			if(Jurisdiction.hasJurisdiction(menuUrl)){
				//检索条件===
				String USERNAME = pd.getString("USERNAME");
				if(null != USERNAME && !"".equals(USERNAME)){
					USERNAME = USERNAME.trim();
					pd.put("USERNAME", USERNAME);
				}
				String lastLoginStart = pd.getString("lastLoginStart");
				String lastLoginEnd = pd.getString("lastLoginEnd");
				if(lastLoginStart != null && !"".equals(lastLoginStart)){
					lastLoginStart = lastLoginStart+" 00:00:00";
					pd.put("lastLoginStart", lastLoginStart);
				}
				if(lastLoginEnd != null && !"".equals(lastLoginEnd)){
					lastLoginEnd = lastLoginEnd+" 00:00:00";
					pd.put("lastLoginEnd", lastLoginEnd);
				} 
				//检索条件===
				
				Map<String,Object> dataMap = new HashMap<String,Object>();
				List<String> titles = new ArrayList<String>();
				
				titles.add("用户名"); 		//1
				titles.add("编号");  		//2
				titles.add("姓名");			//3
				titles.add("职位");			//4
				titles.add("手机");			//5
				titles.add("邮箱");			//6
				titles.add("最近登录");		//7
				titles.add("上次登录IP");	//8
				
				dataMap.put("titles", titles);
				
				List<PageData> userList = userService.listAllUser(pd);
				List<PageData> varList = new ArrayList<PageData>();
				for(int i=0;i<userList.size();i++){
					PageData vpd = new PageData();
					vpd.put("var1", userList.get(i).getString("USERNAME"));		//1
					vpd.put("var2", userList.get(i).getString("NUMBER"));		//2
					vpd.put("var3", userList.get(i).getString("NAME"));			//3
					vpd.put("var4", userList.get(i).getString("ROLE_NAME"));	//4
					vpd.put("var5", userList.get(i).getString("PHONE"));		//5
					vpd.put("var6", userList.get(i).getString("EMAIL"));		//6
					vpd.put("var7", userList.get(i).getString("LAST_LOGIN"));	//7
					vpd.put("var8", userList.get(i).getString("IP"));			//8
					varList.add(vpd);
				}
				dataMap.put("varList", varList);
				ObjectExcelView erv = new ObjectExcelView();					//执行excel操作
				mv = new ModelAndView(erv,dataMap);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 打开上传EXCEL页面
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/user/uploadexcel");
		return mv;
	}
	
	/**
	 * 下载模版
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		
		FileDownload.fileDownload(response, PathUtil.getClasspath() + Const.FILEPATHFILE + "Users.xls", "Users.xls");
		
	}
	
	/**
	 * 从EXCEL导入到数据库
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if(!Jurisdiction.hasJurisdiction(menuUrl)){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			
			List<PageData> listPd = (List)ObjectExcelRead.readXlsExcel(filePath, fileName, 2, 0, 0);	//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			
			/*存入数据库操作======================================*/
			pd.put("RIGHTS", "");					//权限
			pd.put("LAST_LOGIN", "");				//最后登录时间
			pd.put("IP", "");						//IP
			pd.put("STATUS", "0");					//状态
			pd.put("SKIN", "default");				//默认皮肤
			
			String curRoleId = SessionContext.getUser().getRoles().get(0).getRoleId();
			List<Role> roleList = roleService.listAllERRoles(curRoleId);	//列出所有二级角色
			
			pd.put("ROLE_ID", roleList.get(0).getRoleId());	//设置角色ID为随便第一个
			/**
			 * var0 :编号
			 * var1 :姓名
			 * var2 :手机
			 * var3 :邮箱
			 * var4 :备注
			 */
			for(int i=0;i<listPd.size();i++){		
				pd.put("USER_ID", this.get32UUID());										//ID
				pd.put("NAME", listPd.get(i).getString("var1"));							//姓名
				
				String USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"));	//根据姓名汉字生成全拼
				pd.put("USERNAME", USERNAME);	
				if(userService.getUserByPd(pd) != null){										//判断用户名是否重复
					USERNAME = GetPinyin.getPingYin(listPd.get(i).getString("var1"))+Tools.getRandomNum();
					pd.put("USERNAME", USERNAME);
				}
				pd.put("BZ", listPd.get(i).getString("var4"));								//备注
				if(Tools.checkEmail(listPd.get(i).getString("var3"))){						//邮箱格式不对就跳过
					pd.put("email", listPd.get(i).getString("var3"));						
					if(userService.getUserByPd(pd) != null){									//邮箱已存在就跳过
						continue;
					}
				}else{
					continue;
				}
				
				pd.put("NUMBER", listPd.get(i).getString("var0"));							//编号已存在就跳过
				pd.put("PHONE", listPd.get(i).getString("var2"));							//手机号
				
				pd.put("password", new SimpleHash("SHA-1", USERNAME, "123").toString());	//默认密码123
				if(userService.getUserByPd(pd) != null){
					continue;
				}
				userService.saveU(pd);
			}
			/*存入数据库操作======================================*/
			
			mv.addObject("msg","success");
		}
		
		mv.setViewName("save_result");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/**
	 * 向上找机构
	 */
	public PageData getOrgTreeUp(String zdId, PageData pd){
		pd=(pd==null)?new PageData():pd;
		try {
			PageData pdps = new PageData();
			pdps.put("ZD_ID", zdId);
			PageData pd1 = dictionariesService.listById(pdps);//第一级节点
			String pid = pd1.getString("PARENT_ID");
			if(null != pd1 && !"0".equals(pid)){
				getOrgTreeUp(pd1.getString("PARENT_ID"),pd1); //当前节点下指定循环次数的子节点
			}
			pd.put("nextNode", pd1);
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		return pd;
	}
	
	/**
	 * 向下找机构
	 */
	public PageData getOrgTreeDown(String zdId, PageData pd){
		pd=(pd==null)?new PageData():pd;
		try {
			PageData pdps = new PageData();
			pdps.put("PARENT_ID", zdId);
			List<PageData> lstPD = dictionariesService.listByPid(pdps);//第一级节点
			if(lstPD != null && !lstPD.isEmpty()){
				for(PageData _pd : lstPD){
					getOrgTreeDown(_pd.getString("ZD_ID"),pd); //当前节点下指定循环次数的子节点
					pd.put(_pd.getString("ZD_ID"), _pd.getString("BIANMA"));
				}
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
		return pd;
	}

}

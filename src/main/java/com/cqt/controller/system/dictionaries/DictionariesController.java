package com.cqt.controller.system.dictionaries;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.Constants;
import com.cqt.commons.E;
import com.cqt.commons.IO;
import com.cqt.commons.SessionContext;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.Dictionaries;
import com.cqt.entity.system.User;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.system.dictionaries.DictionariesService;
import com.cqt.service.system.menu.MenuService;
import com.cqt.service.system.user.UserService;
import com.cqt.util.Tools;

import net.sf.json.JSONArray;

/**  
 * <p>Title: DictionariesController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/dictionaries")
public class DictionariesController extends BaseController {
	
	@Resource(name="menuService")
	private MenuService menuService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	@Resource(name="userService")
	private UserService userService;
	
	/**
	 * 列表
	 */
	List<PageData> szdList;
	@RequestMapping
	public ModelAndView list(Page page)throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String parentId = pd.getString("parentId");
		if(null != parentId && !"".equals(parentId) && !"0".equals(parentId)){
			//返回按钮用
			PageData pdp = new PageData();
			pdp = this.getPageData();
			pdp.put("zdId", parentId);
			pdp = dictionariesService.findById(pdp);
			mv.addObject("pdp", pdp);
			//头部导航
			szdList = new ArrayList<PageData>();
			this.getZDname(parentId);	//逆序
			Collections.reverse(szdList);
		}
		
		String zdName = pd.getString("zdName");		//检索参数
		if(null != zdName && !"".equals(zdName)){
			zdName = zdName.trim();
			pd.put("zdName", zdName);
		}
		page.setPd(pd);				
		List<PageData> varList = dictionariesService.dictListPage(page);
		
		mv.setViewName("system/dictionaries/zd_list");
		mv.addObject("varList", varList);
		mv.addObject("varsList", szdList);
		mv.addObject("pd", pd);
		return mv;
	}
	
	//递归
	public void getZDname(String parentId) {
		logBefore(logger, "递归");
		try {
			PageData pdps = new PageData();
			pdps.put("zdId", parentId);
			pdps = dictionariesService.findById(pdps);
			if(pdps != null){
				szdList.add(pdps);
				String parentIds = pdps.getString("parentId");
				this.getZDname(parentIds);
			}
		} catch (Exception e) {
			logger.error(e.toString(),e);
		}
	}
	
	/**
	 * 保存
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(PrintWriter out) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		PageData pdp = new PageData();
		
		String parentId = pd.getString("parentId");
		pdp.put("zdId", parentId);
		
		if(null == pd.getString("zdId") || "".equals(pd.getString("zdId"))){ //新增机构节点
			if(null != parentId && "0".equals(parentId)){
				pd.put("jb", 1);
				pd.put("pBm", pd.getString("bianma"));
			}else{
				pdp = dictionariesService.findById(pdp);	//查询当前级别节点做为新增节点的父节点
				pd.put("jb", Integer.parseInt(pdp.get("jb").toString()) + 1);
				pd.put("pBm", pdp.getString("bianma") + "_" + pd.getString("bianma"));
			}
			pd.put("zdId", this.get32UUID());	//ID
			dictionariesService.save(pd);
		}else{	//编辑机构节点
			pdp = dictionariesService.findById(pdp);
			if(null != parentId && "0".equals(parentId)){
				pd.put("pBm",  pd.getString("bianma"));
			}else{
				pd.put("pBm", pdp.getString("bianma") + "_" + pd.getString("bianma"));	
			}
			
			dictionariesService.edit(pd);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}
	
	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			String parentId = pd.getString("parentId");
			if(Tools.notEmpty(parentId)){
				mv.setViewName("system/dictionaries/zd_edit");
				mv.addObject("pd", pd);
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		return mv;
	}
	
	
	
	/**
	 * 去编辑页面
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit( String ROLE_ID )throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String zdId = pd.getString("zdId");
		if(Tools.notEmpty(zdId)){
			pd = dictionariesService.findById(pd);
			if(Integer.parseInt(dictionariesService.findCount(pd).get("ZS").toString()) != 0){ //查看是否有下级节点，有下级节点不允许修改编码
				mv.addObject("msg", "no");
			}else{
				mv.addObject("msg", "ok");
			}
		}
		mv.setViewName("system/dictionaries/zd_edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**
	 * 判断编码是否存在
	 */
	@RequestMapping(value="/has")
	public void has(PrintWriter out){
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			
			String bianma = pd.getString("bianma");
			String zdId = pd.getString("zdId");
			if(Tools.notEmpty(bianma) && Tools.notEmpty(zdId)){
				if(dictionariesService.findBmCount(pd) != null){
					out.write("error");
				}else{
					out.write("success");
				}
			}
			out.close();
		} catch(Exception e){
			logger.error(e.toString(), e);
		}finally{
			IO.close(out);
		}
		
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value="/del")
	@ResponseBody
	public Object del(){
		Map<String,String> map = new HashMap<String,String>();
		PageData pd = new PageData();
		String errInfo = "";
		try{
			pd = this.getPageData();
			
			if(Integer.parseInt(dictionariesService.findCount(pd).get("ZS").toString()) != 0){
				errInfo = "false";
			}else{
				dictionariesService.delete(pd);
				errInfo = "success";
			}
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		
		map.put("result", errInfo);
		return map;
	}
}

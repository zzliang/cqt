package com.cqt.controller.classes;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.Classes;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.classes.ClassesService;

@Controller
@RequestMapping(value="/classes")
public class ClassesController extends BaseController{
	
	@Resource
	public ClassesService classesService;
	/**
	 * <p>Title: listClasses</p>  
	 * <p>Description: 查看分校所有班级信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listClasses")
	public ModelAndView listClasses(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		
		pd.put("分校ID", "");
		page.setPd(pd);
		List<Classes> classesList = classesService.listClasses(page);			//列出分校班级列表
		mv.setViewName("classes/classes_list");
		mv.addObject("classesList", classesList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	@RequestMapping(value="/goViewClasses")
	public ModelAndView goViewClasses()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String classesId = pd.getString("classesId");
		Classes classes =classesService.findById(Long.parseLong(classesId));
		mv.addObject("classes", classes);
		mv.setViewName("classes/classes_view");
		return mv;
	}
	
	/**
	 * <p>Title: goAddClasses</p>  
	 * <p>Description: 去新增班级</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddClasses")
	public ModelAndView goAddClasses()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("classes/classes_edit");
		mv.addObject("msg", "addClasses");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addClasses</p>  
	 * <p>Description: 新增加班级</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addClasses")
	public ModelAndView addClasses(Classes Classes)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		classesService.add(Classes);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 去编辑班级信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditClasses")
	public ModelAndView goEditClasses()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long classesId = pd.getLong("classesId");
		Classes classes = classesService.findById(classesId);
		mv.addObject("classes",classes);
		
		mv.setViewName("classes/classes_edit");
		mv.addObject("msg", "editClasses");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 编辑班级信息
	 * @param classes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editClasses")
	public ModelAndView editClasses(Classes classes)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		classesService.updateById(classes);
		//mv.setViewName("redirect:/classes/listClasses");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除班级
	 * @param classes
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteClasses")
	public ModelAndView deleteClasses()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String classesId = pd.getString("classesId");
		if(null!=classesId && !"".equals(classesId)){
			classesService.deleteById(Long.parseLong(classesId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllClasses")
	@ResponseBody
	public Map<String,Object> deleteAllClasses()throws Exception{
		PageData pd = this.getPageData();
		String classesIds = pd.getString("classesIds");
		if(null!=classesIds && classesIds.length()>0){
			String[] ids = classesIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			classesService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

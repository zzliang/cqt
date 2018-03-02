package com.cqt.controller.school;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqt.commons.Constants;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.School;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.school.SchoolService;
import com.cqt.service.system.dictionaries.DictionariesService;

@Controller
@RequestMapping(value="/school")
public class SchoolController extends BaseController{
	
	@Resource
	public SchoolService schoolService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	
	/**
	 * <p>Title: listSchool</p>  
	 * <p>Description: 查看所有分校信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listSchool")
	public ModelAndView listSchool(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		
		pd.put("schoolId", "");
		page.setPd(pd);
		List<School> schoolList = schoolService.listSchool(page);			//列出学校列表
		mv.setViewName("school/school_list");
		mv.addObject("schoolList", schoolList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	@RequestMapping(value="/goViewSchool")
	public ModelAndView goViewSchool()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String schoolId = pd.getString("schoolId");
		School school =schoolService.findById(Long.parseLong(schoolId));
		mv.setViewName("school/school_view");
		mv.addObject("school", school);
		return mv;
	}
	
	/**
	 * <p>Title: goAddU</p>  
	 * <p>Description: 跳转到新增分校页</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddSchool")
	public ModelAndView goAddSchool()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<Map<String,Integer>> sfdmList = dictionariesService.listSfdm(Constants.getCQT_SFDM_BM());
		mv.addObject("sfdmList", sfdmList);
		mv.setViewName("school/school_edit");
		mv.addObject("msg", "addSchool");
		return mv;
	}
	
	/**
	 * <p>Title: addSchool</p>  
	 * <p>Description: 新增加分校</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addSchool")
	public ModelAndView addSchool(School school)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		schoolService.add(school);
		mv.setViewName("redirect:/school/listSchool");
		return mv;
	}
	
	/**
	 * 去编辑学校信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditSchool")
	public ModelAndView goEditSchool()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String schoolId = pd.getString("schoolId");
		School school =schoolService.findById(Long.parseLong(schoolId));
		mv.addObject("school", school);
		List<Map<String,Integer>> sfdmList = dictionariesService.listSfdm(Constants.getCQT_SFDM_BM());
		mv.addObject("sfdmList", sfdmList);
		mv.setViewName("school/school_edit");
		mv.addObject("msg", "editSchool");
		return mv;
	}
	
	@RequestMapping(value="/editSchool")
	public ModelAndView editSchool(School school)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		schoolService.updateById(school);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除学校
	 * @param school
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteSchool")
	public ModelAndView deleteSchool()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String schoolId = pd.getString("schoolId");
		if(null!=schoolId && !"".equals(schoolId)){
			schoolService.deleteById(Long.parseLong(schoolId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllSchool")
	@ResponseBody
	public Map<String,Object> deleteAllSchool()throws Exception{
		PageData pd = this.getPageData();
		String schoolIds = pd.getString("schoolIds");
		if(null!=schoolIds && schoolIds.length()>0){
			String[] ids = schoolIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			schoolService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

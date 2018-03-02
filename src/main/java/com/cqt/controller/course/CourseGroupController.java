package com.cqt.controller.course;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseGroupService;

@Controller
@RequestMapping(value="/course")
public class CourseGroupController extends BaseController{
	
	@Resource
	public CourseGroupService courseGroupService;
	/**
	 * <p>Title: listCourseGroup</p>  
	 * <p>Description: 查看所有课程组列表信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listCourseGroup")
	public ModelAndView listCourseGroup(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		page.setPd(pd);
		List<CourseGroup> courseGroupList = courseGroupService.listCourseGroup(page);			//列出课程
		mv.setViewName("course/courseGroup_list");
		mv.addObject("courseGroupList", courseGroupList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * <p>Title: goAddCourseGroup</p>  
	 * <p>Description: 跳转到新增课程组页</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddCourseGroup")
	public ModelAndView goAddCourseGroup()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("course/courseGroup_edit");
		mv.addObject("msg", "addCourseGroup");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addCourseGroup</p>  
	 * <p>Description: 新增加课程</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addCourseGroup")
	public ModelAndView addCourseGroup(CourseGroup cg, RedirectAttributes attr)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		courseGroupService.add(cg);
		//mv.setViewName("redirect:/course/listCourse");
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/goEditCourseGroup")
	public ModelAndView goEditCourseGroup()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseGroupId = pd.getLong("courseGroupId");
		CourseGroup cg = courseGroupService.findById(courseGroupId);
		mv.addObject("courseGroup", cg);
		mv.setViewName("course/courseGroup_edit");
		mv.addObject("msg", "editCourseGroup");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addCourseGroup</p>  
	 * <p>Description: 编辑课程组</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editCourseGroup")
	public ModelAndView editCourseGroup(CourseGroup courseGroup)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		courseGroupService.updateById(courseGroup);
		//mv.setViewName("redirect:/courseGroup/listCourseGroup");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除课程
	 * @param courseGroup
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteCourseGroup")
	public ModelAndView deleteCourseGroup()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseGroupId = pd.getString("courseGroupId");
		if(null!=courseGroupId && !"".equals(courseGroupId)){
			courseGroupService.deleteById(Long.parseLong(courseGroupId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllCourseGroup")
	@ResponseBody
	public Map<String,Object> deleteAllCourseGroup()throws Exception{
		PageData pd = this.getPageData();
		String courseGroupIds = pd.getString("courseGroupIds");
		if(null!=courseGroupIds && courseGroupIds.length()>0){
			String[] ids = courseGroupIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseGroupService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

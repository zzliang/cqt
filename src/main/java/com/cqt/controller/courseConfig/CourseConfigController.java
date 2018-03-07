package com.cqt.controller.courseConfig;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseConfig;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseConfigService;
import com.cqt.service.course.CourseScheduleRunService;
import com.cqt.service.course.CourseScheduleService;
import com.cqt.util.CollectionUtil;
import com.cqt.util.UuidUtil;

@Controller
@RequestMapping(value="/course")
public class CourseConfigController extends BaseController{
	
	@Resource
	public CourseConfigService courseConfigService;
	@Resource
	public CourseScheduleService courseScheduleService;
	@Resource
	public CourseScheduleRunService courseScheduleRunService;
	/**
	 * <p>Title: listCourse</p>  
	 * <p>Description: 查看所有课程配置列表信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listCourseConfig")
	public ModelAndView listCourseConfig(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		page.setPd(pd);
		List<CourseConfig> courseConfigList = courseConfigService.listCourseConfig(page);	//列出课程配置
		mv.setViewName("courseconfig/courseConfig_list");
		mv.addObject("courseConfigList", courseConfigList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	@RequestMapping(value="/goEditCourseConfig")
	public ModelAndView goEditCourseConfig()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseConfigId = pd.getLong("courseConfigId");
		CourseConfig courseConfig = courseConfigService.findById(courseConfigId);
		mv.addObject("courseConfig",courseConfig);
		mv.addObject("msg", "courseSchedule/setCourseSchedule");
		mv.setViewName("courseconfig/courseConfig_edit");
		return mv;
	}
	
	/**
	 * <p>Title: editCourseConfig</p>  
	 * <p>Description: 编辑课程配置</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editCourseConfig")
	public ModelAndView editCourseConfig(CourseConfig courseConfig)throws Exception{
		ModelAndView mv = this.getModelAndView();
		Calendar cal = Calendar.getInstance();
		cal.setTime(courseConfig.getStartDate());
		cal.add(Calendar.DAY_OF_MONTH, 7*courseConfig.getWeeks());
		Date eDate = cal.getTime();
		courseConfig.setEndDate(eDate);
		courseConfigService.updateById(courseConfig);
		mv.setViewName("redirect:/course/listCourseConfig");
		return mv;
	}
	
	/**
	 * 删除课程配置
	 * @param deleteCourseConfig
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteCourseConfig")
	public ModelAndView deleteCourseConfig()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseConfigId = pd.getString("courseConfigId");
		if(null!=courseConfigId && !"".equals(courseConfigId)){
			courseConfigService.deleteById(Long.parseLong(courseConfigId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllCourseConfig")
	@ResponseBody
	public Map<String,Object> deleteAllCourseConfig()throws Exception{
		PageData pd = this.getPageData();
		String courseConfigIds = pd.getString("courseConfigIds");
		if(null!=courseConfigIds && courseConfigIds.length()>0){
			String[] ids = courseConfigIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseConfigService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

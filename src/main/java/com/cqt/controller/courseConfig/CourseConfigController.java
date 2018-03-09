package com.cqt.controller.courseConfig;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseConfig;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseConfigService;
import com.cqt.service.course.CourseScheduleRunService;
import com.cqt.service.course.CourseScheduleService;

@Controller
@RequestMapping(value = "/courseConfig")
public class CourseConfigController extends BaseController {

	@Resource
	public CourseConfigService courseConfigService;
	@Resource
	public CourseScheduleService courseScheduleService;
	@Resource
	public CourseScheduleRunService courseScheduleRunService;

	/**
	 * 查看课程表配置信息列表
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String keyWord = pd.getString("KEYWORD"); // 关键词检索
		if (null != keyWord && !"".equals(keyWord)) {
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		page.setPd(pd);
		List<CourseConfig> courseConfigList = courseConfigService.listCourseConfig(page); // 列出课程配置
		mv.setViewName("courseconfig/courseConfig_list");
		mv.addObject("courseConfigList", courseConfigList);
		mv.addObject("pd", pd);

		return mv;
	}
	
	/**
	 * 去编辑课程表配置
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseConfigId = pd.getLong("courseConfigId");
		CourseConfig courseConfig = courseConfigService.findById(courseConfigId);
		mv.addObject("courseConfig", courseConfig);
		mv.addObject("action", "courseSchedule/setCourseSchedule");
		mv.setViewName("courseconfig/courseConfig_edit");
		return mv;
	}

	/**
	 * 编辑课程表配置
	 * @param courseConfig
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit(CourseConfig courseConfig) throws Exception {
		ModelAndView mv = this.getModelAndView();
		Calendar cal = Calendar.getInstance();
		cal.setTime(courseConfig.getStartDate());
		cal.add(Calendar.DAY_OF_MONTH, 7 * courseConfig.getWeeks());
		Date eDate = cal.getTime();
		courseConfig.setEndDate(eDate);
		courseConfigService.updateById(courseConfig);
		mv.setViewName("redirect:/courseConfig/list");
		return mv;
	}

	/**
	 * 删除课程表配置
	 * 
	 * @param delete
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public ModelAndView delete() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseConfigId = pd.getString("courseConfigId");
		if (null != courseConfigId && !"".equals(courseConfigId)) {
			courseConfigService.deleteById(Long.parseLong(courseConfigId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除选中的课程表配置信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Map<String, Object> deleteAll() throws Exception {
		PageData pd = this.getPageData();
		String courseConfigIds = pd.getString("courseConfigIds");
		if (null != courseConfigIds && courseConfigIds.length() > 0) {
			String[] ids = courseConfigIds.split(",");
			Long[] _ids = new Long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseConfigService.deleteByIds(_ids);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		return pd;
	}
}

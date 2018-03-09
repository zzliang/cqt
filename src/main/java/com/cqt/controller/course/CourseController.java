package com.cqt.controller.course;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqt.commons.IO;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.Course;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseService;

@Controller
@RequestMapping(value = "/course")
public class CourseController extends BaseController {

	@Resource
	public CourseService courseService;

	/**
	 * 查看课程列表
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
		List<Course> courseList = courseService.listCourse(page); // 列出课程
		mv.setViewName("course/course_list");
		mv.addObject("courseList", courseList);
		return mv;
	}

	/**
	 * 查看课程详情
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goView")
	public ModelAndView toView() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseId = pd.getString("courseId");
		Course course = courseService.findById(Long.parseLong(courseId));
		mv.addObject("course", course);
		mv.setViewName("course/course_view");
		return mv;
	}

	/**
	 * 到添加课程信息页
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAddCourse() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		// 查询所有的课程组信息,添加的课程需要分配到课程组内
		List<CourseGroup> courseGroupList = courseService.findCourseGroupList();
		mv.setViewName("course/course_edit");
		mv.addObject("courseGroupList", courseGroupList);
		mv.addObject("action", "course/add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 添加课程
	 * 
	 * @param attr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add")
	public ModelAndView addCourse() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		// {courseName=木林, courseGroupId=3, courseGroupName=数学思维系列课程}
		Course course = new Course();
		String courseName = pd.getString("courseName");
		course.setCourseName(courseName);

		CourseGroup cg = new CourseGroup();
		Long courseGroupId = pd.getLong("courseGroupId");
		String courseGroupName = pd.getString("courseGroupName");
		cg.setCourseGroupId(courseGroupId);
		cg.setCourseGroupName(courseGroupName);
		course.setCourseGroup(cg);
		courseService.add(course);
		mv.setViewName("save_result");
		// mv.setViewName("redirect:/course/listCourse");
		// //重定向方式，可以通过RedirectAttributes传递值
		return mv;
	}

	/**
	 * 去编辑课程信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseId = pd.getLong("courseId");
		// 查询所有的课程组信息,添加的课程需要分配到课程组内
		List<CourseGroup> courseGroupList = courseService.findCourseGroupList();
		mv.setViewName("course/course_edit");
		mv.addObject("courseGroupList", courseGroupList);
		Course course = courseService.findCourseWithGroupById(courseId);
		mv.addObject("course", course);
		mv.addObject("action", "course/edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 编辑课程信息
	 * 
	 * @param course
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit(Course course) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//{courseName=666, courseGroupId=5, courseGroupName=艺术素养系列课程, courseId=53}
		CourseGroup cg = new CourseGroup();
		cg.setCourseGroupId(pd.getLong("courseGroupId"));
		cg.setCourseGroupName(pd.getString("courseGroupName"));
		course.setCourseGroup(cg);
		
		courseService.updateById(course);
		//mv.setViewName("redirect:/course/listCourse");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除课程信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		ModelAndView mv = this.getModelAndView();
		try {
			PageData pd = this.getPageData();
			String courseId = pd.getString("courseId");
			if (null != courseId && !"".equals(courseId)) {
				courseService.deleteById(Long.parseLong(courseId));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			IO.close(out);
		}
	}

	/**
	 * 删除所有选中课程信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Map<String, Object> deleteAllCourse() throws Exception {
		PageData pd = this.getPageData();
		String courseIds = pd.getString("courseIds");
		if (null != courseIds && courseIds.length() > 0) {
			String[] ids = courseIds.split(",");
			Long[] _ids = new Long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseService.deleteByIds(_ids);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		return pd;
	}
}

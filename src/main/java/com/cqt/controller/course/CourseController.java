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
import com.cqt.entity.Course;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseService;

@Controller
@RequestMapping(value="/course")
public class CourseController extends BaseController{
	
	@Resource
	public CourseService courseService;
	/**
	 * <p>Title: listCourse</p>  
	 * <p>Description: 查看所有课程列表信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listCourse")
	public ModelAndView listCourse(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		page.setPd(pd);
		List<Course> courseList = courseService.listCourse(page);			//列出课程
		mv.setViewName("course/course_list");
		mv.addObject("courseList", courseList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	@RequestMapping(value="/goViewCourse")
	public ModelAndView goViewCourse()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseId = pd.getString("courseId");
		Course course =courseService.findById(Long.parseLong(courseId));
		mv.addObject("course", course);
		mv.setViewName("course/course_view");
		return mv;
	}
	
	/**
	 * <p>Title: goAddCourse</p>  
	 * <p>Description: 跳转到新增分校页</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddCourse")
	public ModelAndView goAddCourse()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		
		//查询所有的课程组信息,添加的课程需要分配到课程组内
		List<CourseGroup> courseGroupList = courseService.findCourseGroupList();
		mv.setViewName("course/course_edit");
		mv.addObject("courseGroupList",courseGroupList);
		
		mv.addObject("msg", "addCourse");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addCourse</p>  
	 * <p>Description: 新增加课程</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addCourse")
	public ModelAndView addCourse(RedirectAttributes attr)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		//{courseName=木林, courseGroupId=3, courseGroupName=数学思维系列课程}
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
		mv.setViewName("redirect:/course/listCourse");
		return mv;
	}
	
	@RequestMapping(value="/goEditCourse")
	public ModelAndView goEditCourse()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseId = pd.getLong("courseId");
		//查询所有的课程组信息,添加的课程需要分配到课程组内
		List<CourseGroup> courseGroupList = courseService.findCourseGroupList();
		mv.setViewName("course/course_edit");
		mv.addObject("courseGroupList",courseGroupList);
		
		Course course = courseService.findCourseWithGroupById(courseId);
		mv.addObject("course",course);
		
		mv.addObject("msg", "editCourse");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addCourse</p>  
	 * <p>Description: 新增加课程</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editCourse")
	public ModelAndView editCourse(Course course)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		courseService.updateById(course);
		mv.setViewName("redirect:/course/listCourse");
		return mv;
	}
	
	/**
	 * 删除课程
	 * @param course
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteCourse")
	public ModelAndView deleteCourse()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseId = pd.getString("courseId");
		if(null!=courseId && !"".equals(courseId)){
			courseService.deleteById(Long.parseLong(courseId));
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllCourse")
	@ResponseBody
	public Map<String,Object> deleteAllCourse()throws Exception{
		PageData pd = this.getPageData();
		String courseIds = pd.getString("courseIds");
		if(null!=courseIds && courseIds.length()>0){
			String[] ids = courseIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
	
	
}

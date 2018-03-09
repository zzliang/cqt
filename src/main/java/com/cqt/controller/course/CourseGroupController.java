package com.cqt.controller.course;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.xmlbeans.impl.common.IOUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cqt.commons.IO;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseGroupService;

@Controller
@RequestMapping(value = "/courseGroup")
public class CourseGroupController extends BaseController {
	@Resource
	public CourseGroupService courseGroupService;

	/**
	 * 查看所有课程组列表信息
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
		List<CourseGroup> courseGroupList = courseGroupService.listCourseGroup(page); // 列出课程
		mv.setViewName("course/courseGroup_list");
		mv.addObject("courseGroupList", courseGroupList);
		mv.addObject("pd", pd);

		return mv;
	}

	/**
	 * 去添加课程组信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("course/courseGroup_edit");
		mv.addObject("action", "courseGroup/add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 添加课程组
	 * 
	 * @param cg
	 * @param attr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add")
	public ModelAndView add(CourseGroup cg, RedirectAttributes attr) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		courseGroupService.add(cg);
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 去编辑课程组信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long courseGroupId = pd.getLong("courseGroupId");
		CourseGroup cg = courseGroupService.findById(courseGroupId);
		mv.addObject("courseGroup", cg);
		mv.setViewName("course/courseGroup_edit");
		mv.addObject("action", "courseGroup/edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 编辑课程组信息
	 * 
	 * @param courseGroup
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit(CourseGroup courseGroup) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		courseGroupService.updateById(courseGroup);
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除课程组信息
	 * 
	 * @param courseGroup
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) {
		PageData pd = this.getPageData();
		try {
			String courseGroupId = pd.getString("courseGroupId");
			if (null != courseGroupId && !"".equals(courseGroupId)) {
				courseGroupService.deleteById(Long.parseLong(courseGroupId));
			}
			out.write("success");
			out.close();
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}finally{
			IO.close(out);
		}
	}

	/**
	 * 删除选中的所有课程组信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Map<String, Object> deleteAll() throws Exception {
		PageData pd = this.getPageData();
		String courseGroupIds = pd.getString("courseGroupIds");
		if (null != courseGroupIds && courseGroupIds.length() > 0) {
			String[] ids = courseGroupIds.split(",");
			Long[] _ids = new Long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				_ids[i] = Long.valueOf(ids[i]);
			}
			courseGroupService.deleteByIds(_ids);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		return pd;
	}
}

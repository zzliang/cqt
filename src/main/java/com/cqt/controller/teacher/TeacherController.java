package com.cqt.controller.teacher;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.Teacher;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.teacher.TeacherService;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController extends BaseController{
	
	@Resource
	public TeacherService teacherService;
	
	/**
	 * 分页查看分校所有教师信息
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listTeacher")
	public ModelAndView listTeacher(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		
		pd.put("分校Id", "");
		page.setPd(pd);
		List<Teacher> teacherList = teacherService.listTeacher(page);	//列出教师列表
		mv.setViewName("teacher/teacher_list");
		mv.addObject("teacherList", teacherList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * 跳转到新增教师页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddTeacher")
	public ModelAndView goAddTeacher()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("teacher/teacher_edit");
		mv.addObject("msg", "addTeacher");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 新增加教师
	 * @param teacher
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addTeacher")
	public ModelAndView addTeacher(Teacher teacher)throws Exception{
		ModelAndView mv = this.getModelAndView();
		//需要补全老师信息才能保存
		
		teacherService.add(teacher);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 跳转到编辑教师页
	 * @param teacherId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditTeacher")
	public ModelAndView goEditTeacher(@RequestParam Long teacherId)throws Exception{
		ModelAndView mv = this.getModelAndView();
		Teacher teachear = teacherService.findById(teacherId);
		
		mv.addObject("teachear", teachear);
		mv.addObject("msg", "editTeacher");
		mv.setViewName("teachear/editTeacher");
		return mv;
	}
	
	/**
	 * 新增加教师
	 * @param teacher
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editTeacher")
	public ModelAndView editTeacher(Teacher teacher)throws Exception{
		ModelAndView mv = this.getModelAndView();
		teacherService.updateById(teacher);
		mv.setViewName("redirect:/teacher/listTeacher");
		return mv;
	}
	
	/**
	 * 删除教师
	 * @param teacherId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteTeacher")
	public ModelAndView deleteTeacher(@RequestParam Long teacherId )throws Exception{
		ModelAndView mv = this.getModelAndView();
		if(null!=teacherId && !"".equals(teacherId)){
			teacherService.deleteById(teacherId);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除多个教师
	 * @param teacherIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAllTeacher")
	@ResponseBody
	public Map<String,Object> deleteAllTeacher(@RequestParam String teacherIds)throws Exception{
		PageData pd = new PageData();
		if(null!=teacherIds && teacherIds.length()>0){
			String[] ids = teacherIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			teacherService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

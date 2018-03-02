package com.cqt.controller.student;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.controller.base.BaseController;
import com.cqt.entity.Classes;
import com.cqt.entity.Student;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.student.StudentService;

@Controller
@RequestMapping(value="/stu")
public class StudentController extends BaseController{
	
	@Resource
	public StudentService studentService;
	/**
	 * <p>Title: listStu</p>  
	 * <p>Description: 查看所有分校学生信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listStudent")
	public ModelAndView listStudent(Page page)throws Exception{
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
		List<Student> stuList = studentService.listStudent(page);			//列出分校班级列表
		mv.setViewName("student/student_list");
		mv.addObject("student_list", stuList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * <p>Title: goAddStu</p>  
	 * <p>Description: 跳转到新增学生页</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddStudent")
	public ModelAndView goAddStudent()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.setViewName("student/student_edit");
		mv.addObject("msg", "addStudent");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addSchool</p>  
	 * <p>Description: 新增加学生</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addStudent")
	public ModelAndView addStudent(Student student)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		studentService.add(student);
		mv.setViewName("save_result");
		return mv;
	}
}

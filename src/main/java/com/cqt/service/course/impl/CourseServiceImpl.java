package com.cqt.service.course.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.Course;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.service.course.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public List<Course> listCourse(Page page) throws Exception {
		List<Course> listCourse = (List<Course>)dao.findForList("CourseMapper.courseListPage", page);
		return listCourse;
	}

	@Override
	public Course findById(Long courseId) throws Exception {
		Course course = (Course)dao.findForObject("CourseMapper.selectById", courseId);
		return course;
	}

	@Override
	public int deleteById(Long courseId) throws Exception {
		return (Integer)dao.delete("CourseMapper.deleteById", courseId);
	}
	
	@Override
	public int deleteByIds(Long[] _ids) throws Exception {
		return (Integer)dao.delete("CourseMapper.deleteByIds", _ids);
	}

	@Override
	public int add(Course course) throws Exception {
		return (Integer)dao.save("CourseMapper.insert", course);
	}

	@Override
	public int addSelective(Course course) throws Exception {
		return (Integer)dao.save("CourseMapper.insertSelective", course);
	}

	@Override
	public int updateByIdSelective(Course course) throws Exception {
		return (Integer)dao.update("CourseMapper.updateByIdSelective", course);
	}

	@Override
	public int updateById(Course course) throws Exception {
		return (Integer)dao.update("CourseMapper.updateById", course);
	}
	
	/**
	 * 查询课程组列表信息
	 */
	@Override
	public List<CourseGroup> findCourseGroupList() throws Exception {
		return ( List<CourseGroup>)dao.findForList("CourseGroupMapper.selectCourseGroupList", null);
	}

	@Override
	public Course findCourseWithGroupById(Long courseId) throws Exception {
		return (Course)dao.findForObject("CourseMapper.selectCourseWithGroupById", courseId);
	}

}

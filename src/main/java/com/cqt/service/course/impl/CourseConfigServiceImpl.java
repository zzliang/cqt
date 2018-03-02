package com.cqt.service.course.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.CourseConfig;
import com.cqt.plugin.paging.Page;
import com.cqt.service.course.CourseConfigService;

@Service("courseConfigService")
public class CourseConfigServiceImpl implements CourseConfigService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public List<CourseConfig> listCourseConfig(Page page) throws Exception {
		List<CourseConfig> listCourseConfig = (List<CourseConfig>)dao.findForList("CourseConfigMapper.courseListPage", page);
		return listCourseConfig;
	}
	
	@Override
	public CourseConfig findByCourseDate(String courseDate) throws Exception {
		CourseConfig courseConfig = (CourseConfig)dao.findForObject("CourseConfigMapper.selectByCourseDate", courseDate);
		return courseConfig;
	}
	
	@Override
	public CourseConfig findByNow() throws Exception {
		CourseConfig courseConfig = (CourseConfig)dao.findForObject("CourseConfigMapper.selectByNow", null);
		return courseConfig;
	}

	@Override
	public CourseConfig findById(Long courseId) throws Exception {
		CourseConfig course = (CourseConfig)dao.findForObject("CourseConfigMapper.selectById", courseId);
		return course;
	}

	@Override
	public int deleteById(Long courseId) throws Exception {
		return (Integer)dao.delete("CourseConfigMapper.deleteById", courseId);
	}
	
	@Override
	public int deleteByIds(Long[] _ids) throws Exception {
		return (Integer)dao.delete("CourseConfigMapper.deleteByIds", _ids);
	}

	@Override
	public int add(CourseConfig course) throws Exception {
		return (Integer)dao.save("CourseConfigMapper.insert", course);
	}

	@Override
	public int addSelective(CourseConfig course) throws Exception {
		return (Integer)dao.save("CourseConfigMapper.insertSelective", course);
	}

	@Override
	public int updateByIdSelective(CourseConfig course) throws Exception {
		return (Integer)dao.update("CourseConfigMapper.updateByIdSelective", course);
	}

	@Override
	public int updateById(CourseConfig course) throws Exception {
		return (Integer)dao.update("CourseConfigMapper.updateById", course);
	}
}

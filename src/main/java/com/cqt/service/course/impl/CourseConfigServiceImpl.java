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
		List<CourseConfig> listCourseConfig = (List<CourseConfig>)dao.findForList("CourseConfigMapper.courseConfigListPage", page);
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
	public CourseConfig findById(Long courseConfigId) throws Exception {
		CourseConfig course = (CourseConfig)dao.findForObject("CourseConfigMapper.selectById", courseConfigId);
		return course;
	}

	@Override
	public int deleteById(Long courseConnfigId) throws Exception {
		return (Integer)dao.delete("CourseConfigMapper.deleteById", courseConnfigId);
	}
	
	@Override
	public int deleteByIds(Long[] _ids) throws Exception {
		return (Integer)dao.delete("CourseConfigMapper.deleteByIds", _ids);
	}

	@Override
	public int add(CourseConfig courseConfig) throws Exception {
		return (Integer)dao.save("CourseConfigMapper.insert", courseConfig);
	}

	@Override
	public int addSelective(CourseConfig courseConfig) throws Exception {
		return (Integer)dao.save("CourseConfigMapper.insertSelective", courseConfig);
	}

	@Override
	public int updateByIdSelective(CourseConfig courseConfig) throws Exception {
		return (Integer)dao.update("CourseConfigMapper.updateByIdSelective", courseConfig);
	}

	@Override
	public int updateById(CourseConfig courseConfig) throws Exception {
		return (Integer)dao.update("CourseConfigMapper.updateById", courseConfig);
	}
}

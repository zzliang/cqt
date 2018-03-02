package com.cqt.service.course.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;
import com.cqt.service.course.CourseGroupService;

@Service("courseGroupService")
public class CourseGroupServiceImpl implements CourseGroupService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public CourseGroup findById(Long courseGroupId) throws Exception {
		return (CourseGroup)dao.findForObject("CourseGroupMapper.selectById", courseGroupId);
	}

	@Override
	public int deleteById(Long courseGroupId) throws Exception {
		return (Integer)dao.delete("CourseGroupMapper.deleteById", courseGroupId);
	}

	@Override
	public int deleteByIds(Long[] ids) throws Exception {
		return (Integer)dao.delete("CourseGroupMapper.deleteByIds", ids);
	}

	@Override
	public int add(CourseGroup courseGroup) throws Exception {
		return (Integer)dao.save("CourseGroupMapper.insert", courseGroup);
	}

	@Override
	public int updateById(CourseGroup courseGroup) throws Exception {
		return (Integer)dao.update("CourseGroupMapper.updateById", courseGroup);
	}

	@Override
	public List<CourseGroup> listCourseGroup(Page page) throws Exception {
		return (List<CourseGroup>)dao.findForList("CourseGroupMapper.courseGroupListPage", page);
	}

	@Override
	public List<CourseGroup> findCourseGroupList() throws Exception {
		return (List<CourseGroup>)dao.findForList("CourseGroupMapper.selectCourseGroupList", null);
	}
}

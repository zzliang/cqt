package com.cqt.service.course;

import java.util.List;

import com.cqt.entity.CourseConfig;
import com.cqt.plugin.paging.Page;

public interface CourseConfigService {

	List<CourseConfig> listCourseConfig(Page page) throws Exception;

	CourseConfig findById(Long courseConfigId) throws Exception;

	int deleteById(Long courseConfigId) throws Exception;

	int deleteByIds(Long[] _ids) throws Exception;

	int add(CourseConfig courseConfig) throws Exception;

	int addSelective(CourseConfig courseConfig) throws Exception;
	
	int updateByIdSelective(CourseConfig courseConfig) throws Exception;

	int updateById(CourseConfig courseConfig) throws Exception;

	CourseConfig findByCourseDate(String courseDate) throws Exception;

	CourseConfig findByNow() throws Exception;

}
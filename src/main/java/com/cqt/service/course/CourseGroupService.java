package com.cqt.service.course;

import java.util.List;

import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;

public interface CourseGroupService {
	CourseGroup findById(Long courseGroupId) throws Exception;
	
    int deleteById(Long courseGroupId) throws Exception;
    
    int deleteByIds(Long[] ids) throws Exception;
    
    int add(CourseGroup courseGroup) throws Exception;

    int updateById(CourseGroup courseGroup) throws Exception;

	List<CourseGroup> listCourseGroup(Page page) throws Exception;
	
	List<CourseGroup> findCourseGroupList() throws Exception;
}

package com.cqt.service.course;

import java.util.List;

import com.cqt.entity.Course;
import com.cqt.entity.CourseGroup;
import com.cqt.plugin.paging.Page;

public interface CourseService {
	Course findById(Long courseId) throws Exception;
	
	Course findCourseWithGroupById(Long courseId) throws Exception;
	
    int deleteById(Long courseId) throws Exception;
    
    int deleteByIds(Long[] ids) throws Exception;
    
    int add(Course course) throws Exception;

    int addSelective(Course course) throws Exception;

    int updateByIdSelective(Course course) throws Exception;

    int updateById(Course course) throws Exception;

	List<Course> listCourse(Page page) throws Exception;
	
	List<CourseGroup> findCourseGroupList() throws Exception;

}
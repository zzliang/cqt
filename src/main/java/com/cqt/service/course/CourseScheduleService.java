package com.cqt.service.course;

import java.util.List;
import java.util.Map;

import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.plugin.paging.Page;

public interface CourseScheduleService {
	List<CourseSchedule> listCourseSchedule(Page page) throws Exception;
	
	List<CourseSchedule> listCourseScheduleByMap(Map<?,?> map) throws Exception;
	
	List<CourseSchedule> listCourseScheduleWithItemByMap(Map<?,?> map) throws Exception;
	
	CourseSchedule findById(String courseScheduleId) throws Exception;
	
	CourseSchedule findByMap(Map<String, Object> map) throws Exception;
	
	String findMaxCourseDate() throws Exception;
    
	CourseSchedule findNewCourseSchedule(Map<String,Object> map) throws Exception;
	
	int deleteById(String courseScheduleId) throws Exception;

    int add(CourseSchedule course) throws Exception;
    
    int add(List<CourseSchedule> courseSchedules) throws Exception;
    
    int addSelective(CourseSchedule course) throws Exception;
    
    int updateByIdSelective(CourseSchedule course) throws Exception;

    int updateById(CourseSchedule course) throws Exception;

	List<CourseItem> listCourseItemByMap(Map<?, ?> map) throws Exception;
}

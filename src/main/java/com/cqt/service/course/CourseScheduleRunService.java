package com.cqt.service.course;

import java.util.List;
import java.util.Map;

import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.plugin.paging.Page;

public interface CourseScheduleRunService {

	List<CourseSchedule> listCourseScheduleRun(Page page) throws Exception;

	List<CourseSchedule> listCourseScheduleRunByMap(Map<?, ?> map) throws Exception;

	List<CourseSchedule> listCourseScheduleRunWithItemByMap(Map<?, ?> map) throws Exception;

	CourseSchedule findById(String courseScheduleId) throws Exception;

	CourseSchedule findByMap(Map<String, Object> map) throws Exception;

	String findMaxCourseDate() throws Exception;

	CourseSchedule findNewCourseSchedule(Map<String, Object> map) throws Exception;

	int deleteById(String courseScheduleId) throws Exception;

	int add(CourseSchedule courseSche) throws Exception;

	int add(List<CourseSchedule> courseSchedules) throws Exception;
	
	int addCourseItems(List<CourseItem> CourseItems) throws Exception;

	int addSelective(CourseSchedule courseSche) throws Exception;

	int updateByIdSelective(CourseSchedule courseSche) throws Exception;

	int updateById(CourseSchedule courseSche) throws Exception;
}
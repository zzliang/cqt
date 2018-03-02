package com.cqt.service.course.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.plugin.paging.Page;
import com.cqt.service.course.CourseScheduleService;

@Service("courseScheduleService")
public class CourseScheduleServiceImpl implements CourseScheduleService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/** 分页查询课程表列表信息  */
	@Override
	public List<CourseSchedule> listCourseSchedule(Page page) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleMapper.CourseScheduleListPage", page);
		return courseScheduleList;
	}
	
	/** 查询课程表不包含课程表项的列表信息  */
	@Override
	public List<CourseSchedule> listCourseScheduleByMap(Map<?,?> map) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleMapper.listCourseScheduleByMap", map);
		return courseScheduleList;
	}
	
	/** 查询课程表包含课程表项的列表信息  */
	@Override
	public List<CourseSchedule> listCourseScheduleWithItemByMap(Map<?,?> map) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleMapper.listCourseScheduleWithItemByMap", map);
		return courseScheduleList;
	}
	
	/** 根据ID查询课程表唯一信息 
	 * @throws Exception */
	@Override
	public CourseSchedule findById(String courseScheduleId) throws Exception {
		CourseSchedule courseSchedule = (CourseSchedule)dao.findForObject("CourseScheduleMapper.selectById", courseScheduleId);
		return courseSchedule;
	}
	
	/** 多条件查询课程表唯一信息 */
	@Override
	public CourseSchedule findByMap(Map<String,Object> map) throws Exception {
		CourseSchedule cs = (CourseSchedule)dao.findForObject("CourseScheduleMapper.selectCourseScheduleWithItemByMap", map);
		return cs;
	}	
	
	/** 查询最新最近的课程表时间 */
	@Override
	public String findMaxCourseDate() throws Exception {
		String maxCourseDate = (String)dao.findForObject("CourseScheduleMapper.selectMaxCourseDate", null);
		return maxCourseDate;
	}
	
	/** 根据班级名称与课程表年月查询班级不同月份的课程表 */
	@Override
	public CourseSchedule findNewCourseSchedule(Map<String,Object> map) throws Exception {
		CourseSchedule newCourseSchedule = (CourseSchedule)dao.findForObject("CourseScheduleMapper.selectNewCourseSchedule", map);
		return newCourseSchedule;
	}
	
	/** 删除指定Id的课程表信息   */
	@Override
	public int deleteById(String courseScheduleId) throws Exception {
		int count = (Integer)dao.delete("CourseScheduleMapper.deleteById", courseScheduleId);
		return count;
	}

	@Override
	public int add(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.save("CourseScheduleMapper.insert", courseSche);
	}
	
	/** 导入外部的课程表数据  */
	@Override
	public int add(List<CourseSchedule> courseSchedules) throws Exception {
		//导入课程表头部基本信息
		Integer count  = (Integer)dao.batchSave("CourseScheduleMapper.insertCourseScheduleList", courseSchedules);
		if(count>0){
			//导入课程表的详细课程按排
			count = (Integer)dao.batchSave("CourseScheduleMapper.insertCourseItemList", courseSchedules);
		}
		return count;
	}

	@Override
	public int addSelective(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.save("CourseScheduleMapper.insertSelective", courseSche);
	}

	@Override
	public int updateByIdSelective(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.update("CourseScheduleMapper.updateByIdSelective", courseSche);
	}

	@Override
	public int updateById(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.update("CourseScheduleMapper.updateById", courseSche);
	}
	
	/** 查询课程表项信息  */
	@Override
	public List<CourseItem> listCourseItemByMap(Map<?,?> map) throws Exception {
		List<CourseItem> courseItemList = (List<CourseItem>)dao.findForList("CourseItemMapper.listCourseItemByMap", map);
		return courseItemList;
	}

}

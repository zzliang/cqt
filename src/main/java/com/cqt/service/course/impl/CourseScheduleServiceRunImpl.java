package com.cqt.service.course.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.plugin.paging.Page;
import com.cqt.service.course.CourseScheduleRunService;

@Service("courseScheduleRunService")
public class CourseScheduleServiceRunImpl implements CourseScheduleRunService{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/** 分页查询课程表列表信息  */
	@Override
	public List<CourseSchedule> listCourseScheduleRun(Page page) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleRunMapper.CourseScheduleRunListPage", page);
		return courseScheduleList;
	}
	
	/** 查询课程表不包含课程表项的列表信息  */
	@Override
	public List<CourseSchedule> listCourseScheduleRunByMap(Map<?,?> map) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleRunMapper.listCourseScheduleRunByMap", map);
		return courseScheduleList;
	}
	
	/** 查询课程表包含课程表项的列表信息  */
	@Override
	public List<CourseSchedule> listCourseScheduleRunWithItemByMap(Map<?,?> map) throws Exception {
		List<CourseSchedule> courseScheduleList = (List<CourseSchedule>)dao.findForList("CourseScheduleRunMapper.listCourseScheduleRunWithItemByMap", map);
		return courseScheduleList;
	}
	
	/** 根据ID查询课程表唯一信息 
	 * @throws Exception */
	@Override
	public CourseSchedule findById(String courseScheduleId) throws Exception {
		CourseSchedule courseSchedule = (CourseSchedule)dao.findForObject("CourseScheduleRunMapper.selectById", courseScheduleId);
		return courseSchedule;
	}
	
	/** 多条件查询课程表唯一信息 */
	@Override
	public CourseSchedule findByMap(Map<String,Object> map) throws Exception {
		CourseSchedule cs = (CourseSchedule)dao.findForObject("CourseScheduleRunMapper.selectCourseScheduleRunWithItemByMap", map);
		return cs;
	}	
	
	/** 查询最新最近的课程表时间 */
	@Override
	public String findMaxCourseDate() throws Exception {
		String maxCourseDate = (String)dao.findForObject("CourseScheduleRunMapper.selectMaxCourseDate", null);
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
	
	/** 删除运行的课程项表中的课程项信息 */
	@Override
	public int deleteCourseItemRunByIds(List<CourseSchedule> listCourseSchedule) throws Exception {
		int count = (Integer)dao.delete("CourseScheduleRunMapper.deleteCourseItemRunByIds", listCourseSchedule);
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
		Integer count  = (Integer)dao.batchSave("CourseScheduleRunMapper.insertCourseScheduleList", courseSchedules);
		/*if(count>0){
			//导入课程表的详细课程按排
			count = (Integer)dao.batchSave("CourseScheduleMapper.insertCourseItemList", courseSchedules);
		}*/
		return count;
	}
	

	@Override
	public int addCourseItems(List<CourseItem> CourseItems) throws Exception {
		return (Integer)dao.batchSave("CourseItemRunMapper.insertCourseItemRunList", CourseItems);
	}

	@Override
	public int addSelective(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.save("CourseScheduleRunMapper.insertSelective", courseSche);
	}

	@Override
	public int updateByIdSelective(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.update("CourseScheduleRunMapper.updateByIdSelective", courseSche);
	}

	@Override
	public int updateById(CourseSchedule courseSche) throws Exception {
		return (Integer)dao.update("CourseScheduleRunMapper.updateById", courseSche);
	}
	
	
	
}

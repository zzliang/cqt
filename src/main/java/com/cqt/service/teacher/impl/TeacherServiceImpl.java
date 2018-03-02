package com.cqt.service.teacher.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.Teacher;
import com.cqt.plugin.paging.Page;
import com.cqt.service.teacher.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 分页查询教师列表
	 */
	@Override
	public List<Teacher> listTeacher(Page page) throws Exception {
		List<Teacher> teacherList = (List<Teacher>)dao.findForList("TeacherMapper.teacherListPage", page);
		return teacherList;
	}
	
	/**
	 * 根据教师ID查询教师信息
	 */
	@Override
	public Teacher findById(Long teacherId) throws Exception {
		Teacher teacher = (Teacher)dao.findForObject("TeacherMapper.selectById", teacherId);
		return teacher;
	}
	
	/**
	 * 根据教师ID删除教师信息
	 */
	@Override
	public int deleteById(Long teacherId) throws Exception {
		return (Integer)dao.delete("TeacherMapper.deleteById", teacherId);
	}

	@Override
	public int deleteByIds(Long[] ids) throws Exception {
		return (Integer)dao.delete("TeacherMapper.deleteByIds", ids);
	}
	
	/**
	 * 添加教师信息
	 */
	@Override
	public int add(Teacher teacher) throws Exception {
		return (Integer)dao.save("TeacherMapper.insert", teacher);
	}

	@Override
	public int addSelective(Teacher teacher) throws Exception {
		return (Integer)dao.save("TeacherMapper.insertSelective", teacher);
	}
	
	/**
	 * 更新教师信息
	 */
	@Override
	public int updateByIdSelective(Teacher teacher) throws Exception {
		return (Integer)dao.update("TeacherMapper.updateByIdSelective", teacher);
	}

	@Override
	public int updateById(Teacher teacher) throws Exception {
		return (Integer)dao.update("TeacherMapper.updateById", teacher);
	}
	
}

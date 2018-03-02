package com.cqt.service.student.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.Student;
import com.cqt.plugin.paging.Page;
import com.cqt.service.student.StudentService;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 分页查询学生列表
	 */
	@Override
	public List<Student> listStudent(Page page) throws Exception {
		List<Student> stuList = (List<Student>)dao.findForList("StudentMapper.studentListPage", page);
		return stuList;
	}
	
	@Override
	public Student findById(Long studentId) throws Exception {
		Student stu = (Student)dao.findForObject("StudentMapper.selectById", studentId);
		return stu;
	}

	@Override
	public int deleteById(Long studentId) throws Exception {
		return (Integer)dao.delete("StudentMapper.deleteById", studentId);
	}

	@Override
	public int add(Student student) throws Exception {
		return (Integer)dao.save("StudentMapper.insert", student);
	}

	@Override
	public int addSelective(Student student) throws Exception {
		return (Integer)dao.save("StudentMapper.insertSelective", student);
	}

	@Override
	public int updateByIdSelective(Student student) throws Exception {
		return (Integer)dao.update("StudentMapper.updateByIdSelective", student);
	}

	@Override
	public int updateById(Student student) throws Exception {
		return (Integer)dao.update("StudentMapper.updateById", student);
	}
}

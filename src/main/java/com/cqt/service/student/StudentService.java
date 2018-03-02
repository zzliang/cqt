package com.cqt.service.student;

import java.util.List;

import com.cqt.entity.Student;
import com.cqt.plugin.paging.Page;

public interface StudentService {
	
	Student findById(Long studentId) throws Exception;
	
    int deleteById(Long studentId) throws Exception;

    int add(Student student) throws Exception;

    int addSelective(Student student) throws Exception;

    int updateByIdSelective(Student student) throws Exception;

    int updateById(Student student) throws Exception;

	List<Student> listStudent(Page page) throws Exception;
		
}

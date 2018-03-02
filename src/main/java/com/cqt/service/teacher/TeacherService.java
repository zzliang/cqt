package com.cqt.service.teacher;

import java.util.List;

import com.cqt.entity.Teacher;
import com.cqt.plugin.paging.Page;

public interface TeacherService {
	Teacher findById(Long teacherId) throws Exception;
	
    int deleteById(Long teacherId) throws Exception;
    
    int deleteByIds(Long[] ids) throws Exception;

    int add(Teacher teacher) throws Exception;

    int addSelective(Teacher teacher) throws Exception;

    int updateByIdSelective(Teacher teacher) throws Exception;

    int updateById(Teacher teacher) throws Exception;

	List<Teacher> listTeacher(Page page) throws Exception;

}

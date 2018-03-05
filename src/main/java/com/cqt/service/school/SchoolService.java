package com.cqt.service.school;

import java.util.List;

import com.cqt.entity.School;
import com.cqt.plugin.paging.Page;

public interface SchoolService{
	
	School findById(Long schoolId) throws Exception;

	int deleteById(Long schoolId) throws Exception;
	
	int deleteByIds(Long[] _ids) throws Exception;
	
	int add(School school) throws Exception;
	
	int addSelective(School school) throws Exception;

    int updateByIdSelective(School school) throws Exception;

    int updateById(School school) throws Exception;

	List<School> listSchool(Page page) throws Exception;

	List<School> listSchool() throws Exception;


}

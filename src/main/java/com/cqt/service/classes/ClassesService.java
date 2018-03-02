package com.cqt.service.classes;

import java.util.List;

import com.cqt.entity.Classes;
import com.cqt.plugin.paging.Page;

public interface ClassesService {
	Classes findById(Long classesId) throws Exception;
	
    int deleteById(Long classesId) throws Exception;
    
    int deleteByIds(Long[] ids) throws Exception;

    int add(Classes classes) throws Exception;

    int addSelective(Classes classes) throws Exception;

    int updateByIdSelective(Classes classes) throws Exception;

    int updateById(Classes classes) throws Exception;

	List<Classes> listClasses(Page page) throws Exception;
}

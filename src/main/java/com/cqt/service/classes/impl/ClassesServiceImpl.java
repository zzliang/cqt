package com.cqt.service.classes.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.Classes;
import com.cqt.plugin.paging.Page;
import com.cqt.service.classes.ClassesService;

@Service("ClassesService")
public class ClassesServiceImpl implements ClassesService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public List<Classes> listClasses(Page page) throws Exception{
		List<Classes> listClasses = (List<Classes>)dao.findForList("ClassesMapper.classesListPage", page);
		return listClasses;
	}

	@Override
	public Classes findById(Long classesId) throws Exception{
		Classes cls = (Classes)dao.findForObject("ClassesMapper.selectById", classesId);
		return cls;
	}

	@Override
	public int deleteById(Long classesId) throws Exception{
		return (Integer)dao.delete("ClassesMapper.deleteById", classesId);
	}
	
	@Override
	public int deleteByIds(Long[] ids) throws Exception {
		return (Integer)dao.delete("ClassesMapper.deleteByIds", ids);
	}

	@Override
	public int add(Classes classes) throws Exception{
		return (Integer)dao.save("ClassesMapper.insert", classes);
	}

	@Override
	public int addSelective(Classes classes) throws Exception{
		return (Integer)dao.save("ClassesMapper.insertSelective", classes);
	}

	@Override
	public int updateByIdSelective(Classes classes) throws Exception{
		return (Integer)dao.update("ClassesMapper.updateByIdSelective", classes);
	}

	@Override
	public int updateById(Classes classes) throws Exception{
		return (Integer)dao.update("ClassesMapper.updateById", classes);
	}

}

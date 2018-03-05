package com.cqt.service.school.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.School;
import com.cqt.plugin.paging.Page;
import com.cqt.service.school.SchoolService;

@Service("schoolService")
public class SchoolServiceImpl implements SchoolService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<School> listSchool(Page page) throws Exception {
		List<School> schoolList = (List<School>)dao.findForList("SchoolMapper.schoolListPage", page);
		return schoolList;
	}
	
	@Override
	public List<School> listSchool() throws Exception {
		List<School> schoolList = (List<School>)dao.findForList("SchoolMapper.listSchool", null);
		return schoolList;
	}
	
	@Override
	public School findById(Long schoolId) throws Exception {
		School school = (School)dao.findForObject("SchoolMapper.selectById", schoolId);
		return school;
	}

	@Override
	public int deleteById(Long schoolId) throws Exception {
		return (Integer)dao.delete("SchoolMapper.deleteById", schoolId);
	}

	@Override
	public int deleteByIds(Long[] _ids) throws Exception {
		return (Integer)dao.delete("SchoolMapper.deleteByIds", _ids);
	}

	@Override
	public int add(School school) throws Exception {
		return (Integer)dao.save("SchoolMapper.insert", school);
	}

	@Override
	public int addSelective(School school) throws Exception {
		return (Integer)dao.save("SchoolMapper.insertSelective", school);
	}

	@Override
	public int updateByIdSelective(School school) throws Exception {
		return (Integer)dao.update("SchoolMapper.updateByIdSelective", school);
	}

	@Override
	public int updateById(School school) throws Exception {
		return (Integer)dao.update("SchoolMapper.updateById", school);
	}

	/*@Override
	public School findSchoolById(Long id) throws Exception {
		School school = (School)dao.findForObject("SchoolMapper.findSchoolById", id);
		return school;
	}

	@Override
	public List<School> schoolList(Page page) throws Exception {
		List<School> schoolList = (List<School>)dao.findForList("SchoolMapper.schoolListPage", page);
		return schoolList;
	}

	@Override
	public List<School> listSchoolByMap(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<School> listSchoolByAnd(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<School> listSchoolByOr(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int querySchoolCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int querySchoolCountByMap() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addSchool(School school) throws Exception {
		dao.findForList("SchoolMapper.addSchool", school);
	}

	@Override
	public void addSchool(List<School> listSchool) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void editSchool(School school) throws Exception {
		dao.update("SchoolMapper.updateSchool", school);
	}

	@Override
	public void editSchoolByMap(Map map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delSchoolById(Long id) throws Exception {
		int num = (int)dao.delete("SchoolMapper.deleteById", id);
		return num;
	}
	
	@Override
	public int delSchoolByIds(Long[] ids) throws Exception {
		int num = (int)dao.delete("SchoolMapper.deleteByIds", ids);
		return num;
	}

	@Override
	public int delSchoolByMap(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Boolean isExisSchool(Map map) {
		// TODO Auto-generated method stub
		return null;
	}*/
}

package com.cqt.service.employee.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.entity.Employee;
import com.cqt.plugin.paging.Page;
import com.cqt.service.employee.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<Employee> listEmployee(Page page) throws Exception {
		List<Employee> listEmployee = (List<Employee>)dao.findForList("EmployeeMapper.employeeListPage", page);
		return listEmployee;
	}
	
	@Override
	public Employee findById(Long employeeId) throws Exception {
		Employee employee = (Employee)dao.findForObject("EmployeeMapper.selectById", employeeId);
		return employee;
	}

	@Override
	public int deleteById(Long employeeId) throws Exception {
		return (Integer)dao.delete("EmployeeMapper.deleteById", employeeId);
	}
	
	@Override
	public int deleteByIds(Long[] ids) throws Exception {
		return (Integer)dao.delete("EmployeeMapper.deleteByIds", ids);
	}

	@Override
	public int add(Employee employee) throws Exception {
		return (Integer)dao.save("EmployeeMapper.insert", employee);
	}

	@Override
	public int addSelective(Employee employee) throws Exception {
		return (Integer)dao.save("EmployeeMapper.insertSelective", employee);
	}

	@Override
	public int updateByIdSelective(Employee employee) throws Exception {
		return (Integer)dao.update("EmployeeMapper.updateByIdSelective", employee);
	}

	@Override
	public int updateById(Employee employee) throws Exception {
		return (Integer)dao.update("EmployeeMapper.updateById", employee);
	}

}

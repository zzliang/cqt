package com.cqt.service.employee;

import java.util.List;

import com.cqt.entity.Employee;
import com.cqt.plugin.paging.Page;

public interface EmployeeService {
	
	Employee findById(Long employeeId) throws Exception;
	
    int deleteById(Long employeeId) throws Exception;
    
    int deleteByIds(Long[] ids) throws Exception;

    int add(Employee employee) throws Exception;

    int addSelective(Employee employee) throws Exception;
    
    int updateByIdSelective(Employee employee) throws Exception;

    int updateById(Employee employee) throws Exception;

	List<Employee> listEmployee(Page page) throws Exception;
}

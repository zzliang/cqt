package com.cqt.controller.employee;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.Constants;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.Employee;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.employee.EmployeeService;
import com.cqt.service.system.dictionaries.DictionariesService;

@Controller
@RequestMapping(value="/employee")
public class EmployeeController extends BaseController{
	
	@Resource
	public EmployeeService employeeService;
	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;
	/**
	 * <p>Title: listEmployee</p>  
	 * <p>Description: 查看所有分校信息</p>  
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listEmployee")
	public ModelAndView listEmployee(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		List<Employee> employeeList = employeeService.listEmployee(page);			//列出员工列表
		mv.setViewName("employee/employee_list");
		mv.addObject("employeeList", employeeList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	@RequestMapping(value="/goViewEmployee")
	public ModelAndView goViewEmployee()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long employeeId = pd.getLong("employeeId");
		Employee employee =employeeService.findById(employeeId);
		mv.setViewName("employee/employee_view");
		mv.addObject("employee", employee);
		return mv;
	}
	
	/**
	 * <p>Title: goAddU</p>  
	 * <p>Description: 跳转到新增员工页</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddEmployee")
	public ModelAndView goAddEmployee()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String personTypeCode = Constants.getCQT_RYFL_BM();
		//获取职员的类别信息
		dictionariesService.listPersonType(personTypeCode);
		//获取职员的工作岗位
		
		
		
		mv.setViewName("employee/employee_edit");
		mv.addObject("msg", "addEmployee");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * <p>Title: addEmployee</p>  
	 * <p>Description: 新增加员工</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addEmployee")
	public ModelAndView addEmployee(Employee employee)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		employee.setStatus(false);
		employeeService.add(employee);
		//mv.setViewName("save_result");
		mv.setViewName("redirect:/employee/listEmployee");
		return mv;
	}
	
	/**
	 * 去编辑员工信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditEmployee")
	public ModelAndView goEditEmployee()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long employeeId = pd.getLong("employeeId");
		Employee employee =employeeService.findById(employeeId);
		mv.setViewName("employee/employee_edit");
		mv.addObject("employee", employee);
		mv.addObject("msg", "editEmployee");
		return mv;
	}
	
	@RequestMapping(value="/editEmployee")
	public ModelAndView editEmployee(Employee employee)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		employeeService.updateByIdSelective(employee);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除员工
	 * @param employee
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteEmployee")
	public ModelAndView deleteEmployee()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		Long employeeId = pd.getLong("employeeId");
		if(null!=employeeId && !"".equals(employeeId)){
			employeeService.deleteById(employeeId);
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	@RequestMapping(value="/deleteAllEmployee")
	@ResponseBody
	public Map<String,Object> deleteAllEmployee()throws Exception{
		PageData pd = this.getPageData();
		String employeeIds = pd.getString("employeeIds");
		if(null!=employeeIds && employeeIds.length()>0){
			String[] ids = employeeIds.split(",");
			Long[] _ids = new Long[ids.length];
			for(int i=0;i<ids.length;i++){
				_ids[i] = Long.valueOf(ids[i]);
			}
			employeeService.deleteByIds(_ids);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		return pd;
	}
}

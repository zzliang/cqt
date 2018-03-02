package com.cqt.service.system.dictionaries;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cqt.dao.DaoSupport;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;

/**  
 * <p>Title: DictionariesService</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Service("dictionariesService")
public class DictionariesService{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	//通过ParentId获取所有下级机构
	public List<PageData> listByPid(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("DictionariesMapper.listByPid", pd);
	}
	
	//通过ZD_ID获取所有下级机构
	public PageData listById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DictionariesMapper.listById", pd);
	}
	
	//通过id获取数据
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DictionariesMapper.findById", pd);
	}
	
	//查询总数
	public PageData findCount(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DictionariesMapper.findCount", pd);
	}
	
	//查询某编码
	public PageData findBmCount(PageData pd) throws Exception {
		return (PageData)dao.findForObject("DictionariesMapper.findBmCount", pd);
	}
	
	//列出同一父类id下的数据
	public List<PageData> dictListPage(Page page) throws Exception {
		return (List<PageData>)dao.findForList("DictionariesMapper.dictListPage", page);
	}
	
	//新增
	public void save(PageData pd)throws Exception{
		dao.save("DictionariesMapper.save", pd);
	}
	
	//修改
	public void edit(PageData pd)throws Exception{
		dao.update("DictionariesMapper.edit", pd);
	}
	
	//删除
	public void delete(PageData pd) throws Exception {
		dao.delete("DictionariesMapper.delete", pd);
	}
	
	/**------------------ 省份代码 ----------------------------**/
	
	//获取省份代码集合
	public List<Map<String,Integer>> listSfdm(String bm) throws Exception {
		bm=bm+"_";
		return (List<Map<String,Integer>>)dao.findForList("DictionariesMapper.sfdmList", bm);
	}
	
	/**------------------ 省份代码 ----------------------------**/
	
	
	/**------------------ 公司代码 ----------------------------**/
	
	public List<Map<String,Integer>> listCompany(String bm) throws Exception {
		bm=bm+"_";
		return (List<Map<String,Integer>>)dao.findForList("DictionariesMapper.companyList", bm);
	}
	
	/**------------------ 公司代码 ----------------------------**/
	
	/**------------------ 学校代码 ----------------------------**/
	
	public List<Map<String,Integer>> listSchool(String bm) throws Exception {
		bm=bm+"_";
		return (List<Map<String,Integer>>)dao.findForList("DictionariesMapper.schoolList", bm);
	}
	
	/**------------------ 学校代码 ----------------------------**/
	
	/**------------------ 人员分类 ----------------------------**/
	
	public List<Map<String,Integer>> listPersonType(String bm) throws Exception {
		bm=bm+"_";
		return (List<Map<String,Integer>>)dao.findForList("DictionariesMapper.personTypeList", bm);
	}
	
	/**------------------ 人员分类 ----------------------------**/
}

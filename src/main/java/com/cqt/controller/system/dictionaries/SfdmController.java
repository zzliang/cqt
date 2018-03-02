package com.cqt.controller.system.dictionaries;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cqt.commons.Constants;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.system.Dictionaries;
import com.cqt.service.system.dictionaries.DictionariesService;

/**  
 * <p>Title: SfdmController</p>  
 * <p>Description: </p>  
 * @author onetime  
 * @date 2017年12月30日  
 */ 
@Controller
@RequestMapping(value="/sfdm")
public class SfdmController extends BaseController {

	@Resource(name="dictionariesService")
	private DictionariesService dictionariesService;

	/**
	 * 获取所有省份代码
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listSfdm")
	@ResponseBody
	public Object SFDMList() throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Integer>> sfdm = dictionariesService.listSfdm(Constants.getCQT_SFDM_BM());
		map.put("SFDMS", sfdm);
		return map;
	}
}

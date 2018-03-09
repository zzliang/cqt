package com.cqt.controller.school;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.Constants;
import com.cqt.commons.IO;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.School;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.school.SchoolService;
import com.cqt.service.system.dictionaries.DictionariesService;

@Controller
@RequestMapping(value = "/school")
public class SchoolController extends BaseController {

	@Resource
	public SchoolService schoolService;
	@Resource(name = "dictionariesService")
	private DictionariesService dictionariesService;

	/**
	 * 查看分校信息列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		String keyWord = pd.getString("KEYWORD"); // 关键词检索
		if (null != keyWord && !"".equals(keyWord)) {
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}

		pd.put("schoolId", "");
		page.setPd(pd);
		List<School> schoolList = schoolService.listSchool(page); // 列出学校列表
		mv.addObject("schoolList", schoolList);
		mv.setViewName("school/school_list");

		return mv;
	}
	
	/**
	 * 去查看分校信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goView")
	public ModelAndView goView() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String schoolId = pd.getString("schoolId");
		School school = schoolService.findById(Long.parseLong(schoolId));
		mv.addObject("school", school);
		mv.setViewName("school/school_view");
		return mv;
	}

	/**
	 * 去添加分校信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		List<Map<String, Integer>> sfdmList = dictionariesService.listSfdm(Constants.getCQT_SFDM_BM());
		mv.addObject("sfdmList", sfdmList);
		mv.addObject("action", "add");
		mv.setViewName("school/school_edit");
		return mv;
	}

	/**
	 * 添加分校信息
	 * @param school
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add")
	public ModelAndView add(School school) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();

		schoolService.add(school);
		mv.setViewName("redirect:/school/listSchool");
		return mv;
	}

	/**
	 * 去编辑学校信息
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String schoolId = pd.getString("schoolId");
		School school = schoolService.findById(Long.parseLong(schoolId));
		mv.addObject("school", school);
		List<Map<String, Integer>> sfdmList = dictionariesService.listSfdm(Constants.getCQT_SFDM_BM());
		mv.addObject("sfdmList", sfdmList);
		mv.setViewName("school/school_edit");
		mv.addObject("action", "edit");
		return mv;
	}
	
	/**
	 * 编辑学校信息
	 * @param school
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit(School school) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		schoolService.updateById(school);
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除学校
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		PageData pd = this.getPageData();
		try {
			String schoolId = pd.getString("schoolId");
			if (null != schoolId && !"".equals(schoolId)) {
				schoolService.deleteById(Long.parseLong(schoolId));
			}
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			IO.close(out);
		}
	}
	
	/**
	 * 批量删除所有选中的学校信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Map<String, Object> deleteAll() throws Exception {
		PageData pd = this.getPageData();
		String schoolIds = pd.getString("schoolIds");
		if (null != schoolIds && schoolIds.length() > 0) {
			String[] ids = schoolIds.split(",");
			Long[] _ids = new Long[ids.length];
			for (int i = 0; i < ids.length; i++) {
				_ids[i] = Long.valueOf(ids[i]);
			}
			schoolService.deleteByIds(_ids);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		return pd;
	}
}

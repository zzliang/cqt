package com.cqt.controller.courseSchedule;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cqt.commons.CQTUtil;
import com.cqt.commons.Const;
import com.cqt.commons.E;
import com.cqt.commons.SessionContext;
import com.cqt.commons.excel.ParseExcel;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseConfig;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.entity.util.WeekInfo;
import com.cqt.plugin.paging.Page;
import com.cqt.plugin.paging.PageData;
import com.cqt.service.course.CourseConfigService;
import com.cqt.service.course.CourseScheduleRunService;
import com.cqt.service.course.CourseScheduleService;
import com.cqt.service.course.CourseService;
import com.cqt.util.CollectionUtil;
import com.cqt.util.DateUtil;
import com.cqt.util.FileUpload;
import com.cqt.util.PathUtil;
import com.cqt.util.Tools;
import com.cqt.util.UuidUtil;

@Controller
@RequestMapping(value="/courseSchedule")
public class CourseScheduleController extends BaseController{
	
	String menuUrl = "courseSchedule.do"; //菜单地址(权限用)
	@Resource
	public CourseService courseService;
	@Resource
	public CourseScheduleService courseScheduleService;
	@Resource
	public CourseScheduleRunService courseScheduleRunService;
	@Resource
	public CourseConfigService courseConfigService;
	
	/**
	 * 去导入课程表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goImport")
	public ModelAndView goImport()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("courseschedule/importCourseSchedule");
		return mv;
	}
	
	/**
	 * 导入课程表Excel
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/importExcel")
	@ResponseBody
	public Map<String,Object> importExcel(@RequestParam(value="excel",required=false) MultipartFile file) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		//if(!Jurisdiction.hasJurisdiction(menuUrl)){return null;}
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.EXCELPATHFILE;							//excel文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "courseSchedule");						//执行上传
			
			PageData parms = this.getPd();
			parms.put("schoolId", new Long(1L));
			parms.put("classesId", new Long(1L));
			
			List<CourseSchedule> courseSchedules = null;
			List<String> errors = new ArrayList<String>();
			//courseSchedules = ParseExcel.readExcel(filePath, fileName, parms, errors);
			courseSchedules = ParseExcel.readExcel(filePath, fileName, parms);
			//判断指定月份的课程表是否已上传
			String courseDate = courseSchedules.get(0).getCourseDate();
			PageData p1 = this.getPd();
			p1.put("courseDate", courseDate);
			int count = courseScheduleService.findCount(p1);
			if(count>0){
				map.put("msg", "fail");
				errors.add(courseDate+"的课程表已存在！");
				map.put("errors", errors);
			}else{
				courseScheduleService.add(courseSchedules);
				map.put("msg", "success");
			}
			
			/*if(null==errors || errors.isEmpty()){
				map.put("msg", "success");
			}else{
				map.put("msg", "fail");
				map.put("errors", errors);
			}*/
		}
		//mv.setViewName("save_result");
		return map;
	}
	
	/**
	 * 查看课程表列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String keyWord = pd.getString("KEYWORD");	//关键词检索 
		if(null != keyWord && !"".equals(keyWord)){
			keyWord = keyWord.trim();
			pd.put("KEYWORD", keyWord);
		}
		page.setPd(pd);
		List<CourseSchedule> courseScheduleList = courseScheduleService.listCourseScheduleGroup(page);	//列出课程配置
		mv.setViewName("courseschedule/courseSchedule_list");
		mv.addObject("courseScheduleList", courseScheduleList);
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	/**
	 * ajax课程表上周，本周，下周切换
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajaxUserCourseSchedule")
	@ResponseBody
	public Map<String,Object>  ajaxUserCourseSchedule() throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		String courseScheduleId = pd.getString("courseScheduleId");
		String courseDate = pd.getString("courseDate");
		String weekNum = pd.getString("weekNum");	//标识用户点击的是上周，本周，下周哪个按钮
		String type = pd.getString("type");			//是否存在指定月份的课程表
		boolean isExisData = true; 
		
		PageData parms = this.getPd();	//查询条件参数集合
		parms.put("courseScheduleId", courseScheduleId);
		parms.put("courseDate", courseDate);
		parms.put("schoolId", "");
		parms.put("classesId", "");
		
		//通过coursedate获取课程表的配置信息
		CourseConfig courseConfig = courseConfigService.findByCourseDate(courseDate);
		
		if(Tools.notEmpty(courseScheduleId) && Tools.notEmpty(courseDate) && Tools.notEmpty(type) && Tools.notEmpty(weekNum)){
			String[] ymw = this.getYMW(courseConfig, weekNum, type);//获取上周，下周，本周的yyyy-MM日期和周次
			weekNum = ymw[1];
			if("0".equals(weekNum)){	//为0值时说明是上一周或下一周跨月问题
				courseConfig = courseConfigService.findByCourseDate(ymw[0]);
				if(null == courseConfig){
					//如果不存在指定时间的课表信息给出提示信息
					isExisData = false;
					result.put("msg", "未找到所要查找月份的课程表信息，请确认相应月份的课程表正常上传！");
				}else{
					ymw = this.getYMW(courseConfig, "0", type);
				}
			}
			
			if(isExisData){	
				courseDate = ymw[0];
				weekNum = ymw[1];
				parms.put("courseDate", courseDate);
				//切换课程表时需要获取新的课程表, 根据班级名称与课程表年月查询班级不同月份的课程表(条件：现在课程表ID,要显示的课程表的年月)
				CourseSchedule newCs = courseScheduleRunService.findNewCourseSchedule(parms);
				if(null == newCs){
					//如果不存在指定时间的课表信息给出提示信息
					isExisData = false;
					result.put("msg", "未找到所要查找月份的课程表信息，请确认相应月份的课程表正常上传！");
				}else{
					//获取课程列表中的第一个班级的课程表信息
					parms.put("courseScheduleId", newCs.getCourseScheduleId()); //更新新月份的课表Id
					parms.put("week",weekNum);
					CourseSchedule courseSchedule = courseScheduleRunService.findByMap(parms);
					List<List<CourseItem>> courseRowsAndCols = CQTUtil.parseCourseScheduleWithItem(courseSchedule);
					courseSchedule.setCourseRowsAndCols(courseRowsAndCols);
					result.put("courseSchedule", courseSchedule);
					result.put("courseDate", courseDate);
				}
			}
			
			if(isExisData){
				String[] seDate = DateUtil.getWeekStartandEndDate2(courseConfig.getStartDate(),Integer.parseInt(weekNum));
				String sDate = seDate[0];
				String eDate = seDate[1];
				List<WeekInfo> lstWeekInfo = CQTUtil.getWeekInfo(sDate,eDate);
				result.put("lstWeekInfo", lstWeekInfo);
			}
		}else{
			isExisData = false;
			result.put("msg", "参数错误，请检查参数值是否正确！");
		}
		
		result.put("isExisData", isExisData);
		result.put("type", type);
		result.put("weekNum", weekNum);
		return result;
	}
	
	/**
	 * 去查看职员课程表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUserCourseSchedule")
	public ModelAndView goUserCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<CourseSchedule> courseScheduleList = null;
		PageData pd = this.getPageData();
		//职员默认查看课程表是按当前时间所在的周查看,如果当前日期没有课程表查看最新课程表
		String[] ymw = this.getYMW(null, null, "today");
		if(null!=ymw){
			pd.put("courseDate", ymw[0]);
			
			//获取老师相关班级课程表信息,不包含课程内容，并按课程表的英文名称排序
			pd.put("schoolId", SessionContext.getUser().getSchoolId());
			courseScheduleList = courseScheduleRunService.listCourseScheduleRunByMap(pd);//查询指定年月的课程表班级信息
			if(null != courseScheduleList && !courseScheduleList.isEmpty()){
				courseScheduleList = CQTUtil.sortListCourseSchedule(courseScheduleList);
				String csId = courseScheduleList.get(0).getCourseScheduleId();
				mv.addObject("courseScheduleId", csId); //默认选中的班级课程表
				mv.addObject("courseDate",  ymw[0]);
			}
			mv.addObject("courseScheduleList", courseScheduleList);
		}else{
			//处理在没有任何课程表时或者是上传了课程表还未设置课程表配置时，运行的课程表中无任何数据的情况 
			mv.addObject("status", "fail");
			mv.addObject("msg", "未找到任何课程表信息，请检查是否上传过课程表或上传了课程表还未设置！");
		}
		mv.setViewName("courseschedule/userCourseSchedule");
		return mv;
	}
	
	/**
	 * ajax课程表上周，本周，下周切换
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajaxTeacherCourseSchedule")
	@ResponseBody
	public Map<String,Object>  ajaxTeacherCourseSchedule() throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		List<CourseSchedule> list = null;
		PageData pd = this.getPageData();
		String courseDate = pd.getString("courseDate");
		String weekNum = pd.getString("weekNum");	//标识用户点击的是上周，本周，下周哪个按钮
		String type = pd.getString("type");			//是否存在指定月份的课程表
		boolean isExisData = true; 
		
		PageData parms = this.getPd();	//查询条件参数集合
		parms.put("courseDate", courseDate);
		parms.put("schoolId", "");
		
		//通过coursedate获取课程表的配置信息
		CourseConfig courseConfig = courseConfigService.findByCourseDate(courseDate);
		
		if(Tools.notEmpty(courseDate) && Tools.notEmpty(weekNum) && Tools.notEmpty(type)){
			String[] ymw = this.getYMW(courseConfig, weekNum, type);//获取上周，下周，本周的yyyy-MM日期和周次
			weekNum = ymw[1];
			if("0".equals(weekNum)){	//为0值时说明是上一周或下一周跨月问题
				courseConfig = courseConfigService.findByCourseDate(ymw[0]);
				if(null == courseConfig){
					//如果不存在指定时间的课表信息给出提示信息
					isExisData = false;
					result.put("msg", "未找到所要查找月份的课程表信息，请确认相应月份的课程表正常上传！");
				}else{
					ymw = this.getYMW(courseConfig, "0", type);
				}
			}
			
			if(isExisData){	
				courseDate = ymw[0];
				weekNum = ymw[1];
				pd.put("courseDate", courseDate);
				pd.put("week", weekNum);
				pd.put("teacherName", "魏苗");
				List<CourseItem> listTeacherWeekCourse = new ArrayList<CourseItem>();
				list = courseScheduleRunService.listCourseScheduleRunWithItemByMap(pd);//获取教师一周的所有课程信息
				if(null == list || list.isEmpty()){
					//如果不存在指定时间的课表信息给出提示信息
					isExisData = false;
					result.put("msg", "未找到所要查找月份的课程表信息，请确认相应月份的课程表正常上传！");
				}else{
					for(CourseSchedule cs:list){
						List<CourseItem> lstCourseItem = cs.getLstCourseItem();
						for(CourseItem ci:lstCourseItem){
							ci.setClassName(cs.getClassName());
						}
						listTeacherWeekCourse.addAll(lstCourseItem);
					}
					List<List<CourseItem>> courseRowsAndCols = CQTUtil.parseListCourseItem(listTeacherWeekCourse);
					result.put("courseRowsAndCols", courseRowsAndCols);
					result.put("courseDate", courseDate);
				}
			}
			
			if(isExisData){
				String[] seDate = DateUtil.getWeekStartandEndDate2(courseConfig.getStartDate(),Integer.parseInt(weekNum));
				String sDate = seDate[0];
				String eDate = seDate[1];
				List<WeekInfo> lstWeekInfo = CQTUtil.getWeekInfo(sDate,eDate);
				result.put("lstWeekInfo", lstWeekInfo);
			}
		}else{
			isExisData = false;
			result.put("msg", "参数错误，请检查参数值是否正确！");
		}
		
		result.put("isExisData", isExisData);
		result.put("type", type);
		result.put("weekNum", weekNum);
		return result;
	}
	
	/**
	 * 去查看教师课程表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goTeacherCourseSchedule")
	public ModelAndView goTeacherCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		//教师默认查看课程表是按当前时间所在的周查,如果当前日期没有课程表查看最新课程表
		String[] ymw = this.getYMW(null, null, "today");
		if(null!=ymw){
			mv.addObject("courseDate", ymw[0]);
			mv.addObject("week", ymw[1]);
		}else{
			//处理在没有任何课程表时或者是上传了课程表还未设置课程表配置时，运行的课程表中无任何数据的情况 
			mv.addObject("status", "fail");
			mv.addObject("msg", "未找到任何课程表信息，请检查是否上传过课程表或上传了课程表还未设置！");
		}
		mv.setViewName("courseschedule/teacherCourseSchedule");
		return mv;
	}
	
	/**
	 * 管理者查看不同班级的课程表切换
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajaxOpertorCourseSchedule")
	@ResponseBody
	public Map<String,Object> ajaxOpertorCourseSchedule() throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		String courseScheduleId = pd.getString("courseScheduleId");
		String courseDate = pd.getString("courseDate");
		if(Tools.notEmpty(courseScheduleId) && Tools.notEmpty(courseDate)){
			//获取课程列表中的第一个班级的课程表信息,包含课程表项内容(条件：课程表ID,课程表的年份月份,学校ID,班级ID)
			pd.put("schoolId", "");
			pd.put("classesId", "");
			CourseSchedule courseSchedule = courseScheduleService.findByMap(pd);
			List<List<CourseItem>> courseRowsAndCols = CQTUtil.parseCourseScheduleWithItem(courseSchedule);
			courseSchedule.setCourseRowsAndCols(courseRowsAndCols);
			result.put("courseSchedule", courseSchedule);
		}
		
		//计算课程表的表头时间，以查看的课程内容时间来处理
		/*String ymw[] = DateUtil.getYearMonthWeekDown(courseDate);				//如果只有年月，按月的第一个星期一为第一周返回周次
		String[] seDate = DateUtil.getWeekStartandEndDateExt(ymw[0],ymw[1]);	//获取指定月份和当月的周次计算一周的开始与结束时间	
		String weekNum = "1"; 
		String sDate = seDate[0];
		String eDate = seDate[1];
		List<WeekInfo> lstWeekInfo = CQTUtil.getWeekInfo(sDate,eDate);		//根据一周的开始与结束时间计算出一周的具体每天的日期与星期几
		 */		
		List<WeekInfo> lstWeekInfo = CQTUtil.getWeekInfo2();
		//result.put("weekNum", weekNum);
		result.put("lstWeekInfo", lstWeekInfo);
		
		return result;
	}
	
	/**
	 * 去查看管理员课程表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goOpertorCourseSchedule")
	public ModelAndView goOpertorCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<CourseSchedule> courseScheduleList = null;
		PageData pd = this.getPageData();
		//导入成功后查看上传的课程表信息
		String cDate = courseScheduleService.findMaxCourseDate();
		pd.put("courseDate", cDate);
		//查看上传的课程表信息,不包含课程内容，并按课程表的英文名称排序(条件：学校ID,课程表的年月)
		pd.put("schoolId", "1");
		courseScheduleList = courseScheduleService.listCourseScheduleByMap(pd);
		courseScheduleList = CQTUtil.sortListCourseSchedule(courseScheduleList);
		if(null != courseScheduleList && !courseScheduleList.isEmpty()){
			String csId = courseScheduleList.get(0).getCourseScheduleId();
			mv.addObject("courseScheduleId", csId);
			mv.addObject("courseDate", cDate);
		}
		mv.addObject("courseScheduleList", courseScheduleList);
		
		mv.setViewName("courseschedule/opertorCourseSchedule");
		//mv.setViewName("course/importCourseSchedule");
		return mv;
	}
	
	
	/**
	 * 去设置课程表的显示方式
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goSetCourseSchedule")
	public ModelAndView goSetCourseSchedule()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		String courseDate = pd.getString("courseDate");
		CourseConfig courseConfig = new CourseConfig();
		courseConfig.setCourseDate(courseDate);
		mv.addObject("action", "courseSchedule/setCourseSchedule");
		mv.addObject("courseConfig", courseConfig);
		
		mv.setViewName("courseconfig/courseConfig_edit");
		return mv;
	}
	
	/**
	 * 设置课程表的显示方式
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/setCourseSchedule")
	public ModelAndView setCourseSchedule()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		SimpleDateFormat sdfMonth = new SimpleDateFormat("yyyy-MM");
		SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
		CourseConfig courseConfig = new CourseConfig();
		Long courseConfigId = pd.getLong("courseConfigId");
		courseConfig.setCourseDate(pd.getString("courseDate"));
		Date sDate = sdfDay.parse(pd.getString("startDate"));
		Integer weeks = pd.getInt("weeks");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sDate);
		cal.add(Calendar.DAY_OF_MONTH, 7*weeks);
		Date eDate = cal.getTime();
		
		courseConfig.setStartDate(sDate);
		courseConfig.setEndDate(eDate);
		courseConfig.setWeeks(weeks);
		
		PageData pd2 = new PageData();
		pd2.put("courseDate", pd.getString("courseDate"));
		if(-1L==courseConfigId){
			//添加课程表的配置
			courseConfigService.add(courseConfig);
			handlerCourseItemRun(pd2,weeks,0);
		}else{
			//修改课程表的配置
			courseConfig.setCourseConfigId(courseConfigId);
			courseConfigService.updateByIdSelective(courseConfig);
			handlerCourseItemRun(pd2,weeks,1);
		}
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 内部处理课程表数据
	 * @param pd
	 * @param weeks
	 * @param type
	 * @throws Exception
	 */
	private void handlerCourseItemRun(PageData pd, int weeks, int type) throws Exception{
		//处理运行的课程表与课程表项的数据信息
		List<CourseSchedule> courseScheduleRunList = courseScheduleService.listCourseScheduleWithItemByMap(pd);//查询指定年月的课程表信息集合
		if(type==0){
			courseScheduleRunService.add(courseScheduleRunList);
		}else{
			courseScheduleRunService.deleteCourseItemRunByIds(courseScheduleRunList);
		}
		
		List<CourseItem> listCourseItemByMonth = new ArrayList<CourseItem>();
		for(CourseSchedule cs : courseScheduleRunList){
			List<CourseItem> listCourseItem = cs.getLstCourseItem();
			//通过设置的周数生成一月的课程信息
			for(int i=1;i<=weeks;i++){
				List<CourseItem> citems = CollectionUtil.deepCopy(listCourseItem);
				for(CourseItem item : citems){
					item.setCourseItemId(UuidUtil.get32UUID());
					item.setWeek(i);
				}
				listCourseItemByMonth.addAll(citems);
			}
		}
		courseScheduleRunService.addCourseItems(listCourseItemByMonth);//将生成的一月课程信息保存到运行课程表项中
	}
	
	/**
	 * 通过课程表配置信息计算要显示X年X月X周的课程表信息
	 * @param courseConfig
	 * @param weekNum
	 * @param type
	 * @return
	 * @throws Exception
	 */
	private String[] getYMW(CourseConfig courseConfig, String weekNum, String type) throws Exception{
		String[] ymw = new String[2];
		if(E.WEEK_TYPE.PREV.name().toLowerCase().equals(type)){
			ymw = CQTUtil.getUpOrNextWeek(courseConfig, weekNum, -1);
		}else if(E.WEEK_TYPE.NEXT.name().toLowerCase().equals(type)){
			ymw = CQTUtil.getUpOrNextWeek(courseConfig, weekNum, 1);
		}else if(E.WEEK_TYPE.TODAY.name().toLowerCase().equals(type)){
			CourseConfig ccfg = courseConfigService.findByNow();
			//Integer week = 1;
			if(null == ccfg){//如果当前日期的课程表未配置使用最新的课程表信息显示，并显示为第一周
				String cDate = courseScheduleRunService.findMaxCourseDate();
				if(null==cDate)return null;
				ccfg = courseConfigService.findByCourseDate(cDate);
				weekNum = "1";
			}else{
				weekNum = DateUtil.getCurWeek(ccfg.getStartDate())+"";
			}
			ymw[0] = ccfg.getCourseDate();
			ymw[1] = weekNum;
			
			if(null!=courseConfig){
				BeanUtils.copyProperties(ccfg, courseConfig);
			}
		}
		return ymw;
	}
	
}

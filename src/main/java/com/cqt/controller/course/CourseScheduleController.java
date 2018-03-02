package com.cqt.controller.course;

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
import com.cqt.commons.excel.ParseExcel;
import com.cqt.controller.base.BaseController;
import com.cqt.entity.CourseConfig;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.entity.util.WeekInfo;
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
@RequestMapping(value="/course")
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
	 * <p>Title: importExcel</p>  
	 * <p>Description: 导入外部Excel课程表</p>  
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/importCourseSchedule")
	@ResponseBody
	public Map<String,Object> importExcel(@RequestParam(value="excel",required=false) MultipartFile file) throws Exception{
		//ModelAndView mv = this.getModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		//if(!Jurisdiction.hasJurisdiction(menuUrl)){return null;}
		if (null != file && !file.isEmpty()) {
			
			String filePath = PathUtil.getClasspath() + Const.EXCELPATHFILE;							//excel文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "courseSchedule");						//执行上传
			
			Map<String,Object> parms = this.getMap();
			parms.put("schoolId", new Long(1L));
			parms.put("classesId", new Long(1L));
			
			List<CourseSchedule> courseSchedules = null;
			List<String> errors = new ArrayList<String>();
			//courseSchedules = ParseExcel.readExcel(filePath, fileName, parms, errors);
			courseSchedules = ParseExcel.readExcel(filePath, fileName, parms);
			courseScheduleService.add(courseSchedules);
			
			if(null==errors || errors.isEmpty()){
				map.put("msg", "success");
			}else{
				map.put("msg", "fail");
				map.put("errors", errors);
			}
		}
		//mv.setViewName("save_result");
		return map;
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
		
		Map<String,Object> parms = this.getMap();	//查询条件参数集合
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
	 * 职员查看课程表信息
	 * 1：职员查看的课程表展示为按班级显示一周的所有教师课程按排
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUserCourseSchedule")
	public ModelAndView goUserCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<CourseSchedule> listCourseSchedule = null;
		PageData pd = this.getPageData();
		//教师默认查看课程表是按当前时间所在的周查,如果当前日期没有课程表查看最新课程表
		String[] ymw = this.getYMW(null, null, "today");
		pd.put("courseDate", ymw[0]);
		
		//获取老师相关班级课程表信息,不包含课程内容，并按课程表的英文名称排序
		pd.put("schoolId", "");
		listCourseSchedule = courseScheduleRunService.listCourseScheduleRunByMap(pd);//查询指定年月的课程表班级信息
		if(null != listCourseSchedule && !listCourseSchedule.isEmpty()){
			listCourseSchedule = CQTUtil.sortListCourseSchedule(listCourseSchedule);
			String csId = listCourseSchedule.get(0).getCourseScheduleId();
			mv.addObject("courseScheduleId", csId); //默认选中的班级课程表
			mv.addObject("courseDate",  ymw[0]);
		}
		mv.setViewName("course/userCourseSchedule");
		mv.addObject("listCourseSchedule", listCourseSchedule);
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
		List<CourseSchedule> listCourseSchedule = null;
		PageData pd = this.getPageData();
		String courseDate = pd.getString("courseDate");
		String weekNum = pd.getString("weekNum");	//标识用户点击的是上周，本周，下周哪个按钮
		String type = pd.getString("type");			//是否存在指定月份的课程表
		boolean isExisData = true; 
		
		Map<String,Object> parms = this.getMap();	//查询条件参数集合
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
				pd.put("teacherName", "梁丽");
				List<CourseItem> listTeacherWeekCourse = new ArrayList<CourseItem>();
				listCourseSchedule = courseScheduleRunService.listCourseScheduleRunWithItemByMap(pd);//获取教师一周的所有课程信息
				if(null == listCourseSchedule || listCourseSchedule.isEmpty()){
					//如果不存在指定时间的课表信息给出提示信息
					isExisData = false;
					result.put("msg", "未找到所要查找月份的课程表信息，请确认相应月份的课程表正常上传！");
				}else{
					for(CourseSchedule cs:listCourseSchedule){
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
	 * 教师查看课程表信息
	 * 1：教师查看的课程表的展示为当前教师一周的所有班级课程信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goTeacherCourseSchedule")
	public ModelAndView goTeacherCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		//教师默认查看课程表是按当前时间所在的周查,如果当前日期没有课程表查看最新课程表
		String[] ymw = this.getYMW(null, null, "today");
		mv.setViewName("course/personCourseSchedule");
		mv.addObject("courseDate", ymw[0]);
		mv.addObject("week", ymw[1]);
		return mv;
	}
	
	/**
	 * 管理者查看不同班级的课程表切换
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/ajaxViewCourseSchedule")
	@ResponseBody
	public Map<String,Object> ajaxViewCourseSchedule() throws Exception{
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
		String ymw[] = DateUtil.getYearMonthWeekDown(courseDate);				//如果只有年月，按月的第一个星期一为第一周返回周次
		String[] seDate = DateUtil.getWeekStartandEndDateExt(ymw[0],ymw[1]);	//获取指定月份和当月的周次计算一周的开始与结束时间	
		String weekNum = "1"; 
		String sDate = seDate[0];
		String eDate = seDate[1];
		List<WeekInfo> lstWeekInfo = CQTUtil.getWeekInfo(sDate,eDate);		//根据一周的开始与结束时间计算出一周的具体每天的日期与星期几
		result.put("weekNum", weekNum);
		result.put("lstWeekInfo", lstWeekInfo);
		
		return result;
	}
	
	/**
	 * 管理者查看导入的课程表信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goViewCourseSchedule")
	public ModelAndView goViewCourseSchedule() throws Exception{
		ModelAndView mv = this.getModelAndView();
		List<CourseSchedule> listCourseSchedule = null;
		PageData pd = this.getPageData();
		//导入成功后查看上传的课程表信息
		String cDate = courseScheduleService.findMaxCourseDate();
		pd.put("courseDate", cDate);
		//查看上传的课程表信息,不包含课程内容，并按课程表的英文名称排序(条件：学校ID,课程表的年月)
		pd.put("schoolId", "1");
		listCourseSchedule = courseScheduleService.listCourseScheduleByMap(pd);
		listCourseSchedule = CQTUtil.sortListCourseSchedule(listCourseSchedule);
		if(null != listCourseSchedule && !listCourseSchedule.isEmpty()){
			String csId = listCourseSchedule.get(0).getCourseScheduleId();
			mv.addObject("courseScheduleId", csId);
			mv.addObject("courseDate", cDate);
		}
		//年月指定的课程表是否已设置
		CourseConfig courseConfig = courseConfigService.findByCourseDate(cDate);
		mv.addObject("courseConfig", courseConfig);
		
		mv.addObject("listCourseSchedule", listCourseSchedule);
		mv.setViewName("course/opertorCourseSchedule");
		//mv.setViewName("course/importCourseSchedule");
		return mv;
	}
	
	/**
	 * 打开上传课程表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadCourseSchedule")
	public ModelAndView goUploadCourseSchedule()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("course/uploadCourseSchedule");
		return mv;
	}
	
	/**
	 * 配置课程表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/courseConfig")
	@ResponseBody
	public PageData courseConfig()throws Exception{
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
			//添加使用的课程表（课程表与课程表项）
			List<CourseSchedule> listCourseSchedule = courseScheduleService.listCourseScheduleWithItemByMap(pd2);//查询指定年月的课程表信息集合
			courseScheduleRunService.add(listCourseSchedule);
			
			List<CourseItem> listCourseItemByMonth = new ArrayList<CourseItem>();
			for(CourseSchedule cs : listCourseSchedule){
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
		}else{
			//修改课程表的配置
			courseConfig.setCourseConfigId(courseConfigId);
			courseConfigService.updateByIdSelective(courseConfig);
			//修改使用的课程表（课程表与课程表项）
			//1:删除课程表项中指定年月的课程表项的信息
		}
		
		pd.put("msg", "success");
		return pd;
	}
	
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

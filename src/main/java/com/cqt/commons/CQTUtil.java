package com.cqt.commons;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cqt.entity.CourseConfig;
import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.entity.util.WeekInfo;
import com.cqt.util.DateUtil;

public class CQTUtil {
	/**
	 * 课程内容按索引值排序，得到一个时间段一周的课程内容
	 * @param lst
	 * @return
	 */
	public static List<CourseItem> sortListCourseItem(List<CourseItem> lst) {
		Collections.sort(lst, new Comparator<CourseItem>() {
			@Override
			public int compare(CourseItem o1, CourseItem o2) {
				return o1.getzIndex().compareTo(o2.getzIndex());
			}
		});
		return lst;
	}

	/**
	 * 不同时间段的课程按开始时间排序
	 * @param lst
	 */
	public static void sort2ListCourseSchedule(List<List<CourseItem>> lst) {
		Collections.sort(lst, new Comparator<List<CourseItem>>() {

			@Override
			public int compare(List<CourseItem> o1, List<CourseItem> o2) {
				Date d1 = null;
				Date d2 = null;
				try {
					SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
					d1 = sdf.parse(o1.get(0).getStartTime());
					d2 = sdf.parse(o2.get(0).getStartTime());
				} catch (Exception e) {
				}
				return new Long(d1.getTime()).compareTo(new Long(d2.getTime()));
			}

		});
	}

	/**
	 * 课程表按班级英文名称排序
	 * @param lst
	 * @return
	 */
	public static List<CourseSchedule> sortListCourseSchedule(List<CourseSchedule> lst) {
		Collections.sort(lst, new Comparator<CourseSchedule>() {
			@Override
			public int compare(CourseSchedule o1, CourseSchedule o2) {
				return o1.geteTitle().compareTo(o2.geteTitle());
			}
		});
		return lst;
	}
	
	/**
	 * 处理课程表中的课程内容
	 * @param courseSchedule
	 * @return
	 */
	public static List<List<CourseItem>> parseCourseScheduleWithItem(CourseSchedule courseSchedule) {
		return parseListCourseItem(courseSchedule.getLstCourseItem());
	}
	
	public static List<List<CourseItem>> parseListCourseItem(List<CourseItem> listCourseItem) {
		Map<String, List<CourseItem>> mapList = new HashMap<String, List<CourseItem>>();
		//循环处理课程内容信息，将课程内容按一天的时间段归类好一周的课程内容
		for (CourseItem item : listCourseItem) {
			int index = item.getzIndex();
			String time = item.getStartTime();
			switch (index) {
			case 0: //属于课间内容按排
				List<CourseItem> items0 = new ArrayList<CourseItem>();
				items0.add(item);
				mapList.put(time, items0);
				break;
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
				//以每天的开始时间为Map的Key,将对应的课程内容放入到对应的List集合当中，此时课程内容还未按周次排序
				if (mapList.containsKey(time)) {
					List<CourseItem> itemList = mapList.get(time);
					itemList.add(item);
				} else {
					List<CourseItem> items1 = new ArrayList<CourseItem>();
					items1.add(item);
					mapList.put(time, items1);
				}
				break;
			default:
				break;
			}
		}

		List<List<CourseItem>> courseRows = handlerMapList(mapList);
		//按时间的先后排序课程内容（确定了一天的课程按排是从最早的时间段开始执行）
		sort2ListCourseSchedule(courseRows);
		return courseRows;
	}
	
	private static List<List<CourseItem>> handlerMapList(Map<String, List<CourseItem>> mapList){
		List<List<CourseItem>> courseRows = new ArrayList<List<CourseItem>>();
		
		//按周次排序时间段内的课程内容（确定了一个时间段内周一到周五的课程内容）
		for (List<CourseItem> items : mapList.values()) {
			//此处处理教师查看自己的课程时，存在一个时间段一周中只有一节课或几节课，不为全周都有课时无法将课程内容与星期信息对应上
			int eSize = items.size();
			int zIndex = items.get(0).getzIndex();
			if(eSize<5 && zIndex!=0){
				List<CourseItem> cis = getInitListCourseitem(items.get(0).getStartTime(),items.get(0).getEndTime());
				for(CourseItem ci:items){
					for(CourseItem _ci:cis){
						if(_ci.getzIndex()==ci.getzIndex()){
							cis.remove(_ci);
							break;
						}
					}
				}
				//补全缺少的课程项
				items.addAll(cis);
			}
			
			courseRows.add(sortListCourseItem(items));
		}
		return courseRows;
	}
	
	/**
	 * 辅助补充没有课程内容的课程项数据，以便页面可以正常显示教师课程表
	 * @return
	 */
	private static List<CourseItem> getInitListCourseitem(String startTime,String endTime){
		List<CourseItem> cis = new ArrayList<CourseItem>();
		for(int i=1;i<6;i++){
			CourseItem ci = new CourseItem();
			ci.setzIndex(i);
			ci.setStartTime(startTime);
			ci.setEndTime(endTime);
			ci.setCourseName("");
			cis.add(ci);
		}
		return cis;
	}
	
	/**
	 * 通过给定的一周的开始与结束时间计算一周的信息
	 * 
	 * @param sDate	2017-10-9
	 * @param eDate	2017-10-15
	 * @return
	 * @throws ParseException
	 */
	public static List<WeekInfo> getWeekInfo(String sDate, String eDate) throws ParseException {
		List<WeekInfo> weeks = new ArrayList<WeekInfo>();
		Date begin = DateUtil.fomatDate(sDate);
		Date end = DateUtil.fomatDate(eDate);
		Calendar c = DateUtil.getLocalCalendar();
		c.setTime(begin);
		while (begin.getTime() <= end.getTime()) {
			WeekInfo wi = new WeekInfo();
			String dateStr = DateUtil.parseDate(begin);
			wi.setWeekDate(dateStr);
			String dateDesc = DateUtil.getDayWeek(begin);
			wi.setWeekDesc(dateDesc);
			weeks.add(wi);
			c.add(Calendar.DAY_OF_YEAR, 1);
			begin = c.getTime();
		}
		return weeks;
	}
	
	//===============================================================================================
	
	/**
	 * 通过课程表的配置信息计算上一周和下一周
	 * @param courseConfig
	 * @param week
	 * @param type
	 * @return
	 * @throws ParseException
	 */
	public static String[] getUpOrNextWeek(CourseConfig courseConfig,String week,int type) throws ParseException {
		int weekNum = Integer.parseInt(week);
		return getUpOrNextWeek(courseConfig,weekNum,type);
	}
	
	public static String[] getUpOrNextWeek(CourseConfig courseConfig,int week,int type) throws ParseException {
		String[] arr = new String[2];
		String courseDate = courseConfig.getCourseDate();
		int newWeek = 0;
		if(week!=0){
			SimpleDateFormat sdfMonth = new SimpleDateFormat("yyyy-MM");
			Calendar c = DateUtil.getLocalCalendar();
			c.setTime(sdfMonth.parse(courseDate));
			Integer maxWeekNum = courseConfig.getWeeks();
			if(type>0){		//下一周
				if(week==maxWeekNum){
					newWeek = 0;
					c.add(Calendar.MONTH, 1);
					courseDate = sdfMonth.format(c.getTime());
				}else{
					newWeek = week+1;
				}
			}else{			//上一周
				if(week==1){
					newWeek = 0;
					c.add(Calendar.MONTH, -1);
					courseDate = sdfMonth.format(c.getTime());
				}else{
					newWeek = week-1;
				}
			}
		}else{
			if(type>0){		//下一周
				newWeek = 1;
			}else{			//上一周
				newWeek = courseConfig.getWeeks();
			}
		}
		arr[0] = courseDate;
		arr[1] = newWeek+"";
		return arr;
	}
}

package com.cqt.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class DateUtil {
	// 用户类型
	public enum WEEK_TYPE {
		YEAR, MONTH
	};

	private final static SimpleDateFormat sdfYear = new SimpleDateFormat("yyyy");
	
	private final static SimpleDateFormat sdfMonth = new SimpleDateFormat("yyyy-MM");

	private final static SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");

	private final static SimpleDateFormat sdfDays = new SimpleDateFormat("yyyyMMdd");

	private final static SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private final static SimpleDateFormat sdfE = new SimpleDateFormat("E");

	/**
	 * 获取YYYY格式
	 * @return
	 */
	public static String getYear() {
		return sdfYear.format(new Date());
	}
	

	/**
	 * 获取YYYY-MM-DD格式
	 * @return
	 */
	public static String getDay() {
		return sdfDay.format(new Date());
	}
	
	/**
	 * 获取YYYYMMDD格式
	 * @return
	 */
	public static String getDays() {
		return sdfDays.format(new Date());
	}

	/**
	 * 获取YYYY-MM-DD HH:mm:ss格式
	 * @return
	 */
	public static String getTime() {
		return sdfTime.format(new Date());
	}
	
	/**
	 * 格式化日期:yyyy-MM-dd
	 * @param dateStr 
	 * @return
	 */
	public static Date fomatDate(String dateStr) {
		try {
			return sdfDay.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String parseDate(Date date) {
		return sdfDay.format(date);
	}
	
	/**
	 * 校验日期是否合法
	 * @return
	 */
	public static boolean isValidDate(String s) {
		try {
			sdfDay.parse(s);
			return true;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return false;
		}
	}

	/**
	 * 日期比较，如果s>=e 返回true 否则返回false
	 * @param s
	 * @param e
	 * @return
	 */
	public static boolean compareDate(String s, String e) {
		if (fomatDate(s) == null || fomatDate(e) == null) {
			return false;
		}
		return fomatDate(s).getTime() >= fomatDate(e).getTime();
	}
	
	/**
	 * 计算两个日期相关得到年数
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public static int getDiffYear(String startTime, String endTime) {
		try {
			long aa = 0;
			int years = (int) (((sdfDay.parse(endTime).getTime() - sdfDay.parse(startTime).getTime()) / (1000 * 60 * 60 * 24))/ 365);
			return years;
		} catch (Exception e) {
			// 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
			return 0;
		}
	}

	/**
	 * 计算两个日期相减得到天数
	 * @param beginDateStr
	 * @param endDateStr
	 * @return
	 */
	public static long getDaySub(String beginDateStr, String endDateStr) {
		long day = 0;
		java.util.Date beginDate = null;
		java.util.Date endDate = null;

		try {
			beginDate = sdfDay.parse(beginDateStr);
			endDate = sdfDay.parse(endDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		day = (endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60 * 1000);
		// System.out.println("相隔的天数="+day);

		return day;
	}

	/**
	 * 计算n天之后的日期
	 * @param days
	 * @return
	 */
	public static String getAfterDayDate(String days) {
		int daysInt = Integer.parseInt(days);
		Calendar canlendar = Calendar.getInstance(); // java.util包
		canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
		Date date = canlendar.getTime();
		String dateStr = sdfTime.format(date);
		return dateStr;
	}

	/**
	 * 计算n天之后是星期几
	 * @param days
	 * @return
	 */
	public static String getAfterDayWeek(String days) {
		int daysInt = Integer.parseInt(days);

		Calendar canlendar = Calendar.getInstance(); // java.util包
		canlendar.add(Calendar.DATE, daysInt); // 日期减 如果不够减会将月变动
		Date date = canlendar.getTime();
		String dateStr = sdfE.format(date);
		return dateStr;
	}
	
	public static Date parseTimeStr(String timeStr) {
		Calendar cal = null;
		if (null != timeStr && timeStr.indexOf(":") > 0) {
			cal = Calendar.getInstance();
			String times[] = timeStr.split(":");
			cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(times[0]));
			cal.set(Calendar.MINUTE, Integer.parseInt(times[1]));
		}
		return cal != null ? cal.getTime() : null;
	}
	
	/**
	 * 获取指定日期是星期几
	 * @param dateStr
	 * @return
	 * @throws ParseException
	 */
	public static String getDayWeek(String dateStr) throws ParseException{
		return getDayWeek(sdfDay.parse(dateStr));
	}
	
	public static String getDayWeek(Date date) throws ParseException{
		String day = sdfE.format(date);
		return day;
	}

	
	// ============================================================================================================
	/**
	 * 获取指定日期所属月的第几周
	 * 
	 * @param dateStr："yyyy-MM-dd"
	 * @return
	 * @throws ParseException
	 */
	public static int getWeekOfMonth() throws ParseException {
		return getWeekOfMonth(new Date());
	}
	
	public static int getWeekOfMonth(String dateStr) throws ParseException {
		Date date = sdfDay.parse(dateStr);
		return getWeekOfMonth(date);
	}

	public static int getWeekOfMonth(Date date) throws ParseException {
		Calendar calendar = getLocalCalendar();
		calendar.setTime(date);
		return calendar.get(Calendar.WEEK_OF_MONTH);
	}

	/**
	 * 获得指定日期的年月周
	 * 
	 * @param dateStr:yyyy-MM-dd or yyyy-MM
	 * @param type (year_年周，month_月周)
	 * @return arr[] arr[0]:yyyy-MM  arr[1]:月的第几周,参数为yyyy-MM的默认为第1周
	 * @throws ParseException
	 */
	public static String[] getYearMonthWeek() throws ParseException {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		return getLocalYearMonthWeek(c.getTime(), DateUtil.WEEK_TYPE.MONTH.name().toLowerCase());
	}

	public static String[] getYearMonthWeek(String dateStr) throws ParseException {
		int len = dateStr.split("-").length;
		Date date = null;
		date = sdfDay.parse(dateStr);
		return getLocalYearMonthWeek(date, DateUtil.WEEK_TYPE.MONTH.name().toLowerCase());
	}
	
	public static String[] getLocalYearMonthWeek(Date date, String type) throws ParseException {
		String[] arr = new String[2];
		Calendar calendar = getLocalCalendar();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);	//解决指定的日期为上个月最后一周时需要显示上个月的月分（例：2018-2-1  应该为2018-1第5周）
		arr[0] = sdfMonth.format(calendar.getTime());
		if ("year".equals(type.toLowerCase())) {
			arr[1] = calendar.get(Calendar.WEEK_OF_YEAR)+"";
		} else if ("month".equals(type.toLowerCase())) {
			arr[1] = getLocalWeekOfMonth(calendar.getTime())+"";
		}
		return arr;
	}
	
	/**
	 * 处理yyyy-MM日期的形式，月份的1号在上个月最后一周, 返回上个月的月份，周次返回上个月最大的周次。
	 * @param date
	 * @param type
	 * @return
	 * @throws ParseException
	 */
	
	public static String[] getYearMonthWeekUp(String dateStr) throws ParseException {
		int len = dateStr.split("-").length;
		Date date = null;
		if(len==2){//格式为yyyy-MM的日期字符串形式
			date = sdfMonth.parse(dateStr);
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			return getYearMonthWeekUp(c.getTime(),DateUtil.WEEK_TYPE.MONTH.name().toLowerCase());
		}
		return null;
	}
	
	public static String[] getYearMonthWeekUp(Date date, String type) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(date);
		c.set(Calendar.WEEK_OF_MONTH, 1);
		//c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);	
		if(!monthFirstDayIsMonday(date)){ //根据每月第一个星期一为本月第一周规则设置
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);	
		}
		arr[0] = sdfMonth.format(c.getTime());
		if ("year".equals(type.toLowerCase())) {
			arr[1] = c.get(Calendar.WEEK_OF_YEAR)+"";
		} else if ("month".equals(type.toLowerCase())) {
			arr[1] = c.get(Calendar.WEEK_OF_MONTH)+"";
		}
		return arr;
	}
	
	/**
	 * 处理yyyy-MM年月的形式，月份原样返回, 周次按月的第一个星期一所有的周次返回。
	 * @param date
	 * @param type
	 * @return
	 * @throws ParseException
	 */
	
	public static String[] getYearMonthWeekDown(String dateStr) throws ParseException {
		int len = dateStr.split("-").length;
		Date date = null;
		if(len==2){//格式为yyyy-MM的日期字符串形式
			date = sdfMonth.parse(dateStr);
			Calendar c = Calendar.getInstance();
			c.setTime(date);
			return getYearMonthWeekDown(c.getTime(),DateUtil.WEEK_TYPE.MONTH.name().toLowerCase());
		}
		return null;
	}
	
	public static String[] getYearMonthWeekDown(Date date, String type) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(date);
		
		if(monthFirstDayIsMonday(date)){ //根据每月第一个星期一为本月第一周规则设置
			c.set(Calendar.WEEK_OF_MONTH, 1);
		}else{
			c.set(Calendar.WEEK_OF_MONTH, 2);
		}
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);	
		arr[0] = sdfMonth.format(date);
		if ("year".equals(type.toLowerCase())) {
			arr[1] = c.get(Calendar.WEEK_OF_YEAR)+"";
		} else if ("month".equals(type.toLowerCase())) {
			arr[1] = c.get(Calendar.WEEK_OF_MONTH)+"";
		}
		return arr;
	}
	
	
	/**
	 * 获取周的开始，结束日期 [星期一为一周的开始]
	 * @param dateStr 2017-10
	 * @param week	  5
	 * @return
	 * @throws ParseException
	 */
	public static String[] getWeekStartandEndDate() throws ParseException {
		return getWeekStartandEndDate(new Date(),-1);
	}
	
	//dateStr格式:yyyy-MM-dd
	public static String[] getWeekStartandEndDate(String dateStr) throws ParseException {
		return getWeekStartandEndDate(sdfDay.parse(dateStr),-1); 
	}
	
	public static String[] getWeekStartandEndDate(String dateStr, String week) throws ParseException {
		return getWeekStartandEndDate(sdfMonth.parse(dateStr),Integer.parseInt(week));
	}
	
	public static String[] getWeekStartandEndDate(String dateStr, int week) throws ParseException {
		return getWeekStartandEndDate(sdfMonth.parse(dateStr),week);
	}
	
	public static String[] getWeekStartandEndDate(Date date, int week) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(date);
		if(week>0){
			if(monthFirstDayIsMonday(c.getTime())){	//指定月份的第一天是否是星期一
				c.set(Calendar.WEEK_OF_MONTH, week);
			}else{
				c.set(Calendar.WEEK_OF_MONTH, week+1);
			}
		}
		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
		arr[0] = sdfDay.format(c.getTime());
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		arr[1] = sdfDay.format(c.getTime());

		return arr;
	}
	
	public static String[] getWeekStartandEndDate2(Date date, int week) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(date);
		c.add(Calendar.DAY_OF_YEAR, (week-1)*7);
		arr[0] = sdfDay.format(c.getTime());
		c.add(Calendar.DAY_OF_YEAR, 7-1);
		arr[1] = sdfDay.format(c.getTime());

		return arr;
	}
	
	/**
	 * 根据指定周获取开始，结束日期
	 * @param ym 格式：2017-10  
	 * @param w 格式：5 
	 * @return
	 * @throws ParseException
	 */
	public static String[] getWeekStartandEndDateExt(String ym,String w) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(sdfMonth.parse(ym));
		c.set(Calendar.WEEK_OF_MONTH, Integer.valueOf(w));
		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
		arr[0] = sdfDay.format(c.getTime());
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		arr[1] = sdfDay.format(c.getTime());

		return arr;
	}

	/**
	 * 根据指定周获取开始，结束日期
	 * 
	 * @param yweek “2017-24”[2017年第24周的开始与结束日期]
	 * @return
	 */
	public static String[] getYWeekStartandEndDate(String year, int week) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.set(Calendar.YEAR, Integer.parseInt(year));
		c.set(Calendar.WEEK_OF_YEAR, week);
		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
		arr[0] = sdf.format(c.getTime());
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		c.getTime();
		arr[1] = sdf.format(c.getTime());

		return arr;
	}

	/**
	 * 获取指定月的第一天日期和最后一天日期
	 * 
	 * @param dateStr:"2017-03-15"
	 * @return arr[0] 第一天日期 ；arr[1]最后一天日期
	 * @throws ParseException
	 */
	public static String[] getMonthStartAndEndDate(String dateStr) throws ParseException {
		String[] arr = new String[2];
		Calendar c = Calendar.getInstance();
		c.setTime(sdfMonth.parse(dateStr));
		c.set(Calendar.DAY_OF_MONTH, 1);
		arr[0] = sdfDay.format(c.getTime());
		c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
		arr[1] = sdfDay.format(c.getTime());
		return arr;
	}

	/**
	 * 获取指定年的第一天日期和最后一天日期
	 * 
	 * @param dateStr:"2017-03-15"
	 * @return arr[0] 第一天日期 ；arr[1]最后一天日期
	 * @throws ParseException
	 */
	public static String[] getYearStartAndEndDate(String dateStr) throws ParseException {
		String[] arr = new String[2];
		Calendar c = Calendar.getInstance();
		c.setTime(sdfYear.parse(dateStr));
		c.set(Calendar.DAY_OF_YEAR, 1);
		arr[0] = sdfDay.format(c.getTime());
		c.set(Calendar.DAY_OF_YEAR, c.getActualMaximum(Calendar.DAY_OF_YEAR));
		arr[1] = sdfDay.format(c.getTime());
		return arr;
	}

	/**
	 * 获得该月第一天日期
	 * 
	 * @param year：2018
	 * @param month:5
	 * @return
	 */
	public static String getFirstDayOfMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();
		// 设置年份
		cal.set(Calendar.YEAR, year);
		// 设置月份
		cal.set(Calendar.MONTH, month - 1);
		// 获取某月最小天数
		int firstDay = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
		// 设置日历中月份的最小天数
		cal.set(Calendar.DAY_OF_MONTH, firstDay);
		// 格式化日期
		String firstDayOfMonth = sdfDay.format(cal.getTime());
		return firstDayOfMonth;
	}

	/**
	 * 获得该月最后一天的日期
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public static String getLastDayOfMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();
		// 设置年份
		cal.set(Calendar.YEAR, year);
		// 设置月份
		cal.set(Calendar.MONTH, month - 1);
		// 获取某月最大天数
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		// 设置日历中月份的最大天数
		cal.set(Calendar.DAY_OF_MONTH, lastDay);
		// 格式化日期
		String lastDayOfMonth = sdfDay.format(cal.getTime());
		return lastDayOfMonth;
	}
	
	/**
	 * 判断某年某月的第一天是否是星期一
	 * @param dateStr 2017-10
	 * @return
	 * @throws ParseException
	 */
	public static boolean monthFirstDayIsMonday(String dateStr) throws ParseException {
		return monthFirstDayIsMonday(sdfMonth.parse(dateStr));
	}
	
	public static boolean monthFirstDayIsMonday(Date date) throws ParseException {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_MONTH, 1);
		int num = c.get(Calendar.DAY_OF_WEEK)-1;
		return num==1?true:false;
	}
	
	/**
	 * 通过给定的年月和第几周计算上一周或下一周的开始与结束时间[日历规则为每个月的第一个星期一为本月的第一周]
	 * @param dateStr
	 * @param week
	 * @param type 小于0为上周，大于0为下周
	 * @return arr[0]:yyyy-MM   arr[1]:第几周
	 * @throws ParseException
	 */
	public static String[] getUpOrNextWeek(String dateStr,String week,int type) throws ParseException {
		int weekNum = Integer.parseInt(week);
		return getUpOrNextWeek(dateStr,weekNum,type);
	}
	
	public static String[] getUpOrNextWeek(String dateStr,int week,int type) throws ParseException {
		String[] arr = new String[2];
		Calendar c = getLocalCalendar();
		c.setTime(sdfMonth.parse(dateStr));
		if(monthFirstDayIsMonday(c.getTime())){ //
			c.set(Calendar.WEEK_OF_MONTH, week);
		}else{
			c.set(Calendar.WEEK_OF_MONTH, week+1);
		}
		int newWeek = 0;
		if(type>0){
			c.add(Calendar.WEEK_OF_MONTH, 1);
			if(!dateStr.equals(sdfMonth.format(c.getTime()))){
				c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			}
			newWeek = getLocalWeekOfMonth(c.getTime());
		}else{
			c.add(Calendar.WEEK_OF_MONTH, -1);
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			if(monthFirstDayIsMonday(c.getTime())){
				newWeek = c.get(Calendar.WEEK_OF_MONTH);
			}else{
				newWeek = c.get(Calendar.WEEK_OF_MONTH)-1;
			}
		}
		
		Date newDate = c.getTime();
		arr[0] = sdfMonth.format(newDate);
		arr[1] = newWeek+"";
		return arr;
	}
	
	/**
	* <p>Title: getLocalWeekOfMonth</p>
	* <p>Description: 获取当前日期在本月的周次</p>
	* @return
	* @throws ParseException
	 */
	public static int getLocalWeekOfMonth() throws ParseException{
		return getLocalWeekOfMonth(new Date());
	}
	
	/**
	* <p>Title: getLocalWeekOfMonth</p>
	* <p>Description: 获取指定日期在本月的周次</p>
	* @param date
	* @return
	* @throws ParseException
	 */
	public static int getLocalWeekOfMonth(Date date) throws ParseException{
		int weekNum = 0;
		Calendar c = getLocalCalendar();
		c.setTime(date);
		if(monthFirstDayIsMonday(date)){
			weekNum = c.get(Calendar.WEEK_OF_MONTH);
		}else{
			weekNum = c.get(Calendar.WEEK_OF_MONTH);
			if(weekNum==1){
				c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);
				if(monthFirstDayIsMonday(c.getTime())){
					weekNum = c.get(Calendar.WEEK_OF_MONTH);
				}else{
					weekNum = c.get(Calendar.WEEK_OF_MONTH)-1;
				}
			}else{
				weekNum--;
			}
		}
		return weekNum;
	}
	
	/**
	* <p>Title: getLocalCalendar</p>
	* <p>Description: 获取本地设置的日期对象，设置为每周从星期一开始，[默认从星期天开始]</p>
	* @return
	 */
	public static Calendar getLocalCalendar() {
		Calendar c = Calendar.getInstance();
		c.setFirstDayOfWeek(Calendar.MONDAY); // 每周从星期一开始
		return c;
	}
	
	/**
	* <p>Title: getDateDiff</p>
	* <p>Description: 两个日期相关天数</p>
	* @param startDate
	* @param endDate
	* @return
	 */
	public static long getDateDiff(String startDate, String endDate) {
		long diff = 0;
		try {
			Date date1 = sdfDay.parse(startDate);
			Date date2 = sdfDay.parse(endDate);
			diff = (date1.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000) > 0
					? (date1.getTime() - date2.getTime()) / (24 * 60 * 60 * 1000)
					: (date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000);
		} catch (ParseException e) {
		}
		return diff;
	}
	
	/**
	 * 计算当前日期是设定开始日期后的第几周
	 * @param sDate
	 * @return
	 */
	public static Integer getCurWeek(Date sDate) {
		Integer weekNum = 0;
		String d1 = sdfDay.format(new Date());
		String d2 = sdfDay.format(sDate);
		
		Long days = getDateDiff(d1,d2);
		if(days>0){
			weekNum = (days.intValue()/7)+1;
		}else{
			weekNum = 0;
		}
		return weekNum;
	}

	/**
	 * 获得当前日期的年月(yyyy-mm)
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static String getYearMonth() throws ParseException {
		return getYearMonth(new Date());
	}
	
	public static String getYearMonth(String dateStr) throws ParseException {
		Date date = sdfMonth.parse(dateStr);
		return getYearMonth(date);
	}

	public static String getYearMonth(Date date) throws ParseException {
		return sdfMonth.format(date);
	}

	
	public static void main(String[] args) throws ParseException {
		/*//获取指定月的第一天日期和最后一天日期
		String[] yse = getYearStartAndEndDate("2018-2");	   //2018-02-01--2018-02-28
		//String[] yse = getYearStartAndEndDate("2018-6-8");  //2018-06-01--2018-06-30
		System.out.println("getYearStartAndEndDate #"+yse[0]+"--"+yse[1]);
		
		//获取指定月的第一天日期和最后一天日期
		String[] mse = getMonthStartAndEndDate("2018-2");	   //2018-02-01--2018-02-28
		//String[] mse = getMonthStartAndEndDate("2018-6-8");  //2018-06-01--2018-06-30
		System.out.println("getMonthStartAndEndDate #"+mse[0]+"--"+mse[1]);
		
		int diff = getDiffYear("2004-5-28","2030-1-9");
		System.out.println("diff:"+diff);
		
		String afterWeek = getAfterDayWeek("10");
		System.out.println("afterWeek:"+afterWeek);
		
		String[] ymw1 = getYearMonthWeek("2018-2");
		for(String s:ymw1){System.out.println(s);};
		String[] ymw2 = getYearMonthWeek("2018-2-1");
		for(String s:ymw2){System.out.println(s);};
		String[] ymw3 = getYearMonthWeek();
		for(String s:ymw3){System.out.println(s);};*/
		
		/*String[] t1 = getWeekStartandEndDate();
		for(String s:t1){System.out.println(s);};
		String[] t2 = getWeekStartandEndDate("2018-2-1");
		for(String s:t2){System.out.println(s);};
		String[] t3 = getWeekStartandEndDate("2018-2",3);
		for(String s:t3){System.out.println(s);};*/
		
		
		
		
		/*String[] t4 = getYearMonthWeek();
		for(String s:t4){System.out.println(s);};
		
		String[] t5 = getYearMonthWeekDown("2018-2");
		for(String s:t5){System.out.println(s);};
		
		String[] t6 = getYearMonthWeekUp("2018-2");
		for(String s:t6){System.out.println(s);};*/
		
		/*Calendar c = getLocalCalendar();
		c = Calendar.getInstance();
		String dataStr = "2018-2-5";
		System.out.println(dataStr);
		boolean bln = monthFirstDayIsMonday(sdfDay.parse(dataStr));
		if(bln){
			System.out.println("是一个月的第一个星期一");
		}else{
			System.out.println("不是一个月的第一个星期一");
		}
		c.setTime(sdfDay.parse(dataStr));
		
		int w = c.get(Calendar.WEEK_OF_MONTH);
		int d = c.get(Calendar.DAY_OF_WEEK);
		System.out.println("月的第几周："+w);
		System.out.println("是星期几："+(d-1));*/
		
		List<String> lst = new ArrayList<String>();
		lst.add("aa");
		lst.add("bb");
		lst.add("cc");
		System.out.println(lst.size());
		
		
	}
}

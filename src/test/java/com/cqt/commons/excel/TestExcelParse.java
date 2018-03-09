package com.cqt.commons.excel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;

public class TestExcelParse {
	
	
	@Test
	public void readExcel(){
		String filePath = "d://excel";
		String fileName =  "test.xls";
		
		Map<String,Object> parms = new HashMap<String,Object>();
		parms.put("schoolId", new Long(1L));
		parms.put("classesId", new Long(1L));
		
		List<CourseSchedule> courseSchedules = null;
		courseSchedules = ParseExcel.readExcel(filePath, fileName, parms);
		
		for(CourseSchedule cs : courseSchedules){
			System.out.println(cs.getClassName());
			for(CourseItem ci:cs.getLstCourseItem()){
				System.out.println(ci.getTeacherName()+"^^^^^^"+ci.getHeadmaster());
			}
			System.out.println("**********************");
		}
		/*System.out.println("=======================================");
		
		
		String ss = "(Arts&Crafts)杨国颖/梁丽/江慧涛";
		int index1 = ss.indexOf("(");
		int index2 = ss.indexOf(")");
		System.out.println(index1 + "==" + index2);*/
	}
}

package com.cqt.commons.excel;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.cqt.entity.CourseItem;
import com.cqt.entity.CourseSchedule;
import com.cqt.util.Logger;
import com.cqt.util.StringUtil;
import com.cqt.util.UuidUtil;

/**
 * 读取课程表的Excel文件数据
 * @author zhangliang
 *
 */
public class ParseExcel {
	private static Logger log = Logger.getLogger(ParseExcel.class);
	
	public static List<CourseSchedule> readExcel(String filepath, String filename, Map<String,Object> parms){
		return readExcel(filepath, filename, 0, 0, 0, parms, null);
	}
	
	public static List<CourseSchedule> readExcel(String filepath, String filename, Map<String,Object> parms, List<String> errors){
		return readExcel(filepath, filename, 0, 0, 0, parms, errors);
	}
	/**
	 * 
	 * @param filepath	文件目录
	 * @param filename	文件名称
	 * @param startrow 开始读取的行号
	 * @param startcol 开始读取的列号
	 * @param sheetnum 开始读取的sheet
	 * @param parms
	 * @return
	 */
	public static List<CourseSchedule> readExcel(String filepath, String filename, int startrow, int startcol, int sheetnum,Map<String,Object> parms,List<String> errors) {
		List<CourseSchedule> varList = new ArrayList<CourseSchedule>();
		List<CellRangeAddress> listCombineCell = null;
		List<String> _errors = new ArrayList<String>();
		try {
			File target = new File(filepath, filename);
			FileInputStream fi = new FileInputStream(target);
			//XSSFWorkbook wb = new XSSFWorkbook(fi);
			Workbook wb = ExcelCommons.getWorkBook(fi, filename);
			
			for(int num=sheetnum;num<wb.getNumberOfSheets();num++){
				Sheet sheet = wb.getSheetAt(num); 								//sheet 从0开始
				listCombineCell = ExcelCommons.getCombineCell(sheet);
				int rowNum = sheet.getLastRowNum() + 1; 						//取得最后一行的行号
				//创建课程表对象
				CourseSchedule cs = new CourseSchedule();
				String courseScheduleId = UuidUtil.get32UUID();					//自动生成课程表ID
				cs.setCourseScheduleId(courseScheduleId);					
				Object sid = parms.get("schoolId");
				Object cid = parms.get("classesId");
				cs.setSchoolId(sid==null?0L:Long.parseLong(sid.toString())); 	//所属学校ID
				cs.setClassesId(cid==null?0L:Long.parseLong(cid.toString()));	//所属班级ID
				List<CourseItem> items = new ArrayList<CourseItem>();  			//课程表内容
				cs.setLstCourseItem(items);
	
				for (int i=startrow; i <rowNum; i++) {							//行循环开始
					Row row = sheet.getRow(i); 									//行
					int cellNum = row.getLastCellNum(); 						//每行的最后一个单元格位置
					cellNum=cellNum>6?6:cellNum;								//限制只读取6列数据
					
					String sTime = null;
					String eTime = null;
					for (int j = startcol; j < cellNum; j++) {					//列循环开始
						Cell cell = row.getCell(j);								//列
						
						if((i==0 || i==1 || i==3) && j==0){						//读取课表的第一行,第二行,第四行数据
							String cellValue = ExcelCommons.getCellStringValue(cell);
							switch (i) {
							case 0://中文标题
								cs.setTitle(cellValue);
								break;
							case 1://英文标题
								cs.seteTitle(cellValue);
								break;
							/*case 3://课程计划标签
								cs.setCoursePlanLable(cellValue);
								break;*/
							default:
								break;
							}
							break;
						}else if(i==2){
							String cellValue = ExcelCommons.getCellStringValue(cell);
							switch (j) {
							/*case 0://课程表班级名称Lable
								cs.setClassNameLable(cellValue);
								break;*/
							case 1://课程表的班级名称
								cs.setClassName(cellValue);
								break;
							/*case 4://课程表日期Lable
								cs.setCourseDateLable(cellValue);
								break;*/
							case 5://课程表应用的日期
								cs.setCourseDate(cellValue);
								break;
							default:
								break;
							}
						}else if(i==4){//第四行跳过不读取
							break;
						}else{
							//具体课程的按排内容
							//System.out.println("第"+(i+1)+"行,第"+(j+1)+"列");
							String cellValue = ExcelCommons.getCellStringValue(cell);
							if(ExcelCommons.isCombineCell(listCombineCell, cell)){//是合并单元格设置zIndex=0
								CourseItem item = new CourseItem();
								item.setCourseName(cellValue);
								item.setCourseEname("");
								item.setTeacherName("");
								item.setHeadmaster("");
								item.setStartTime(sTime);
								item.setEndTime(eTime);
								item.setzIndex(0);
								item.setCourseScheduleId(courseScheduleId);
								item.setCourseItemId(UuidUtil.get32UUID());
								items.add(item);
								break;
							}else{
								switch (j) {
								case 0: //时间列
									cellValue = cellValue.replaceAll("—", "-");
									if(cellValue.contains("-")){//正常的上课都为00:00-00:00格式
										String[] ts = cellValue.split("-");
										if(ts.length != 2){
											_errors.add(sheet.getSheetName().concat("第"+(i+1)+"行,第"+(j+1)+"列").concat(",时间[").concat(cellValue).concat("]格式不符合：00:00-00:00"));
										}
										sTime = ts[0];
										eTime = ts[1];
									}else{//离校时时间不是时间段的格式
										sTime = cellValue;
										eTime = cellValue;
									}
									break;
								case 1:
								case 2:
								case 3:
								case 4:
								case 5:
									//log.debug("第"+(i+1)+"行,第"+(j+1)+"列");
									//String cellStr = StringUtil.replaceFirstEnter(cellValue, "");
									//cellStr = StringUtil.replaceAllEnter(cellStr, "/");
									String cellStr = StringUtil.replaceAllEnter(cellValue, "#");
									cellStr = StringUtil.replaceFlag(cellStr, "");
									if(null!=cellStr && !"".equals(cellStr)){
										String[] arrays = cellStr.split("#");
										int index1 = arrays[0].lastIndexOf("(");
										int index2 = arrays[0].lastIndexOf(")");
										String courseName = arrays[0].substring(0, index1);
										String coursEname = arrays[0].substring(index1+1,index2);
										
										String teacherName = "";
										if(arrays.length>1){
											teacherName = arrays[1];
										}
										String headmaster = "";
										if(arrays.length>2){
											headmaster = arrays[2];
										}
										CourseItem item = new CourseItem();
										item.setCourseName(courseName);
										item.setCourseEname(coursEname);
										item.setTeacherName(teacherName);
										item.setHeadmaster(headmaster);
										item.setStartTime(sTime);
										item.setEndTime(eTime);
										item.setzIndex(j);
										item.setCourseScheduleId(courseScheduleId);
										item.setCourseItemId(UuidUtil.get32UUID());
										items.add(item);
									}else{
										CourseItem item = new CourseItem();
										item.setCourseName("");
										item.setCourseEname("");
										item.setTeacherName("");
										item.setHeadmaster("");
										item.setStartTime(sTime);
										item.setEndTime(eTime);
										item.setzIndex(j);
										item.setCourseScheduleId(courseScheduleId);
										item.setCourseItemId(UuidUtil.get32UUID());
										items.add(item);
										String error = sheet.getSheetName().concat("第"+(i+1)+"行,第"+(j+1)+"列").concat(",未按排课程！");
										_errors.add(error);
									}
									break;
								default:
									break;
								}
							}
						}
					}
				}
				varList.add(cs);
			}
		} catch (Exception e) {
			log.debug(e.getStackTrace());
		}
		
		if(null!=errors && !_errors.isEmpty()){
			errors.addAll(_errors);
		}
		
		return varList;
	}
}

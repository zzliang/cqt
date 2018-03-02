package com.cqt.commons.excel;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.cqt.util.Logger;

public class ExcelCommons {
	private static Logger logger = Logger.getLogger(ExcelCommons.class);
	private final static String xls = "xls";
	private final static String xlsx = "xlsx";

	/**
	 * 获取单元格中的内容为字符串
	 * 
	 * @param cell
	 * @return
	 */
	public static String getCellStringValue(Cell cell) {
		String cellValue = "";
		/**
		 * NUMERIC(0),STRING(1),FORMULA(2),BLANK(3),BOOLEAN(4),ERROR(5);
		 */
		if (null != cell) {
			switch (cell.getCellType()) { // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
			case 0:
				cellValue = getValueOfNumericCell(cell);
				break;
			case 1:
				cellValue = cell.getStringCellValue();
				break;
			case 2:
				cellValue = cell.getNumericCellValue() + "";
				break;
			case 3:
				cellValue = "";
				break;
			case 4:
				cellValue = String.valueOf(cell.getBooleanCellValue());
				break;
			case 5:
				cellValue = String.valueOf(cell.getErrorCellValue());
				break;
			}
		}
		return cellValue;
	}

	/**
	 * 获取sheet合并单元格集合
	 * 
	 * @param sheet
	 * @return
	 */
	public static List<CellRangeAddress> getCombineCell(Sheet sheet) {
		List<CellRangeAddress> list = new ArrayList<CellRangeAddress>();
		// 获得一个 sheet 中合并单元格的数量
		int sheetmergerCount = sheet.getNumMergedRegions();
		// 遍历合并单元格
		for (int i = 0; i < sheetmergerCount; i++) {
			// 获得合并单元格加入list中
			CellRangeAddress ca = sheet.getMergedRegion(i);
			list.add(ca);
		}
		return list;
	}

	/**
	 * 判断单元格是否为合并单元格
	 * 
	 * @param listCombineCell
	 * @param cell
	 * @return
	 */
	public static Boolean isCombineCell(List<CellRangeAddress> listCombineCell, Cell cell) {
		int firstC = 0;
		int lastC = 0;
		int firstR = 0;
		int lastR = 0;
		for (CellRangeAddress ca : listCombineCell) {
			// 获得合并单元格的起始行, 结束行, 起始列, 结束列
			firstC = ca.getFirstColumn();
			lastC = ca.getLastColumn();
			firstR = ca.getFirstRow();
			lastR = ca.getLastRow();
			if (cell.getColumnIndex() <= lastC && cell.getColumnIndex() >= firstC) {
				if (cell.getRowIndex() <= lastR && cell.getRowIndex() >= firstR) {
					return true;
				}
			}
		}
		return false;
	}

	public static void checkFile(MultipartFile file) throws IOException {
		// 判断文件是否存在
		if (null == file) {
			logger.error("文件不存在！");
			throw new FileNotFoundException("文件不存在！");
		}
		// 获得文件名
		String fileName = file.getOriginalFilename();
		// 判断文件是否是excel文件
		if (!fileName.endsWith(xls) && !fileName.endsWith(xlsx)) {
			logger.error(fileName + "不是excel文件");
			throw new IOException(fileName + "不是excel文件");
		}
	}

	public static Workbook getWorkBook(MultipartFile file) {
		// 获得文件名
		String fileName = file.getOriginalFilename();
		// 创建Workbook工作薄对象，表示整个excel
		Workbook workbook = null;
		try {
			// 获取excel文件的io流
			InputStream is = file.getInputStream();
			// 根据文件后缀名不同(xls和xlsx)获得不同的Workbook实现类对象
			workbook = getWorkBook(is,fileName);
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		return workbook;
	}
	
	public static Workbook getWorkBook(InputStream is,String fileName) {
		Workbook workbook = null;
		try {
			if (fileName.endsWith(xls)) {
				// 2003
				//workbook = new HSSFWorkbook(is);
				workbook = new XSSFWorkbook(is);
			} else if (fileName.endsWith(xlsx)) {
				// 2007
				workbook = new XSSFWorkbook(is);
			}
		} catch (IOException e) {
			logger.info(e.getMessage());
		}
		return workbook;
	}

	public static String getValueOfNumericCell(Cell cell) {
		String cellValue = "";
		SimpleDateFormat sdf = null;
		/**
		 * yyyy-MM-dd----- 14 
		 * yyyy年m月d日--- 31 
		 * yyyy年m月------- 57 
		 * m月d日 ---------- 58 
		 * HH:mm----------- 20 
		 * h时mm分 ------- 32
		 */
		int type = cell.getCellStyle().getDataFormat();
		switch (type) {
		case 14:
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			break;
		case 31:
			sdf = new SimpleDateFormat("yyyy年m月d日");
			break;
		case 57:
			sdf = new SimpleDateFormat("yyyy-MM");
			break;
		case 58:
			sdf = new SimpleDateFormat("MM-dd");
			break;
		case 20:
			sdf = new SimpleDateFormat("HH:mm");
			break;
		case 32:
			sdf = new SimpleDateFormat("h时mm分");
			break;
		default:
			break;
		}

		if (null != sdf) {
			double value = cell.getNumericCellValue();
			Date date = DateUtil.getJavaDate(value);
			cellValue = sdf.format(date);
		} else {
			cellValue = Double.valueOf(cell.getNumericCellValue()).toString();
		}
		return cellValue;
	}
}
